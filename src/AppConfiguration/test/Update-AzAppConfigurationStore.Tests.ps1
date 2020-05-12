$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-AzAppConfigurationStore.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-AzAppConfigurationStore' {
    It 'UpdateExpanded' {
        Update-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup -SubscriptionId $env.SubscriptionId -Tag @{'key'=1}
        $appconf = Get-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup 
        $appconf.Tag.Values | Should -Be 1
    }

    It 'UpdateViaIdentityExpanded' {
        $appConf = Get-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup 
        Update-AzAppConfigurationStore -InputObject $appConf -Tag @{'key'=2}
        $appconf = Get-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup 
        $appconf.Tag.Values | Should -Be 2
    }
}
