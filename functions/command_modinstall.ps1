Function Get-Modinstall {
    If (($global:appid -eq 237410) -or ($global:appid -eq 462310) -or ($global:appid -eq 740) -or ($global:appid -eq 222860)) {
        Get-SourceMetaMod
    }
    ElseIF ( ($global:appid -eq 258550)) {
        Get-Oxide
    }Else {
        Write-Host "***** No Mods Available *****" -F R -B Black
    }
}