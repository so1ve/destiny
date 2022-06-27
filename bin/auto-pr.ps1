param(
    # overwrite upstream param
    [String]$upstream = "so1ve/destiny:master"
)

if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop) }
$autopr = "./bin/bin__auto-pr.ps1" # Invoked by the auto-pr action, adds 'bin' folder
$dir = "$PSScriptRoot/../bucket" # checks the parent dir
Invoke-Expression -command "& '$autopr' -dir '$dir' -upstream $upstream $($args | ForEach-Object { "$_ " })"
