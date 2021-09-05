# Profile
# Sources
# https://github.com/stevencohn/WindowsPowerShell
# https://github.com/mikemaccana/powershell-profile/blob/master/Microsoft.PowerShell_profile.ps1
# https://github.com/Pscx/Pscx
# https://gist.github.com/cderv/883729f079e487d09b6b52f20e978963
# https://github.com/r3nanp/my-powershell-config
# https://github.com/janikvonrotz/awesome-powershell
# https://github.com/EvotecIT/PSSharedGoods

function hh{

Write-Host @"

grep
edithistory
editprofile

for modules
https://github.com/Pscx/Pscx


"@


}
set-alias helpme hh



# https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title
function set-title([string]$newtitle) {
	$host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
}


# Usefull Commans
# Get-Module -ListAvailable
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionSource None
Set-PSReadLineOption -PredictionViewStyle ListView

# Produce UTF-8 by default
# https://news.ycombinator.com/item?id=12991690
$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"

$MaximumHistoryCount = 1000

# https://github.com/mikemaccana/powershell-profile/blob/master/Microsoft.PowerShell_profile.ps1

$PathToPhycharm = Get-ChildItem -Path "${env:LOCALAPPDATA}\JetBrains\Toolbox\apps\" -Recurse -Filter '*.exe' | Where-Object { $_.Name -like 'pycharm64.exe' } | Select -ExpandProperty  "FullName"



function find-file($name)
{
    get-childitem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach-object {
        write-output($PSItem.FullName)
    }
}

set-alias find find-file
set-alias unzip expand-archive




function set-title([string]$newtitle)
{
    $host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
}


# for later
# foreach ( $includeFile in ("aws", "defaults", "openssl", "aws", "unix", "development", "node") ) {
# 	Unblock-File $profileDir\$includeFile.ps1
# . "$profileDir\$includeFile.ps1"
# }
# Should bee needed with PSReadLine
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

function grep($regex, $dir)
{
    if ($dir)
    {
        get-childitem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}


function explorer
{
    explorer.exe .
}

# Truncate homedir to ~
function limit-HomeDirectory($Path)
{
    $Path.Replace("$home", "~")
}

# Must be called 'prompt' to be used by pwsh
# https://github.com/gummesson/kapow/blob/master/themes/bashlet.ps1
function prompt
{
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host $( limit-HomeDirectory("$pwd") ) -ForegroundColor Yellow -NoNewline
    Write-Host " $" -NoNewline
    $global:LASTEXITCODE = $realLASTEXITCODE
    Return " "
}

function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function ide($location)
{
    Start $PathToPhycharm "--temp-project $location"
}


function edit($location)
{
    if (Test-Path -Path $location -PathType leaf)
    {
        Start notepad++ "${location}"
    }
    elseif (Test-Path -Path $location -PathType Container)
    {
        ide $location
    }
}

function showpath
{
    $env:path -split ";"
}


function edithistory
{
    edit (Get-PSReadlineOption).HistorySavePath
}
function editprofile
{
    edit $PROFILE
}
# linux like command completion
Set-PSReadLineKeyHandler -Key Tab -Function Complete

