## PowerShell Script to get details of Pods and Nodes of a particular Kubernetes Deployment
This PowerShell script automates the process of getting the details of **Pods and Nodes** in an existing **Azure Kubernetes Service (AKS)** deployment without manually executing the commands.
### It works by :
- **Authenticating** with Azure using provided tenant and subscription details.
- **Connecting** to an existing AKS cluster (aks-praj) using az aks get-credentials.
- **Getting** the details of the pods and nodes by executing the necessary **KubeCtl commands**.
### You provide parameters like :
- Azure tenant ID, subscription ID, resource group, and AKS cluster name.

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
    [string]$clustername
)
```
2. This is the **Azure Authentication step** and makes use of all the parameters mentioned above

```yaml
az login --tenant $($tenantid) --use-device-code

az account set --subscription $($subcriptionid)

az aks get-credentials --resource-group $($ResourceGroup) --name $($clustername) --overwrite-existing
```
3. An **KubeCtl command** that gives the details of the **PODS and NODES**

```yaml
kubectl get pods

kubectl get nodes
```
