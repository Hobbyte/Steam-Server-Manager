Function New-CreateVariables {
    Write-Host '*** Creating Variables Script ****' -F M -B Black
    New-Item $global:currentdir\$global:server\Variables-$global:server.ps1 -Force
    Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# WEBHOOK HERE - - \/  \/  \/"
    Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:WEBHOOK = `"$global:WEBHOOK`""
    If ($global:APPID) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  App ID  - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:APPID = `"$global:APPID`""
    }
    If ($global:Branch) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Branch   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:Branch = `"$global:Branch`""
    }
    If ($global:username) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Steam username - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:username = $global:username"
    }
    If ($global:ANON) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Steam Anonymous user  - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:ANON = `"$global:ANON`""
    }
    If ($global:MODDIR) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Mod dir - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:MODDIR = `"$global:MODDIR`""
    }
    If ($global:EXE) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Exe - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:EXE = `"$global:EXE`""
    }
    If ($global:EXEDIR) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Exe dir - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:EXEDIR = `"$global:EXEDIR`""
    }
    If ($global:SERVERCFGDIR) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  SERVERCFGDIR dir - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SERVERCFGDIR = `"$global:SERVERCFGDIR`""
    }
    If ($global:GAME) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Game name used by Gamedig - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:game = `"$global:GAME`""
    }
    If ($global:PROCESS) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  PROCESS name - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:PROCESS = `"$global:PROCESS`""
    }
    If (${global:IP}) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server IP - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`${global:IP} = `"${global:IP}`""
    }
    If (${global:EXTIP}) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server EXT IP - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`${global:EXTIP} = `"${global:EXTIP}`""
    }
    If (${global:PORT}) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server PORT - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`${global:PORT} = `"${global:PORT}`""
    }
    If (${global:DIFF}) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server DIFF - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`${global:DIFF} = `"${global:DIFF}`""
    }
    If ($global:SOURCETVPORT) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server Source TV Port - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SOURCETVPORT = `"$global:SOURCETVPORT`""
    }
    If ($global:SV_LAN) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server SV_LAN - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SV_LAN = `"$global:SV_LAN`""
    }
    If ($global:CLIENTPORT) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  server client port- - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:CLIENTPORT = `"$global:CLIENTPORT`""
    }
    If ($global:STEAMPORT) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  server STEAMPORT port- - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:STEAMPORT = `"$global:STEAMPORT`""
    }
    If ($global:steamID64) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  server steamID64- - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:steamID64 = `"$global:steamID64`""
    }
    If ($global:MAP) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  default Map- - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:MAP = `"$global:MAP`""
    }
    If ($global:GALAXYNAME) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  default GALAXYNAME- - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:GALAXYNAME = `"$global:GALAXYNAME`""
    }
    If ($global:TICKRATE) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  server tick rate - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:TICKRATE = `"$global:TICKRATE`""
    } 
    If ($global:GSLT) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Gamer Server token - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:GSLT = `"$global:GSLT`""
    }
    If ($global:MAXPLAYERS) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Max Players  - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:MAXPLAYERS = `"$global:MAXPLAYERS`""
    }
    If ($global:WORKSHOP) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Workshop 1/0 HERE - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:WORKSHOP = `"$global:WORKSHOP`""
    }
    If ($global:HOSTNAME) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server Name - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:HOSTNAME = `"$global:HOSTNAME`""
    }
    If (${global:QUERYPORT}) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  query port - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`${global:QUERYPORT} = `"${global:QUERYPORT}`""
    }
    If ($global:SAVES) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  local App Data SAVES folder - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SAVES = `"$global:SAVES`""
    }
    If ($global:RCONPORT) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Rcon Port  - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:RCONPORT = `"$global:RCONPORT`""
    }
    If ($global:RCONPASSWORD) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Rcon Password HERE - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:RCONPASSWORD = `"$global:RCONPASSWORD`""
    }
    If ($global:SV_PURE) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Extra Launch Parms - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SV_PURE = `"$global:SV_PURE`""
    }
    If ($global:SCENARIO) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# Sandstorm SCENARIO   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:SCENARIO = `"$global:SCENARIO`""
    }
    If ($global:GAMETYPE) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO Gametype   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:GAMETYPE = `"$global:GAMETYPE`""
    }
    If ($global:GAMEMODE) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO Gamemode   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:GAMEMODE = `"$global:GAMEMODE`""
    }
    If ($global:MAPGROUP) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO mapgroup   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:MAPGROUP = `"$global:MAPGROUP`""
    }
    If ($global:AppID -eq 740) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO WSCOLLECTIONID   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:WSCOLLECTIONID = `"$global:WSCOLLECTIONID`""
    }
    If ($global:AppID -eq 740) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO WSSTARTMAP  - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:WSSTARTMAP= `"$global:WSSTARTMAP`""
    }
    If ($global:AppID -eq 740) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "# CSGO WSAPIKEY   - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:WSAPIKEY = `"$global:WSAPIKEY`""
    }
    If ($global:launchParams) {
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "#  Server Launch Params - - \/  \/  \/"
        Add-Content  $global:currentdir\$global:server\Variables-$global:server.ps1  "`$global:launchParams = $global:launchParams"
    }
}