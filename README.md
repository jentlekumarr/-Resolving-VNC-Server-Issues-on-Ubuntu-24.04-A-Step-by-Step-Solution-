🚀 Resolving VNC Server Issues on Ubuntu 24.04: A Step-by-Step Solution 🚀

After upgrading from Ubuntu 22 to 24.04, we encountered significant challenges with our VNC server setup. The upgrade caused the VNC server to stop functioning, disrupting our remote access capabilities and workflow. Determined to find a solution, we developed a shell script to automate the setup of x11vnc, which has proven to be a game-changer. This project was accomplished in collaboration with Dhruv Singh.

The Challenge:
Post-upgrade, attempts to configure the VNC server resulted in various errors, leaving us unable to access our system remotely. This was particularly frustrating, as remote access is crucial for our productivity. We needed a reliable solution to restore functionality quickly.
The Solution:
To address this issue, we created a shell script that streamlines the installation and configuration of x11vnc. Here’s a breakdown of what the script does:

Installation of LightDM: The script begins by installing the LightDM display manager, which is essential for managing graphical sessions on Ubuntu. This step ensures that the system has a proper display manager in place.

Reboot: After installing LightDM, the script prompts a system reboot to apply the changes and ensure that the display manager is running correctly.

Installation of x11vnc: Once the system is back up, the script proceeds to install x11vnc, a versatile VNC server that allows for remote access to the graphical desktop.

Creating the x11vnc Service File: The script then creates a service file for x11vnc, enabling it to run as a service. This step is crucial for ensuring that the VNC server can be managed easily and starts automatically when needed.

Starting the x11vnc Service: Finally, the script starts the x11vnc service, allowing for immediate remote access to the system.

The Outcome:
By running this shell script in the terminal, we successfully restored VNC server functionality on our upgraded Ubuntu 24.04 system. This solution not only resolved our immediate issue but also serves as a reusable tool for anyone facing similar challenges in the future.

