#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MCbrversion {
    $localbuild = Get-Content $serverfiles\version.txt
    Get-MCBRWebrequest
    $remotebuild = $mcbrWebResponse.href
    If ($localbuild -and $remotebuild) {
        Write-Information "RemoteBuild: $remotebuild" -InformationAction Continue
        Write-Information "LocalBuild: $localbuild" -InformationAction Continue
        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
            $global:infomessage = "availableupdates"
            Get-Infomessage
        }
        Else {
            $global:infomessage = "noupdates"
            Get-Infomessage
        }
    }
    Else {
        Add-Content $ssmlog "[$loggingdate] Failed: Get-MCbrversion "
    }
}

Function Get-MCversion {
    $localbuild = Get-Content $serverfiles\version.txt
    Get-MCWebrequest
    $remotebuild = $mcvWebResponse
    If ($localbuild -and $remotebuild) {
        Write-Information "RemoteBuild: $remotebuild" -InformationAction Continue
        Write-Information "LocalBuild: $localbuild" -InformationAction Continue
        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
            $global:infomessage = "availableupdates"
            Get-Infomessage
        }
        Else {
            $global:infomessage = "noupdates"
            Get-Infomessage
        }
    }Else{
        Add-Content $ssmlog "[$loggingdate] Failed: Get-MCversion "
    }
}
