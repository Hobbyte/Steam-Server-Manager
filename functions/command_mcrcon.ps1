#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-ConnectMCRcon {
    If ($ssmlog -and $loggingdate) {
        Add-Content $ssmlog "[$loggingdate] Starting McRcon"
        If ($mcrconexecutable) {
            If ($Useprivate -eq "off") {
                set-location $mcrcondirectory
                If (!( ${rconport} )) {
                    Add-Content $ssmlog "[$loggingdate] Using Port ${extip} -P ${port} -p $rconpassword"
                    & $mcrconexecutable -t -H ${extip} -P ${port} -p $rconpassword
                }
                Else {
                    Add-Content $ssmlog "[$loggingdate] Using RconPort ${extip} -P ${port} -p $rconpassword"
                    & $mcrconexecutable -t -H ${extip} -P ${rconport} -p $rconpassword
                }
                set-location $currentdir
            }
            Else {
                set-location $mcrcondirectory
                If (!( ${rconport} )) {
                    Add-Content $ssmlog "[$loggingdate] Using Port ${ip} -P ${port} -p $rconpassword"
                    & $mcrconexecutable -t -H ${ip} -P ${port} -p $rconpassword
                }
                Else {
                    Add-Content $ssmlog "[$loggingdate] Using Port ${ip} -P ${rconport} -p $rconpassword"
                    & $mcrconexecutable -t -H ${ip} -P ${rconport} -p $rconpassword
                }
                set-location $currentdir
            }
        }
        ElseIf (!$mcrconexecutable) {
            $global:warnmessage = "fn_Set-ConnectMCRcon"
            Get-warnmessage
        
        }
    }
}

Function invoke-sourcerestart {
    Add-Content $ssmlog "[$loggingdate] Starting McRcon for source restart"
    If ($mcrconexecutable) {
        If ($Useprivate -eq "off") {
            set-location $mcrcondirectory
            If (!${rconport}) {
                Add-Content $ssmlog "[$loggingdate] Using Port ${extip} -P ${port} -p $rconpassword _restart"
                & $mcrconexecutable -c -H ${extip} -P ${port} -p $rconpassword "_restart"
                # & $mcrconexecutable -t -H ${extip} -P ${port} -p $rconpassword
            }
            Else {
                Add-Content $ssmlog "[$loggingdate] Using RconPort ${extip} -P ${rconport} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${extip} -P ${rconport} -p $rconpassword
                & $mcrconexecutable -c -H ${extip} -P ${rconport} -p $rconpassword "_restart"
                
            }
            set-location $currentdir
        }
        Else {
            set-location $mcrcondirectory
            If (!${rconport}) {
                Add-Content $ssmlog "[$loggingdate] Using Port ${ip} -P ${port} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${ip} -P ${port} -p $rconpassword
                & $mcrconexecutable -c -H ${ip} -P ${port} -p $rconpassword "_restart"
            }
            Else {
                Add-Content $ssmlog "[$loggingdate] Using Port ${ip} -P ${rconport} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${ip} -P ${rconport} -p $rconpassword
                & $mcrconexecutable -c -H ${ip} -P ${rconport} -p $rconpassword "_restart"
            }
            set-location $currentdir
        }
    }
    ElseIf (!$mcrconexecutable) {
        $global:warnmessage = "Set-ConnectMCRcon"
        Get-warnmessage
                
    }
}