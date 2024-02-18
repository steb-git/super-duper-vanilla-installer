$validAnswer = $false
$Folder = '~/AppData/Roaming/.minecraft/shaderpacks/Super-Duper-Vanilla'
#$Folder = '~/test' #for debug purposes

# Functions area --
function  isFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$path
    )
    $item = Get-Item $Path
    return $item.PSIsContainer -eq $false
}

## end of functions block

# This section auto-aligns the installer towards the latest stable release, nothing special.

# Get the latest release information
$latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/eldeston/super-duper-vanilla/releases/latest"

# filter from newest
$zipUrl = $latestRelease.zipball_url | Select-Object -First 1
$version = $latestRelease.tag_name | Select-Object -First 1
# $description = $latestRelease.body | Select-Object -First 1

$host.UI.RawUI.BackgroundColor = "Black"
Clear-Host

# Internet detection gate, rewritten
if (-not (Test-Connection -ComputerName github.com -Count 1 -Quiet)) {
    Write-Host "Super Duper Vanilla Pack - Command Line Interface Installer"
    Write-Host "───────────────────────────────────────────────────────────"
    Write-Host
    Write-Host "Shader developed by @Eldeston, installer written by @the_steb"
    Write-Host "Presented by Flamerender Studios"
    Write-Host "GitHub Repository Link: https://github.com/eldeston/super-duper-vanilla"
    Write-Host
    Write-Host "    ┌────┐" -ForegroundColor Red
    Write-Host "    │ ╲╱ │" -ForegroundColor Red -NoNewline
    Write-Host "  This installer requires an active Internet connection in order to function properly."
    Write-Host "    │ ╱╲ │" -ForegroundColor Red -NoNewline
    Write-Host "  Please check your connectivity settings and try again."
    Write-Host "    └────┘" -ForegroundColor Red
    Start-Sleep -Seconds 0.50
    Write-Host
    Start-Sleep -Seconds 0.50
    Write-Host
    Write-Host "┌────────────────────────┐"
    Write-Host '│ Press any key to exit. │'
    Write-Host "└────────────────────────┘"
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

While(-not $validAnswer)
{
    $yn = Read-Host "`nSuper Duper Vanilla Pack - Command Line Interface Installer`n───────────────────────────────────────────────────────────`n`nShader developed by @Eldeston, installer written by @the_steb`nPresented by Flamerender Studios`nGitHub Repository Link: https://github.com/eldeston/super-duper-vanilla`n`n┌──────────────────────────────────────────┐`n│ How would you like SDVP to be installed? │`n└──────────────────────────────────────────┘`n`n    1 - Install Stable Release`n    2 - Install Development Release (NOTE: Might be very unstable but usually has newer features.)`n    3 - Exit to Windows.`n`n>"
    Switch($yn.ToLower())
    {
        # Stable Release option tree
        "1" {$validAnswer = $true
        Clear-Host
        Write-Host
        Write-Host 'Super Duper Vanilla Pack - Command Line Interface Installer > Install Stable Release'
        Write-Host "──────────────────────────────────────────"
        Write-Host
        Write-Host 'Checking for existing SDVP installations...'
        Write-Host ''
        Start-Sleep -Seconds 0.75
        if (Test-Path -Path $Folder) {
            # Installation check gate for stable
            $updateStable = read-host "An existing installation of SDVP was found on your shaderpacks directory. Would you like to update it or perform a clean install instead?`n`n    1 - Update SDVP (Backs up shader configs)`n    2 - Reinstall SDVP (Removes EVERYTHING from the SDVP folder, giving it a fresh install)`n    3 - Cancel Installation and return to Windows`n`n>"

            if ($updateStable -eq 1){ # nest for updateStable
                Write-Host 'Backing up shader configuration file...'
                 # move-tool param goes here; will not yet implement until i figure out how it works, for now.
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host "Starting update from stable channel with version $version..." -ForegroundColor Green
                Invoke-WebRequest -uri $zipUrl -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath  '~/AppData/Roaming/.minecraft/shaderpacks'
                Rename-Item -Path (Get-ChildItem -Path "~/AppData/Roaming/.minecraft/shaderpacks" -Directory | Sort-Object -Property CreationTime -Descending | Select-Object -First 1) -NewName "Super-Duper-Vanilla"
                Remove-Item 'super-duper-vanilla_stable.zip'
                Write-Host "──────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌─────┐" -ForegroundColor Green
                Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
                Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
                Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
                Write-Host "   Installation method: updateStable"
                Write-Host "    └─────┘" -ForegroundColor Green
                Write-Host
                Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
                Start-Sleep -Seconds 0.50
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
                 }
         else{
          # -intentionally left blank
            }
            

            if ($updateStable -eq 2){ # nest for cleanInstallStable
                Write-Host 'Clearing previous versions of SDVP...'
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Write-Host 'shaderpacks/Super-Duper-Vanilla was wiped clean!'
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host "Starting clean installation from stable channel with version $version..." -ForegroundColor Green
                Invoke-WebRequest -uri $zipUrl -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath  '~/AppData/Roaming/.minecraft/shaderpacks'
                Rename-Item -Path (Get-ChildItem -Path "~/AppData/Roaming/.minecraft/shaderpacks" -Directory | Sort-Object -Property CreationTime -Descending | Select-Object -First 1) -NewName "Super-Duper-Vanilla"
                Remove-Item 'super-duper-vanilla_stable.zip'
                Write-Host "──────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌─────┐" -ForegroundColor Green
                Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
                Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
                Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
                Write-Host "   Installation method: cleanInstallStable"
                Write-Host "    └─────┘" -ForegroundColor Green
                Write-Host
                Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
                Start-Sleep -Seconds 0.50
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
                # -intentionally left blank
            }

            if ($updateStable -eq 3){
                Write-Host "───────────────────────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌────┐" -ForegroundColor Red
                Write-Host "    │ ╲╱ │" -ForegroundColor Red -NoNewline
                Write-Host "  Installation was aborted."
                Write-Host "    │ ╱╲ │" -ForegroundColor Red -NoNewline
                Write-Host "  No changes were made to your computer."
                Write-Host "    └────┘" -ForegroundColor Red
                Start-Sleep -Seconds 0.50
                Write-Host
                Start-Sleep -Seconds 0.50
                Write-Host
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
            # -intentionally left blank
            }
        } 
        # If there is no previous version of SDVP present, an else statement will trigger instead.
    else { # nest for quickInstallStable 
    	Write-Host "──────────────────────────────────────────"
        Write-Host "It looks like there isn't any existing installations of SDVP on this computer."
        Write-Host 'Performing quick install, buckle up!' -ForegroundColor Blue
        # Creates the directory for shaderpacks if it has not yet been created yet, just in case.++
        if ((Test-Path -path "~/AppData/Roaming/.minecraft/shaderpacks") -eq $true) {} 
        else {
            Write-Host "[ WARNING ] " -NoNewline -ForegroundColor Yellow
            Write-Host "Shaderpacks directory is not present"
            Write-Host "Creating directory (~/AppData/Roaming/.minecraft/shaderpacks)..."
            New-Item -Path "~/AppData/Roaming/.minecraft/shaderpacks" -ItemType Directory
        }
        Write-Host "Shaderpack directory is present! Proceeding installation..." -ForegroundColor Cyan 
        Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host "Performing quick installation from stable channel with version $version..." -ForegroundColor Green
        Invoke-WebRequest -uri $zipUrl -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
        Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath  '~/AppData/Roaming/.minecraft/shaderpacks'
        Rename-Item -Path (Get-ChildItem -Path "~/AppData/Roaming/.minecraft/shaderpacks" -Directory | Sort-Object -Property CreationTime -Descending | Select-Object -First 1) -NewName "Super-Duper-Vanilla"
        Remove-Item 'super-duper-vanilla_stable.zip'
        Write-Host "──────────────────────────────────────────"
        Write-Host
        Write-Host "    ┌─────┐" -ForegroundColor Green
        Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
        Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
        Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
        Write-Host "   Installation method: quickInstallStable"
        Write-Host "    └─────┘" -ForegroundColor Green
        Write-Host
        Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
        Start-Sleep -Seconds 0.50
        Write-Host "┌────────────────────────┐"
        Write-Host '│ Press any key to exit. │'
        Write-Host "└────────────────────────┘"
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        exit
        }
    }
            # Dev Option tree
        "2" {$validAnswer = $true
            Clear-Host
            Write-Host
            Write-Host 'Super Duper Vanilla Pack - Command Line Interface Installer > Install Dev Release'
            Write-Host "──────────────────────────────────────────"
            Write-Host ""
            Write-Host 'Checking for existing SDVP installations...'
            Write-Host ""
        Start-Sleep -Seconds 0.75
        if (Test-Path -Path $Folder) {
            # Installation check gate for stable
            $updateDev = read-host "An existing installation of SDVP was found on your shaderpacks directory. Would you like to update it or perform a clean install instead?`n`n    1 - Update SDVP (Backs up shader configs)`n    2 - Reinstall SDVP (Removes EVERYTHING from the SDVP folder, giving it a fresh install)`n    3 - Cancel Installation and return to Windows`n`n>"

            # If a recent installation was found, installer will trigger another read-host switch for dev
            # If user decides to update using dev:
            if ($updateDev -eq 1){ # nest for updateDev
                Write-Host 'Backing up shader configuration file...'
                # move-tool param here:
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting update from dev channel...' -ForegroundColor Green
                Write-Host 'NOTE: Some features might be unstable.'
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force )
                Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
                Remove-Item 'super-duper-vanilla_dev.zip'
                Write-Host "──────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌─────┐" -ForegroundColor Green
                Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
                Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
                Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
                Write-Host "   Installation method: updateDev"
                Write-Host "    └─────┘" -ForegroundColor Green
                Write-Host
                Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
                Start-Sleep -Seconds 0.50
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
             }else{
             # -intentionally left blank
            }
            # If user decides to clean install using dev:
            if ($updateDev -eq 2){ #nest for cleanInstallDev
                Write-Host 'Clearing previous versions of SDVP...'
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force 
                Write-Host 'shaderpacks/Super-Duper-Vanilla was wiped clean!'
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting clean installation from dev channel...' -ForegroundColor Green
                Write-Host 'NOTE: Some features might be unstable.'
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
                Remove-Item 'super-duper-vanilla_dev.zip'
                Write-Host "──────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌─────┐" -ForegroundColor Green
                Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
                Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
                Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
                Write-Host "   Installation method: cleanInstallDev"
                Write-Host "    └─────┘" -ForegroundColor Green
                Write-Host
                Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
                Start-Sleep -Seconds 0.50
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
            # -intentionally left blank
            }
            # Aborts installation until i learn how to do backward swtches, so this stays as a workaround.
            if ($updateDev -eq 3){
                Write-Host "───────────────────────────────────────────────────────────"
                Write-Host
                Write-Host "    ┌────┐" -ForegroundColor Red
                Write-Host "    │ ╲╱ │" -ForegroundColor Red -NoNewline
                Write-Host "  Installation was aborted."
                Write-Host "    │ ╱╲ │" -ForegroundColor Red -NoNewline
                Write-Host "  No changes were made to your computer."
                Write-Host "    └────┘" -ForegroundColor Red
                Start-Sleep -Seconds 0.50
                Write-Host
                Start-Sleep -Seconds 0.50
                Write-Host
                Write-Host "┌────────────────────────┐"
                Write-Host '│ Press any key to exit. │'
                Write-Host "└────────────────────────┘"
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
            # -intentionally left blank
            }
        } 
    else {
        # If there is no previous version of SDVP present, an else statement will trigger instead for dev
	Write-Host
        Write-Host "It looks like there isn't any existing installations of SDVP on this computer."
        Write-Host 'Performing quick install, buckle up!' -ForegroundColor Blue
        # Creates the directory for shaderpacks if it has not yet been created yet, just in case.++
        if ((Test-Path -path "~/AppData/Roaming/.minecraft/shaderpacks") -eq $true) {} 
            else {
                Write-Host "[ WARNING ] " -NoNewline -ForegroundColor Yellow
                Write-Host "Shaderpacks directory is not present"
                Write-Host "Creating directory (~/AppData/Roaming/.minecraft/shaderpacks)..."
                New-Item -Path "~/AppData/Roaming/.minecraft/shaderpacks" -ItemType Directory
                }
                Write-Host "Shaderpack directory is present! Proceeding installation..." -ForegroundColor Cyan 
        Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host 'Performing quick installation from dev channel...' -ForegroundColor Green
        Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force )
        Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force
        Remove-Item 'super-duper-vanilla_dev.zip'
        Write-Host "──────────────────────────────────────────"
        Write-Host
        Write-Host "    ┌─────┐" -ForegroundColor Green
        Write-Host "    │   ╱ │" -ForegroundColor Green -NoNewline
        Write-Host "   Super Duper Vanilla was successfully installed!" -ForegroundColor Green
        Write-Host "    │ ╲╱  │" -ForegroundColor Green -NoNewline
        Write-Host "   Installation method: quickInstallDev"
        Write-Host "    └─────┘" -ForegroundColor Green
        Write-Host
        Write-Host "You may report issues or submit feature requests on our Discord server: https://dsc.gg/flamerender"
        Start-Sleep -Seconds 0.50
        Write-Host "┌────────────────────────┐"
        Write-Host '│ Press any key to exit. │'
        Write-Host "└────────────────────────┘"
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        exit
        }
    }
            #Abort
        "3" {$validAnswer = $true
            Write-Host "───────────────────────────────────────────────────────────"
            Write-Host
            Write-Host "    ┌────┐" -ForegroundColor Red
            Write-Host "    │ ╲╱ │" -ForegroundColor Red -NoNewline
            Write-Host "  Installation was aborted."
            Write-Host "    │ ╱╲ │" -ForegroundColor Red -NoNewline
            Write-Host "  No changes were made to your computer."
            Write-Host "    └────┘" -ForegroundColor Red
            Start-Sleep -Seconds 0.50
            Write-Host
            Start-Sleep -Seconds 0.50
            Write-Host
            Write-Host "┌────────────────────────┐"
            Write-Host '│ Press any key to exit. │'
            Write-Host "└────────────────────────┘"
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
            exit
        }
        Default {
        	Clear-Host
            Write-Host "┌──────────────────────────────────────────────────────┐"
		    Write-Host "│ That wasn't quite right, maybe give it another shot? │"
            Write-Host "└──────────────────────────────────────────────────────┘"
        }

    }
}

# DEBUG PURPOSES
#Set-Location -Path ~/Downloads
