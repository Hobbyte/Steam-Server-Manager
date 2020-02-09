Function Get-UpdateServer {
    if ($global:DisableDiscordBackup -eq "1") {
        Set-Location $global:currentdir\SteamCMD\ >$null 2>&1
        #Get-Steamtxt
        Write-Host '****   Updating Server   ****' -F M -B Black
        #.\steamcmd +runscript Updates-$global:server.txt
        If ($global:ANON -eq "yes") {
            .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
        }
        Else {
            .\steamCMD +@ShutdownOnFailedCommand 1 +login $global:username +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
        }
    }
    If (($?) -or ($LASTEXITCODE -eq 7)) {
        Write-Host "****   Downloading  Install/update server succeeded   ****" -F Y
        If ($global:command -ne "install") { 
            If ($global:DisableDiscordUpdate -eq "1") {
                New-DiscordAlert 
            }
        }
    }
    ElseIf (!$?) {
        Write-Host "****   Downloading  Install/update server Failed   ****" -F R
        New-TryagainNew 
    }
    Set-Location $global:currentdir
}