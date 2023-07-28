$validAnswer = $false
$Folder = '~/AppData/Roaming/.minecraft/shaderpacks/Super-Duper-Vanilla'
#$Folder = '~/test' #for debug purposes
$host.UI.RawUI.BackgroundColor = "Black"
Clear-Host
While(-not $validAnswer)
{
    $yn = Read-Host "`nSuper Duper Vanilla Pack - Command Line Interface Installer`nDeveloped by @Eldeston, installer written by @the_steb`nPresented by Flamerender Studios`nGitHub Repository Link: https://github.com/eldeston/super-duper-vanilla`n`nHow would you like SDVP to be installed?`n`n1 - Install Stable Release`n2 - Install Development Release (NOTE: Might be very unstable but usually has newer features.)`n3 - Exit to Windows.`n`n>"
    Switch($yn.ToLower())
    {
        # Stable Release option tree
        "1" {$validAnswer = $true
        Clear-Host
        Write-Host
        Write-Host 'Super Duper Vanilla Pack - Command Line Interface Installer > Install Stable Release'
        Write-Host
        Write-Host 'Checking for existing SDVP installations...'
        Start-Sleep -Seconds 0.75
        if (Test-Path -Path $Folder) {
            # Installation check gate for stable
            $updateStable = read-host "An existing installation of SDVP was found on your shaderpacks directory. Would you like to update it or perform a clean install instead?`n`n1 - Update SDVP (Backs up shader configs)`n2 - Reinstall SDVP (Removes EVERYTHING from the SDVP folder, giving it a fresh install)`n3 - Cancel Installation and return to Windows`n`n>"

            if ($updateStable -eq 1){
                Write-Host 'Backing up shader configuration file...'
                # move-tool param here:
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting update from stable channel...' -ForegroundColor Green
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/tags/v1.3.0-beta.3.zip" -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
                Remove-Item 'super-duper-vanilla_stable.zip'
                Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
                Write-Host 'Installation method: quickInstallStable'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Press any key to exit.'
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                 exit
                 }
         else{
          # -intentionally left blank
            }
            

            if ($updateStable -eq 2){
                Write-Host 'Clearing previous versions of SDVP...'
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Write-Host 'shaderpacks/Super-Duper-Vanilla was wiped clean!'
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting clean installation from stable channel...' -ForegroundColor Green
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/tags/v1.3.0-beta.3.zip" -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath 'Super-Duper-Vanilla' -Force
                Remove-Item 'super-duper-vanilla_stable.zip'
                Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
                Write-Host 'Installation method: cleanInstallStable'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Press any key to exit.'
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
                # -intentionally left blank
            }

            if ($updateStable -eq 3){
                Write-Host 'Installation was aborted.'
                Write-Host
                Write-Host 'Press any key to exit.'
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                 exit
            }else{
            # -intentionally left blank
            }
        } 
        # If there is no previous version of SDVP present, an else statement will trigger instead.
    else {
    	Write-Host
        Write-Host "It looks like there isn't any existing installations of SDVP on this computer."
        Write-Host 'Performing quick install, buckle up!' -ForegroundColor Blue
        Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host 'Performing quick installation from stable channel...' -ForegroundColor Green
        Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/tags/v1.3.0-beta.3.zip" -OutFile ( New-Item -Path "super-duper-vanilla_stable.zip" -Force ) 
        Expand-Archive -Path 'super-duper-vanilla_stable.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
        Remove-Item 'super-duper-vanilla_stable.zip'
        Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
        Write-Host 'Installation method: quickInstallStable'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host 'Press any key to exit.'
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        exit
        }
    }
            # Dev Option tree
        "2" {$validAnswer = $true
            Clear-Host
            Write-Host
            Write-Host 'Super Duper Vanilla Pack - Command Line Interface Installer > Install Dev Release'
            Write-Host
            Write-Host 'Checking for existing SDVP installations...'
        Start-Sleep -Seconds 0.75
        if (Test-Path -Path $Folder) {
            # Installation check gate for stable
            $updateDev = read-host "An existing installation of SDVP was found on your shaderpacks directory. Would you like to update it or perform a clean install instead?`n`n1 - Update SDVP (Backs up shader configs)`n2 - Reinstall SDVP (Removes EVERYTHING from the SDVP folder, giving it a fresh install)`n3 - Cancel Installation and return to Windows`n`n>"

            # If a recent installation was found, installer will trigger another read-host switch for dev
            # If user decides to update using dev:
            if ($updateDev -eq 1){
                Write-Host 'Backing up shader configuration file...'
                # move-tool param here:
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting update from dev channel...' -ForegroundColor Green
                Write-Host 'NOTE: Might be unstable'
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force )
                Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
                Remove-Item 'super-duper-vanilla_dev.zip'
                Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
                Write-Host 'Installation method: updateDev'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Press any key to exit.'
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                 exit
             }else{
             # -intentionally left blank
            }
            # If user decides to clean install using dev:
            if ($updateDev -eq 2){
                Write-Host 'Clearing previous versions of SDVP...'
                Remove-Item '~\AppData\Roaming\.minecraft\shaderpacks\Super-Duper-Vanilla' -Recurse -Confirm:$false -Force 
                Write-Host 'shaderpacks/Super-Duper-Vanilla was wiped clean!'
                Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Starting clean installation from dev channel...' -ForegroundColor Green
                Write-Host 'NOTE: Might be unstable'
                Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force ) 
                Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force 
                Remove-Item 'super-duper-vanilla_dev.zip'
                Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
                Write-Host 'Installation method: cleanInstallDev'
                Write-Host
                Start-Sleep -Seconds 0.25
                Write-Host 'Press any key to exit.'
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
                exit
            }else{
            # -intentionally left blank
            }
            # Aborts installation until i learn how to do backward swtches, so this stays as a workaround.
            if ($updateDev -eq 3){
                Write-Host 'Installation was aborted.'
                Write-Host
                Write-Host 'Press any key to exit.'
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
        Set-Location -Path '~/AppData/Roaming/.minecraft/shaderpacks'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host 'Performing quick installation from dev channel...' -ForegroundColor Green
        Invoke-WebRequest -uri "https://github.com/Eldeston/Super-Duper-Vanilla/archive/refs/heads/master.zip" -OutFile ( New-Item -Path "super-duper-vanilla_dev.zip" -Force )
        Expand-Archive -Path 'super-duper-vanilla_dev.zip' -DestinationPath 'Super-Duper-Vanilla' -Force
        Remove-Item 'super-duper-vanilla_dev.zip'
        Write-Host 'Super Duper Vanilla was successfully installed!' -ForegroundColor Green
        Write-Host 'Installation method: quickInstallDev'
        Write-Host
        Start-Sleep -Seconds 0.25
        Write-Host 'Press any key to exit.'
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        exit}
    }
            #Abort
        "3" {$validAnswer = $true
            Write-Host 'Installation was aborted.'
            Write-Host
            Write-Host 'Press any key to exit.'
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        }
        Default {
        	Clear-Host
		Write-Host "That wasn't quite right, maybe give it another shot?"}
    }
}

# SIG # Begin signature block
# MIIbwAYJKoZIhvcNAQcCoIIbsTCCG60CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAExxdeJT9plvd/
# 6O5ZHS/+dOEmNWx9LTH5G8gFfcgiUKCCFhEwggMGMIIB7qADAgECAhAlQMEncgI9
# tUBdOWpggL6HMA0GCSqGSIb3DQEBCwUAMBsxGTAXBgNVBAMMEEFUQSBBdXRoZW50
# aWNvZGUwHhcNMjMwNzI4MDU1NzQ0WhcNMjQwNzI4MDYxNzQ0WjAbMRkwFwYDVQQD
# DBBBVEEgQXV0aGVudGljb2RlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
# AQEA6NoxGWwlwN4dcwtEaRlSUPQkOpL885rF3CGIFw2fcfD/c5nx3hq1AJU3NpLr
# HhdNRQZmHG5QjGBuz9E+1mmIiXftV9uCx6uyGZqJkytahybXd44HpjF8Z82OHY0k
# dvyqIRd0UjP0tY2pe32vzQzOgT0yplzw1OSsn3cH3tU6PN6CEiFsP/dD64GhkVz0
# sPmReeZBxS+d+AUey8/Jo1bRm2lzTM56TAHE5ltueMpH6N/T2DRFPxpyUFQKo7LP
# Zi84Fc848OVByeRy0nRulVqhIEWQJ3VDIftkwX4ATh/pTNDJiPjAbez7/6oip/Ju
# /mukX5DOxbyCPg5/Ke9bB+lbDQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYD
# VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFAFnF6/EvVPxRjWpsi1x6DKOcUcV
# MA0GCSqGSIb3DQEBCwUAA4IBAQB0Rlwum3yNlRds/rhE3XjxPS99GdAmwIa6Xcu9
# WSPr4VYgRxhrDwCSblBtMZxNr6QQ0PPMGZfxpw3/f0IUpcrobtQj1wW1n6Y3Ve4j
# FR+iTJm0rvr8hRiVQhEpem2Sru8EOiYt1YuSfmnY2Zi5Ebxr5hShDosO6pTNQEJ/
# xb0lGa2w8Su/C8h6fR1mb3j6a2UM3jninUvTpCNxOC/Y9lIZsQ7GkhQ3B5SA7sUX
# vlEnRr7xCZnmbpmVltc2+5gvIpFZGSm6xtHC46SFaPShEtKhkiLyWBeshM/x/fRC
# E5KtpXiwNYMMHjBQTIIApfEmnulUV5e6r/j1t4z9YwmPi/CRMIIFjTCCBHWgAwIB
# AgIQDpsYjvnQLefv21DiCEAYWjANBgkqhkiG9w0BAQwFADBlMQswCQYDVQQGEwJV
# UzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQu
# Y29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMjIw
# ODAxMDAwMDAwWhcNMzExMTA5MjM1OTU5WjBiMQswCQYDVQQGEwJVUzEVMBMGA1UE
# ChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYD
# VQQDExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwggIiMA0GCSqGSIb3DQEBAQUA
# A4ICDwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz7MKnJS7JIT3yithZwuEppz1Y
# q3aaza57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS5F/WBTxSD1Ifxp4VpX6+n6lX
# FllVcq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7bXHiLQwb7iDVySAdYyktzuxe
# TsiT+CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfISKhmV1efVFiODCu3T6cw2Vbu
# yntd463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jHtrHEtWoYOAMQjdjUN6QuBX2I
# 9YI+EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14Ztk6MUSaM0C/CNdaSaTC5qmg
# Z92kJ7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2h4mXaXpI8OCiEhtmmnTK3kse
# 5w5jrubU75KSOp493ADkRSWJtppEGSt+wJS00mFt6zPZxd9LBADMfRyVw4/3IbKy
# Ebe7f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPRiQfhvbfmQ6QYuKZ3AeEPlAwh
# HbJUKSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ERElvlEFDrMcXKchYiCd98THU/
# Y+whX8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4KJpn15GkvmB0t9dmpsh3lGwID
# AQABo4IBOjCCATYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU7NfjgtJxXWRM
# 3y5nP+e6mK4cD08wHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNtyA8wDgYD
# VR0PAQH/BAQDAgGGMHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDov
# L29jc3AuZGlnaWNlcnQuY29tMEMGCCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5k
# aWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3J0MEUGA1UdHwQ+
# MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3Vy
# ZWRJRFJvb3RDQS5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
# A4IBAQBwoL9DXFXnOF+go3QbPbYW1/e/Vwe9mqyhhyzshV6pGrsi+IcaaVQi7aSI
# d229GhT0E0p6Ly23OO/0/4C5+KH38nLeJLxSA8hO0Cre+i1Wz/n096wwepqLsl7U
# z9FDRJtDIeuWcqFItJnLnU+nBgMTdydE1Od/6Fmo8L8vC6bp8jQ87PcDx4eo0kxA
# GTVGamlUsLihVo7spNU96LHc/RzY9HdaXFSMb++hUD38dglohJ9vytsgjTVgHAID
# yyCwrFigDkBjxZgiwbJZ9VVrzyerbHbObyMt9H5xaiNrIv8SuFQtJ37YOtnwtoeW
# /VvRXKwYw02fc7cBqZ9Xql4o4rmUMIIGrjCCBJagAwIBAgIQBzY3tyRUfNhHrP0o
# ZipeWzANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
# aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhE
# aWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwHhcNMjIwMzIzMDAwMDAwWhcNMzcwMzIy
# MjM1OTU5WjBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4x
# OzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGlt
# ZVN0YW1waW5nIENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxoY1
# BkmzwT1ySVFVxyUDxPKRN6mXUaHW0oPRnkyibaCwzIP5WvYRoUQVQl+kiPNo+n3z
# nIkLf50fng8zH1ATCyZzlm34V6gCff1DtITaEfFzsbPuK4CEiiIY3+vaPcQXf6sZ
# Kz5C3GeO6lE98NZW1OcoLevTsbV15x8GZY2UKdPZ7Gnf2ZCHRgB720RBidx8ald6
# 8Dd5n12sy+iEZLRS8nZH92GDGd1ftFQLIWhuNyG7QKxfst5Kfc71ORJn7w6lY2zk
# psUdzTYNXNXmG6jBZHRAp8ByxbpOH7G1WE15/tePc5OsLDnipUjW8LAxE6lXKZYn
# LvWHpo9OdhVVJnCYJn+gGkcgQ+NDY4B7dW4nJZCYOjgRs/b2nuY7W+yB3iIU2YIq
# x5K/oN7jPqJz+ucfWmyU8lKVEStYdEAoq3NDzt9KoRxrOMUp88qqlnNCaJ+2RrOd
# OqPVA+C/8KI8ykLcGEh/FDTP0kyr75s9/g64ZCr6dSgkQe1CvwWcZklSUPRR8zZJ
# TYsg0ixXNXkrqPNFYLwjjVj33GHek/45wPmyMKVM1+mYSlg+0wOI/rOP015LdhJR
# k8mMDDtbiiKowSYI+RQQEgN9XyO7ZONj4KbhPvbCdLI/Hgl27KtdRnXiYKNYCQEo
# AA6EVO7O6V3IXjASvUaetdN2udIOa5kM0jO0zbECAwEAAaOCAV0wggFZMBIGA1Ud
# EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFLoW2W1NhS9zKXaaL3WMaiCPnshvMB8G
# A1UdIwQYMBaAFOzX44LScV1kTN8uZz/nupiuHA9PMA4GA1UdDwEB/wQEAwIBhjAT
# BgNVHSUEDDAKBggrBgEFBQcDCDB3BggrBgEFBQcBAQRrMGkwJAYIKwYBBQUHMAGG
# GGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1aHR0cDovL2Nh
# Y2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5jcnQwQwYD
# VR0fBDwwOjA4oDagNIYyaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
# VHJ1c3RlZFJvb3RHNC5jcmwwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9
# bAcBMA0GCSqGSIb3DQEBCwUAA4ICAQB9WY7Ak7ZvmKlEIgF+ZtbYIULhsBguEE0T
# zzBTzr8Y+8dQXeJLKftwig2qKWn8acHPHQfpPmDI2AvlXFvXbYf6hCAlNDFnzbYS
# lm/EUExiHQwIgqgWvalWzxVzjQEiJc6VaT9Hd/tydBTX/6tPiix6q4XNQ1/tYLaq
# T5Fmniye4Iqs5f2MvGQmh2ySvZ180HAKfO+ovHVPulr3qRCyXen/KFSJ8NWKcXZl
# 2szwcqMj+sAngkSumScbqyQeJsG33irr9p6xeZmBo1aGqwpFyd/EjaDnmPv7pp1y
# r8THwcFqcdnGE4AJxLafzYeHJLtPo0m5d2aR8XKc6UsCUqc3fpNTrDsdCEkPlM05
# et3/JWOZJyw9P2un8WbDQc1PtkCbISFA0LcTJM3cHXg65J6t5TRxktcma+Q4c6um
# AU+9Pzt4rUyt+8SVe+0KXzM5h0F4ejjpnOHdI/0dKNPH+ejxmF/7K9h+8kaddSwe
# Jywm228Vex4Ziza4k9Tm8heZWcpw8De/mADfIBZPJ/tgZxahZrrdVcA6KYawmKAr
# 7ZVBtzrVFZgxtGIJDwq9gdkT/r+k0fNX2bwE+oLeMt8EifAAzV3C+dAjfwAL5HYC
# JtnwZXZCpimHCUcr5n8apIUP/JiW9lVUKx+A+sDyDivl1vupL0QVSucTDh3bNzga
# oSv27dZ8/DCCBsAwggSooAMCAQICEAxNaXJLlPo8Kko9KQeAPVowDQYJKoZIhvcN
# AQELBQAwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTsw
# OQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVT
# dGFtcGluZyBDQTAeFw0yMjA5MjEwMDAwMDBaFw0zMzExMjEyMzU5NTlaMEYxCzAJ
# BgNVBAYTAlVTMREwDwYDVQQKEwhEaWdpQ2VydDEkMCIGA1UEAxMbRGlnaUNlcnQg
# VGltZXN0YW1wIDIwMjIgLSAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAz+ylJjrGqfJru43BDZrboegUhXQzGias0BxVHh42bbySVQxh9J0Jdz0Vlggv
# a2Sk/QaDFteRkjgcMQKW+3KxlzpVrzPsYYrppijbkGNcvYlT4DotjIdCriak5Lt4
# eLl6FuFWxsC6ZFO7KhbnUEi7iGkMiMbxvuAvfTuxylONQIMe58tySSgeTIAehVbn
# he3yYbyqOgd99qtu5Wbd4lz1L+2N1E2VhGjjgMtqedHSEJFGKes+JvK0jM1MuWbI
# u6pQOA3ljJRdGVq/9XtAbm8WqJqclUeGhXk+DF5mjBoKJL6cqtKctvdPbnjEKD+j
# HA9QBje6CNk1prUe2nhYHTno+EyREJZ+TeHdwq2lfvgtGx/sK0YYoxn2Off1wU9x
# LokDEaJLu5i/+k/kezbvBkTkVf826uV8MefzwlLE5hZ7Wn6lJXPbwGqZIS1j5Vn1
# TS+QHye30qsU5Thmh1EIa/tTQznQZPpWz+D0CuYUbWR4u5j9lMNzIfMvwi4g14Gs
# 0/EH1OG92V1LbjGUKYvmQaRllMBY5eUuKZCmt2Fk+tkgbBhRYLqmgQ8JJVPxvzvp
# qwcOagc5YhnJ1oV/E9mNec9ixezhe7nMZxMHmsF47caIyLBuMnnHC1mDjcbu9Sx8
# e47LZInxscS451NeX1XSfRkpWQNO+l3qRXMchH7XzuLUOncCAwEAAaOCAYswggGH
# MA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsG
# AQUFBwMIMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwHATAfBgNVHSME
# GDAWgBS6FtltTYUvcyl2mi91jGogj57IbzAdBgNVHQ4EFgQUYore0GH8jzEU7ZcL
# zT0qlBTfUpwwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybDMuZGlnaWNlcnQu
# Y29tL0RpZ2lDZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NB
# LmNybDCBkAYIKwYBBQUHAQEEgYMwgYAwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3Nw
# LmRpZ2ljZXJ0LmNvbTBYBggrBgEFBQcwAoZMaHR0cDovL2NhY2VydHMuZGlnaWNl
# cnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGlu
# Z0NBLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAVaoqGvNG83hXNzD8deNP1oUj8fz5
# lTmbJeb3coqYw3fUZPwV+zbCSVEseIhjVQlGOQD8adTKmyn7oz/AyQCbEx2wmInc
# ePLNfIXNU52vYuJhZqMUKkWHSphCK1D8G7WeCDAJ+uQt1wmJefkJ5ojOfRu4aqKb
# wVNgCeijuJ3XrR8cuOyYQfD2DoD75P/fnRCn6wC6X0qPGjpStOq/CUkVNTZZmg9U
# 0rIbf35eCa12VIp0bcrSBWcrduv/mLImlTgZiEQU5QpZomvnIj5EIdI/HMCb7XxI
# stiSDJFPPGaUr10CU+ue4p7k0x+GAWScAMLpWnR1DT3heYi/HAGXyRkjgNc2Wl+W
# FrFjDMZGQDvOXTXUWT5Dmhiuw8nLw/ubE19qtcfg8wXDWd8nYiveQclTuf80EGf2
# JjKYe/5cQpSBlIKdrAqLxksVStOYkEVgM4DgI974A6T2RUflzrgDQkfoQTZxd639
# ouiXdE4u2h4djFrIHprVwvDGIqhPm73YHJpRxC+a9l+nJ5e6li6FV8Bg53hWf2rv
# wpWaSxECyIKcyRoFfLpxtU56mWz06J7UWpjIn7+NuxhcQ/XQKujiYu54BNu90ftb
# CqhwfvCXhHjjCANdRyxjqCU4lwHSPzra5eX25pvcfizM/xdMTQCi2NYBDriL7ubg
# clWJLCcZYfZ3AYwxggUFMIIFAQIBATAvMBsxGTAXBgNVBAMMEEFUQSBBdXRoZW50
# aWNvZGUCECVAwSdyAj21QF05amCAvocwDQYJYIZIAWUDBAIBBQCggYQwGAYKKwYB
# BAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAc
# BgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgqx95
# yS6dp3VNioIFrDIPten95Ztk+4zRWx4R4QCBlwYwDQYJKoZIhvcNAQEBBQAEggEA
# UPBUHGk7X6XaBYcEmDUcJlKXVy4DoR0miINIG0ckDuZci6wAjOdhgM8M1q+FMXGW
# Y1AWasO47EQjcM84zaOGYr37pmAQAxl94EOcwEneQH6O+2rBCdT0RdDWbYkzLrjW
# IdN8eR82h3fRz0y2w2Bm/C2vXcqlO43K8QKWJkXZp323lHURy3AKQ8PKFHttlwo6
# YuMl358wtlQ2hHI7gSi6efOwLUeaPCpgIlWAVr7kNggnDaPRidHvFukLM6Xzkgw3
# O8SUqjmFehSwtZcRiddv3EfrB/3GY5Ua1IwspaFc5PXYiq5nxsHq2rmin9VjDHis
# 3o2GAd+J+6fV1xBB6tBQtqGCAyAwggMcBgkqhkiG9w0BCQYxggMNMIIDCQIBATB3
# MGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UE
# AxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBp
# bmcgQ0ECEAxNaXJLlPo8Kko9KQeAPVowDQYJYIZIAWUDBAIBBQCgaTAYBgkqhkiG
# 9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzA3MjgwNjE3MTJa
# MC8GCSqGSIb3DQEJBDEiBCDAg0OfKEpnxUR/ma83s3FdosZ9SLFt8wkOu3esGKrS
# +zANBgkqhkiG9w0BAQEFAASCAgC0Ttl4Tf44cdg0TyEWeSQe3lACe/ecJy32iHyQ
# JL02mQJB5U42YuTO+GKy943VccrT4HKq1Zm6zasF2Mvwa2qRX0PbZgd7kNSK0pwG
# VGgwHZEKbcW5FJOIkyWUyh8iDtszXWVqyrW299Vizuz4cj+0GUzFGyM8JQM6O+Rn
# xXb1Fk2Eg7FzMBA8FWgySx7+yX25goZi82mB/sFe5ar+1+bBlWE57RGeyqOvQbD8
# 2yane+J7r6cuxnxTaWqqlhB/19MbDuJe6Fh2R21XYmWazJ94ZNgNOya7WHxOCs3W
# PD0K061H2Y/8A05Lu39IN3gUKpxKa7MuriCKvyKT3EfzrvX57rec0VARhDO2ZO1D
# Qck63P7Ve1ZN6QrCyrBtsbjlhutn7HAgyq+8PQ7l5aq5+hdpC1rogJpc/yR3ApDl
# +jLbCJg8G3aznsXziUa8jKjLHG42QUX+Y8ytTA/QrujFNdvTme4geMwLVeL5JJ4t
# oWa9pL+/HNFnuLxQ6uQO/gFvaVEmgM+JjA4LJPRu8W8nvHD+OtsRpogoGoXtmEFp
# 6wtsJLZavN+nswFgJCjv1ajCrDUZFuo6l5Qsd9Orx3o6HKUKifP/QXKILnijMS0+
# Graw5uKfAA6sSm+dRvQPVc0HTpVSSsjye6hq9CzkZTLJEyNWtjqs8Q29mYF1cQt2
# kwZ0rg==
# SIG # End signature block
