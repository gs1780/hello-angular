param(
    [Parameter(Mandatory=$true)][string]$ResourceGroup,
    [Parameter(Mandatory=$true)][string]$AppName
)

Push-Location ../frontend
 npm install
 npm run build
 Compress-Archive -Path dist\* -DestinationPath ../frontend.zip
Pop-Location

az webapp deploy --resource-group $ResourceGroup --name $AppName --src-path frontend.zip --type zip
Remove-Item frontend.zip
