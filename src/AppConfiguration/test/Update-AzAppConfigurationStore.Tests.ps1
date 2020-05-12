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
        $appconf = Update-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup -SubscriptionId $env.SubscriptionId
        $appConf.Name | Should -Be $env.appconfName03
    }

    It 'UpdateViaIdentityExpanded' {
        $appConf = Get-AzAppConfigurationStore -Name $env.appconfName03 -ResourceGroupName $env.resourceGroup
        $appconf = Update-AzAppConfigurationStore -InputObject $appConf
        $appConf.Name | Should -Be $env.appconfName03
    }
}
