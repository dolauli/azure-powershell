# Overall
This directory contains management plane service clients of Az.Aks module.

## Run Generation
In this directory, run AutoRest:
```
autorest --reset
autorest --use:@autorest/powershell@4.x
```

### AutoRest Configuration
> see https://aka.ms/autorest
``` yaml
isSdkGenerator: true
powershell: true
clear-output-folder: true
openapi-type: arm
azure-arm: true
license-header: MICROSOFT_MIT_NO_VERSION
use-extension:
  "@autorest/powershell": "4.x"
```

###
``` yaml
commit: d27233c75caefa067a59c37538486da5b535cf15
input-file:
  - https://github.com/Azure/azure-rest-api-specs/blob/$(commit)/specification/containerservice/resource-manager/Microsoft.ContainerService/aks/stable/2023-04-01/managedClusters.json


output-folder: Generated
namespace: Microsoft.Azure.Management.ContainerService
```
