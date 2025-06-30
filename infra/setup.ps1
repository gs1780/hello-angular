param(
    [Parameter(Mandatory=$true)][string]$ResourceGroup,
    [Parameter(Mandatory=$true)][string]$Location,
    [Parameter(Mandatory=$true)][string]$PlanName,
    [Parameter(Mandatory=$true)][string]$FrontendApp,
    [Parameter(Mandatory=$true)][string]$BackendApp
)

az appservice plan create --name $PlanName --resource-group $ResourceGroup --location $Location --sku B1 --is-linux
az webapp create --name $BackendApp --plan $PlanName --resource-group $ResourceGroup --runtime "DOTNET:8"
az webapp create --name $FrontendApp --plan $PlanName --resource-group $ResourceGroup --runtime "NODE:20LTS"
