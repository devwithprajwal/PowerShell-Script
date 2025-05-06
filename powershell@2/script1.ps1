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


az login --tenant $($tenantid) --use-device-code

az account set --subscription $($subcriptionid)

az aks get-credentials --resource-group $($ResourceGroup) --name $($clustername) --overwrite-existing

# Update container image
kubectl set image deployment/$DeploymentName $ContainerName=$NewImage -n $Namespace