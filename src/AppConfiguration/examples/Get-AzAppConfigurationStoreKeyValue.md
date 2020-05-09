### Example 1: Get a store key-value of app configuration
```powershell
PS C:\> Get-AzAppConfigurationStoreKeyValue -Name appconfig-test01 -ResourceGroupName lucas-manual-test -Key testapp

ContentType ETag                        Key     Label LastModified        Locked Value
----------- ----                        ---     ----- ------------        ------ -----
            4K9S9uYw0SjZcxKFhLWm0XR42UH testapp       5/8/2020 6:03:35 AM False  1
```

This command gets a store key-value of app configuration.

### Example 2: Get a store key-value with label of app configuration
```powershell
PS C:\> Get-AzAppConfigurationStoreKeyValue -Name appconfig-test01 -ResourceGroupName lucas-manual-test -ListKeyValueParameter @{key="testapp02";label="dev"}
                                                       
ContentType ETag                        Key       Label LastModified        Locked Value
----------- ----                        ---       ----- ------------        ------ -----
lucas       ZmDiVYrByKI4Ho9HqlhGdzJjlaZ testapp02 dev   5/8/2020 6:10:44 AM False  2
```

This command gets a store key-value with label of app configuration.