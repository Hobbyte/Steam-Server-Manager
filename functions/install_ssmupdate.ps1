#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateSteamer {
    $start_time = Get-Date
    $global:package = 'Steam-Server-Manager'
    $global:infomessage = "Downloading"
    Get-Infomessage
    # Write-Host '****   Downloading Steam-Server-Manager github files   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$steamerurl", "$currentdir\steamer.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $steamerurl -OutFile Steam-Server-Manager.zip
    $global:infomessage = "downloadtime"
    Get-Infomessage
    # Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black 
    Remove-Item  "Steam-Server-Manager\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "config-default\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "data\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "functions\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "README.md*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "LICENSE*" -Recurse -Force -ea SilentlyContinue
    $global:infomessage = "Extracting"
    Get-Infomessage 
    Expand-Archive Steam-Server-Manager.zip Steam-Server-Manager -Force
    $global:infomessage = "copying-installing"
    Get-Infomessage 
    Copy-Item  "$currentdir\Steam-Server-Manager\Steam-Server-Manager-master\*" -Destination "$currentdir" -Recurse -Force
    Get-CleanUPSteamer
}

Function Get-CleanUPSteamer {
    Remove-Item  "Steam-Server-Manager" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "Steam-Server-Manager.zip" -Recurse -Force -ea SilentlyContinue
    Write-Information 'ssm github files Updated' -InformationAction Continue
    # Write-Host '****   ssm github files Updated   ****' -F Y -B Black
    Write-Information 'Press Enter to Close this session' -InformationAction Continue
    # Write-Host '****   Press Enter to Close this session   ****' -F Y -B Black
    Pause  
    Stop-Process -Id $PID
}