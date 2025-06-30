# Hello Angular with .NET API

This repository contains a simple Angular frontend and ASP.NET Core Web API backend. The frontend retrieves a greeting message from the backend and displays it in the browser. Both services can be deployed to Azure App Service using the provided CLI scripts.

## Prerequisites

- [Node.js](https://nodejs.org/) and npm
- [.NET SDK 8.0](https://dotnet.microsoft.com/)
- [Angular CLI](https://angular.io/cli)
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)

## Building the Projects

### Backend

```bash
cd backend
# Restore dependencies and build
 dotnet publish -c Release -o publish
```

### Frontend

```bash
cd frontend
# Install dependencies
npm install
# Build the Angular application
npm run build
```

The Angular build outputs static files to `dist/`.

## Running Locally

### Backend

```bash
cd backend
 dotnet run
```

The API will be available at `http://localhost:5000/api/hello` by default.

### Frontend

In another terminal:

```bash
cd frontend
npm start
```

Navigate to `http://localhost:4200` and you should see the message fetched from the backend.

## Deployment to Azure

The `infra` folder contains CLI scripts to provision an App Service plan and two App Services (frontend and backend). You must create the resource group beforehand. Windows users can use the corresponding PowerShell scripts with the `.ps1` extension.

1. **Provision infrastructure**

 ```bash
 cd infra
 ./setup.sh <resource-group> <location> <appservice-plan-name> <frontend-app-name> <backend-app-name>
 ```
```powershell
cd infra
./setup.ps1 -ResourceGroup <resource-group> -Location <location> -PlanName <appservice-plan-name> -FrontendApp <frontend-app-name> -BackendApp <backend-app-name>
```

2. **Deploy backend**

 ```bash
 ./deploy-backend.sh <resource-group> <backend-app-name>
 ```
```powershell
./deploy-backend.ps1 -ResourceGroup <resource-group> -AppName <backend-app-name>
```

3. **Deploy frontend**

 ```bash
 ./deploy-frontend.sh <resource-group> <frontend-app-name>
 ```
```powershell
./deploy-frontend.ps1 -ResourceGroup <resource-group> -AppName <frontend-app-name>
```

The frontend expects the backend to be accessible at `/api/hello` on the same domain. Configure a rewrite rule or API proxy if needed.

