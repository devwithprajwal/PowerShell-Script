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



az login --tenant $($tenantid) --use-device-code

az account set --subscription $($subcriptionid)

az aks get-credentials --resource-group $($ResourceGroup) --name $($clustername) --overwrite-existing

kubectl get pods

kubectl get nodes