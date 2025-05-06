## PowerShell Script to Update the Container Image of Existing Kubernetes Deployment
This PowerShell script automates the process of updating a container image in an existing **Azure Kubernetes Service (AKS)** deployment without manually editing any YAML files.
### It works by :
- **Authenticating** with Azure using provided tenant and subscription details.
- **Connecting** to an existing AKS cluster (aks-praj) using az aks get-credentials.
- **Updating** the specified Kubernetes deployment using the kubectl set image command to replace the current container image with a new one.
### You provide parameters like :
- Azure tenant ID, subscription ID, resource group, and AKS cluster name
- Kubernetes namespace, deployment name, container name, and the new Docker image to deploy
#### This helps ensure **faster rollouts and zero manual configuration changes** when deploying updates.
