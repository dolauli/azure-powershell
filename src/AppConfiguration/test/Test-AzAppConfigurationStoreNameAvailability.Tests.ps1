$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Test-AzAppConfigurationStoreNameAvailability.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Test-AzAppConfigurationStoreNameAvailability' {
    It 'CheckExpanded' {
        $nameAvailability = Test-AzAppConfigurationStoreNameAvailability -Name $env.appconfName03
        $nameAvailability.NameAvailable | Should -Be $false
    }

    It 'CheckViaIdentityExpanded' {
        $nameAvailability = Test-AzAppConfigurationStoreNameAvailability -Name 'asdsd-124asdad'
        $nameAvailability.NameAvailable | Should -Be $true
    }
}
