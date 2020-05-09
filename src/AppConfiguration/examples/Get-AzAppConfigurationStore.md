### Example 1: List all app configurations under a subscription
```powershell
PS C:\> Get-AzAppConfigurationStore

Name          Type
----          ----
Location Name               Type
-------- ----               ----
eastus   appconfig-test01   Microsoft.AppConfiguration/configurationStores
eastus   contoso-app-config Microsoft.AppConfiguration/configurationStores
```

This command lists all app configurations under a subscription.

### Example 2: List all app configurations under a resource group
```powershell
PS C:\> Get-AzAppConfigurationStore -ResourceGroupName lucas-manual-test

Location Name             Type
-------- ----             ----
eastus   appconfig-test01 Microsoft.AppConfiguration/configurationStores
eastus   appconfig-test02 Microsoft.AppConfiguration/configurationStores
```

This command lists all app configurations under a resource group.

### Example 3: Get an app configuration under a resource group
```powershell
PS C:\> Get-AzAppConfigurationStore -ResourceGroupName lucas-manual-test -Name appconfig-test01

Location Name             Type
-------- ----             ----
eastus   appconfig-test01 Microsoft.AppConfiguration/configurationStores
```

This command gets an app configuration under a resource group.

### Example 4: Get an app configuration under a resource group
```powershell
PS C:\> Get-AzAppConfigurationStore -ResourceGroupName lucas-manual-test -Name appconfig-test01 | Get-AzAppConfigurationStore

Location Name             Type
-------- ----             ----
eastus   appconfig-test01 Microsoft.AppConfiguration/configurationStores
```

This command gets an app configuration under a resource group.


