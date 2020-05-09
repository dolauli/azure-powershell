### Example 1: Test availability of the application configuration store name
```powershell
PS C:\> Test-AzAppConfigurationStoreNameAvailability -Name appconfig-test01

Message                               NameAvailable Reason
-------                               ------------- ------
The specified name is already in use. False         AlreadyExists

PS C:\> Test-AzAppConfigurationStoreNameAvailability -Name asxmd-asd

Message                          NameAvailable Reason
-------                          ------------- ------
The specified name is available. True
```

This command test availability of the application configuration store name.