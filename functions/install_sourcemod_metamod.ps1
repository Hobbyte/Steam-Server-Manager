#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-SourceMetaMod {
    Write-log "Function: Get-SourceMetaMod"
    Get-SourceMetaModWebrequest
    If ($metamodurl -and $metamodoutput -and $sourcemodoutput -and $sourcemoddirectory) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'MetaMod'
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $metamodurl -OutFile $metamodoutput
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'MetaMod'
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'MetaMod'
        } 
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'MetaMod'
        If ($metamodoutput -and $metamoddirectory){
        Expand-Archive $metamodoutput $metamoddirectory -Force >$null 2>&1
        }
        If (!$?) { 
            Get-WarnMessage 'ExtractFailed' 'MetaMod'
            New-TryagainNew
        }
        Write-log "Copying/installing Meta Mod"
        If ($metamoddirectory -and $systemdir){ 
        Copy-Item  "$metamoddirectory\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Write-log "Copying Meta Mod Failed"
            New-TryagainNew 
        }
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'SourceMod'
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodurl -and $sourcemodoutput){
        Invoke-WebRequest -Uri $sourcemodurl -OutFile $sourcemodoutput
        }
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'SourceMod'
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'SourceMod'
        Expand-Archive $sourcemodoutput $sourcemoddirectory -Force >$null 2>&1
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'SourceMod'
        }
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemoddirectory -and $systemdir){ 
        Copy-Item  "$sourcemoddirectory\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
        Copy-Item  "$sourcemoddirectory\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Write-log "Copying SourceMod Faileds "
            New-TryagainNew 
        }
    }
}
Function Get-CSGOGet5 {
    Write-log "Function: Get-CSGOGet5"
    If ( $csgoget5url -and $systemdir) {
     # This might work...
        $get5latesturl = iwr $csgoget5url
        $get5latestzip = $( $get5latesturl.Links.href | ? { $_ -match "get5-" } | select-string -NotMatch / )
        $get5latestdl = "https://ci.splewis.net/job/get5/lastSuccessfulBuild/artifact/builds/get5/$get5latestzip"
     
        #   iwr $csgoget5url -O $csgoget5zip
        iwr $get5latestdl -O $get5latestzip
       
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'CSGOGet5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'CSGOGet5'
    }
    $csgoget5folder = "$($get5latestzip.Replace('.zip',''))"
    $csgoget5folder = "$currentdir\$csgoget5folder"
    # Expand-Archive $csgoget5zip $csgoget5folder
    Expand-Archive $get5latestzip $csgoget5folder -Force
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'CSGOGet5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'CSGOGet5'
    }
    Get-Infomessage "copying-installing" 'CSGOGet5'
    Copy-Item  "$csgoget5folder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
    Copy-Item  "$csgoget5folder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
    If (!$?) { 
        Write-log "Copying CSGOGet5 Failed "
        New-TryagainNew 
    }
}

Function Get-CSGOcsgopugsetup {
    Write-log "Function: Get-CSGOcsgopugsetup"
    If ( $systemdir) {
        # iwr $csgopugsetupurl -O $csgopugsetupzip
        if ($Pugsetupowner -and $Pugsetuprepo ) {
            Get-GithubRestAPI $Pugsetupowner $Pugsetuprepo 
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'CSGOcsgopugsetup'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'CSGOcsgopugsetup'
    }
    $csgopugsetupzip = $githubrepozipname
    $csgopugsetupfolder = $csgopugsetupzip.Replace('.zip','')
    $csgopugsetupfolder = "$currentdir\$csgopugsetupfolder"
    Expand-Archive $csgopugsetupzip $csgopugsetupfolder -Force
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'CSGOcsgopugsetup'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'CSGOcsgopugsetup'
    }
    Get-Infomessage "copying-installing" 'CSGOcsgopugsetup'
    Copy-Item  "$csgopugsetupfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
    Copy-Item  "$csgopugsetupfolder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
    If (!$?) { 
        Write-log "Copying CSGOcsgopugsetup Failed "
        New-TryagainNew 
    }
}
Function Get-CSGOsteamworks {
    Write-log "Function: Get-CSGOsteamworks"
    If ($steamworksurl -and $systemdir) {
        $steamworkslatest = iwr $steamworksurl
        $steamworkslatestzip = $( $steamworkslatest.Links.href | select-string -SimpleMatch windows.zip | select -First 1 ) 
        iwr $steamworksurl$steamworkslatestzip -O $steamworkslatestzip
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'SteamWorks'
    }
    # $steamworksfolder = $steamworkslatestzip.Replace('.zip','')
    $steamworksfolder = $steamworkslatestzip -Replace '.zip',''
    $steamworksfolder = "$currentdir\$steamworksfolder"
    Expand-Archive $steamworkslatestzip $steamworksfolder -Force
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'SteamWorks'
    }
    Get-Infomessage "copying-installing" 'SteamWorks'
    Copy-Item  "$steamworksfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
    #Copy-Item  "$steamworksfolder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
    If (!$?) { 
        Write-log "Copying SteamWorks Failed "
        New-TryagainNew 
    }
}