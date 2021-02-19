#Declaring public variables
$complist = import-csv -path "C:\temp\listOfComputers.csv"
$objComputers = $complist.Length
$Pausepath = "c:\temp\pause.txt"
$continueComputers = 0



#Writing log
function Write-Log 
{
Param(
$Message,
#$Path = "$using:LogPath")
#$Path = "C:\temp",
$logname = "boundary.log" )
function TS 
{
    Get-Date -Format 'hh:mm:ss'
}
"[$(TS)]$Message" | Tee-Object -FilePath "$Path\$logname" -Append | Write-Verbose
}

#pause
function Pause {
    do {
        Start-Sleep -Seconds 1
            Write-Host "File exists"
            Write-Log ("$pausepath exists, delete to continue")
        } until ([System.IO.File]::Exists($Pausepath) -ne $true)
    Write-Host "I can do stuff now"
    Write-Log ("$pausepath deleted, continue")
    ProcessContinue
}

function ProcessContinue {
    for ( $i=$continueComputers ; $i -lt $objComputers; $i++) {
    ##### Put script here #####
    ##### Put script here #####
    ##### Put script here #####
    ##### Put script here #####
    ##### Put script here #####
    ##### Put script here #####
    ##### Put script here #####
        Write-Host "i is $i, continueComputer is $continueComputers"

        $continueComputers = $i

        Write-Host "now Continue computer is $continueComputers"
        Start-Sleep -Seconds 2
        if ([System.IO.File]::Exists($Pausepath)) {
            Pause
        }
}

Exit
    
}
########################################
##### Starts the scripts: ###############
##### If pause.txt exists, it will start with the pause, otherwise, it'll go to ProcessContinue #####
########################################

if ([System.IO.File]::Exists($Pausepath) -ne $true) {
    ProcessContinue
}
else {
    Pause
}
    
