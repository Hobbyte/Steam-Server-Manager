Function Get-StartServer {
    param(
        # [string]
        [Parameter(Mandatory = $true, Position = 0)]
        # [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)] 
        $global:launchParams
    )
    Set-Location $global:currentdir\$global:server\
    #Start-Process -FilePath CMD -ArgumentList ("/c $global:launchParams") -NoNewWindow
    If (( $global:APPID -eq 258550 ) -or ($global:APPID -eq 294420 ) -or ($global:APPID -eq 302550)) {
        Start-Process CMD "/c start $global:launchParams"
    }
    Else {
        Start-Process CMD "/c start $global:launchParams"  -NoNewWindow
    }
    Set-Location $global:currentdir
}
Function Select-StartServer {
    Write-Host '****   Starting Server   *****' -F Y -B Black  
    Get-StartServer $global:launchParams
}