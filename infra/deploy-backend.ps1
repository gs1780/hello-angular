param(
    [Parameter(Mandatory=$true)][string]$ResourceGroup,
    [Parameter(Mandatory=$true)][string]$AppName
)

Push-Location ../backend
 dotnet publish -c Release -o publish
 Compress-Archive -Path publish\* -DestinationPath ../backend.zip
Pop-Location

az webapp deploy --resource-group $ResourceGroup --name $AppName --src-path backend.zip --type zip
Remove-Item backend.zip
