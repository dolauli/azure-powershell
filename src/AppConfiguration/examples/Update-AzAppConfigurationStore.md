### Example 1: Update an app configuration 
```powershell
PS C:\> Update-AzAppConfigurationStore -Name appconfig-test01 -ResourceGroupName lucas-manual-test -SubscriptionId 9e223dbe-3399-4e19-88eb-0975f02ac87f

Location Name             Type
-------- ----             ----
eastus   appconfig-test01 Microsoft.AppConfiguration/configurationStores
```

This command updates an app configuration.

### Example 2: Update an app configuration 
```powershell
PS C:\> $app = Get-AzAppConfigurationStore -Name appconfig-test01 -ResourceGroupName lucas-manual-test
PS C:\>Update-AzAppConfigurationStore -InputObject $app

Location Name             Type
-------- ----             ----
eastus   appconfig-test01 Microsoft.AppConfiguration/configurationStores
```

This command updates an app configuration.