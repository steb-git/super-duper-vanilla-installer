# super-duper-vanilla-installer
A CLI Frontend installer written in PowerShell for Super Duper Vanilla Pack shaders by @eldeston

![](https://raw.githubusercontent.com/steb-git/super-duper-vanilla-installer/main/Screenshot%202024-02-17%20214332.png)

~~For some reason, the installer triggers a false positive from the antivirus landlords which is pointed out by the author of the compiler program that I've used. [Here's the repo's statement about this issue from PS2EXE.](https://github.com/MScholtes/PS2EXE#attention-incorrect-virus-detection)~~ PS2EXE versions of the installer are long deprecated and are considered outdated, obsolete.

**__Update:__** To resolve conflicts pertaining the execution of unsigned scripts as a security measure for Powershell, the installer script has been signed with a signed certificate from ATA Authenticode to comply with these new policies, thus ensuring the safety of the program.
___
# So, what is this for?
This installer is originally meant for more convenient shader updating (considering you have to download and extract from the `master` branch all over again which is very inconvenient.). This is a sideproject of mine that I have decided to make for SDVP as part of learning PowerShell as a student.
___
## Installation
You may use this installer to install SDVP using these following methods:
* Remote Installation (Recommended)
* Manual Installation
* Intricate Installation

## Remote Installation (Recommended) 
This method is by far the most fastest way to use the installer script. Recommended for first-time users.

1. Bring up the Windows-X menu by pressing the keybind <kbd>⊞ Win</kbd>+<kbd>X</kbd> and select either **Terminal** or **Windows Powershell**.
> Note: It is not recommended to execute the installer on a terminal session with administrator privileges.
2. Paste these lines below on the terminal window to launch the installer remotely:
```pwsh
// Paste this first to allow the execution of remote scripts (this only takes effect on the current session, and usually goes back to default after exiting a terminal session.)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass 

// Paste this line afterwards to start the installer.
irm https://raw.githubusercontent.com/steb-git/super-duper-vanilla-installer/main/sdvp_cli_installer.ps1 | iex
```
3. Proceed with the installation.

## Manual Installation
This method allows users to have more control over the installation process, suitable if you'd like to keep a copy of the installation script for future use.
1. Download the installer script [By long-pressing/rightclicking this hyperlink](https://raw.githubusercontent.com/steb-git/super-duper-vanilla-installer/main/sdvp_cli_installer.ps1) and select **Save file as**.
> Note: A false positive might be triggered while downloading the script, you can simply ignore it and proceed with the installation. (Windows SmartScreen and Defender usually misflags programs which contains specific lines of code that are commonly used to hand out *nefarious* actions such as file replacement, which is an essential feature for the installer's process.)
___
# ..any special features?
It features a selection page front-end using `$PSCore:Read-Host` which guides the user to properly install the shaderpack to its default location.
-Although some people tend to store their MinecraftJava and Optifine binaries on an another drive which would be implemented on the next revision of the sourcecode.

---
```
WILL BE EXPANDED SOON
```
---
