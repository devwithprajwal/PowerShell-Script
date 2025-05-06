## PowerShell Script to get details of Pods and Nodes of a particular Kubernetes Deployment
This PowerShell script automates the process of getting the details of **Pods and Nodes** in an existing **Azure Kubernetes Service (AKS)** deployment without manually executing the commands.
### It works by :
- **Authenticating** with Azure using provided tenant and subscription details.
- **Connecting** to an existing AKS cluster (aks-praj) using az aks get-credentials.
- **Updating** the specified Kubernetes deployment using the kubectl set image command to replace the current container image with a new one.
### You provide parameters like :
- Azure tenant ID, subscription ID, resource group, and AKS cluster name
- Kubernetes namespace, deployment name, container name, and the new Docker image to deploy
#### This helps ensure **faster rollouts and zero manual configuration changes** when deploying updates.
### Workflow :

1. This contains all the **essential parameters** required to run the script
   
```yaml
param (
    [Parameter(Mandatory=$true)]
    [string]$tenantid,
    [Parameter(Mandatory=$true)]
    [string]$subcriptionid,
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroup,
    [Parameter(Mandatory=$true)]
    [string]$clustername,
    # Define deployment, container name, and new image
    [Parameter(Mandatory=$true)]
    [string]$Namespace,
    [Parameter(Mandatory=$true)]
    [string]$DeploymentName,
    [Parameter(Mandatory=$true)]
    [string]$ContainerName,
    [Parameter(Mandatory=$true)]
    [string]$NewImage

)
```
2. This is the **Azure Authentication step** and makes use of all the parameters mentioned above

```yaml
az login --tenant $($tenantid) --use-device-code

az account set --subscription $($subcriptionid)

az aks get-credentials --resource-group $($ResourceGroup) --name $($clustername) --overwrite-existing
```
3. An **Imperative command** that updates the container image of an specific deployment

```yaml
kubectl set image deployment/$DeploymentName $ContainerName=$NewImage -n $Namespace
```
