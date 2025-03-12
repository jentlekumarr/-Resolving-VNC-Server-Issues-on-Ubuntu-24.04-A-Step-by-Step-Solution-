#!/bin/bash

# Temporary file to track if the script has been run after installing lightdm
SCRIPT_RUN_FLAG="/tmp/setup_x11vnc_done"

# Function to install lightdm
install_lightdm() {
    echo "Installing lightdm..."
    sudo apt update
    sudo apt install lightdm -y
    echo "Lightdm installed. The system will reboot now."
    sudo reboot
}

# Function to install x11vnc and create the service
setup_x11vnc() {
    echo "Installing x11vnc..."
    sudo apt install x11vnc -y

    # Create x11vnc service file
    echo "Creating x11vnc service file..."
    sudo bash -c 'cat << EOF > /lib/systemd/system/x11vnc.service
[Unit]
Description=x11vnc.service
After=display-manager.service network.target syslog.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd tata1.13
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

    # Reload systemd to recognize the new service
    echo "Reloading systemd..."
    sudo systemctl daemon-reload

    # Enable and start the x11vnc service
    echo "Enabling and starting x11vnc service..."
    sudo systemctl enable x11vnc.service
    sudo systemctl start x11vnc.service

    echo "Setup complete. x11vnc service is now running."
    # Create a flag file to indicate that the script has been run
    touch "$SCRIPT_RUN_FLAG"
}

# Check if lightdm is installed
if ! dpkg -l | grep -q lightdm; then
    install_lightdm
else
    # If lightdm is installed, check if the script has been run before
    if [ ! -f "$SCRIPT_RUN_FLAG" ]; then
        setup_x11vnc
    else
        echo "x11vnc setup has already been completed. No further action is needed."
    fi
fi
