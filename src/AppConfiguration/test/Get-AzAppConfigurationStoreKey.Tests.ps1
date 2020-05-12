$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzAppConfigurationStoreKey.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-AzAppConfigurationStoreKey' {
    It 'List' {
        $appconfKeys = Get-AzAppConfigurationStoreKey -ResourceGroupName $env.resourceGroup -Name $env.appconfName00 
        $assertString = "Endpoint=https://$($env.appconfName00).azconfig.io;Id=$($appconfKeys[0].Id);Secret=$($appconfKeys[0].Value)"
        $appconfKeys.Count | Should -Be 4
        $appconfKeys[0].ConnectionString | Should -Be $assertString
        Remove-AzAppConfigurationStore -Name $env.appconfName00 -ResourceGroupName $env.resourceGroup
    }
}
