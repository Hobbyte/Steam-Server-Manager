#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MonitorServer {
    If ($process) {
        If ($global:appid -eq "996560") { 
            Get-MonitorMultiple 
        }
        Else {
            Add-Content $ssmlog "[$loggingdate] Monitor  Server process" 
            If (!(Get-Process $process -ea SilentlyContinue)) {
                # $infomessage = "notrunning"
                # Get-Infomessage
                Select-StartServer
                $global:alert = "restart"
                New-DiscordAlert
            }
            Else {
                $infomessage = "running"
                Get-Infomessage
                get-process $process
                Get-ClearVariables
                Exit 
            }
            Get-CheckForError
        }
    }
}

Function Get-MonitorMultiple {
    $process = get-process | Where-Object { $_.ProcessName -match $process } | get-process 
    If (!$process) {
        # $infomessage -eq "notrunning"
        # Get-Infomessage
        Select-StartServer
        $global:alert = "restart"
        New-DiscordAlert 
    }
    Else {
        $infomessage -eq "running"
        Get-Infomessage
        get-process $process 
        Get-ClearVariables 
        Exit
    }
}