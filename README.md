# super-duper-vanilla-installer
A CLI Frontend installer written in PowerShell for Super Duper Vanilla Pack shaders by @eldeston

For some reason, the installer triggers a false positive from the antivirus landlords which is pointed out by the author of the compiler program that I've used. [Here's the repo's statement about this issue from PS2EXE.](https://github.com/MScholtes/PS2EXE#attention-incorrect-virus-detection)

**__Update:__** To resolve conflicts pertaining the execution of unsigned scripts as a security measure for Powershell, the installer script has been signed with a signed certificate from ATA Authenticode to comply with these new policies, thus ensuring the safety of the program.
___
# So, what is this for?
This installer is originally meant for more convenient shader updating (considering you have to download and extract from the `master` branch all over again which is very inconvenient.). This is a sideproject of mine that I have decided to make for SDVP as part of learning PowerShell as a student.

# ..any special features?
It features a selection page front-end using `$PSCore:Read-Host` which guides the user to properly install the shaderpack to its default location.
-Although some people tend to store their MinecraftJava and Optifine binaries on an another drive which would be implemented on the next revision of the sourcecode.

---
```
WILL BE EXPANDED SOON
```
---
