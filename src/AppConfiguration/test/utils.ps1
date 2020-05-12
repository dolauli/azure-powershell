function RandomString([bool]$allChars, [int32]$len) {
    if ($allChars) {
        return -join ((33..126) | Get-Random -Count $len | % {[char]$_})
    } else {
        return -join ((48..57) + (97..122) | Get-Random -Count $len | % {[char]$_})
    }
}
$env = @{}
function setupEnv() {
    # Preload subscriptionId and tenant from context, which will be used in test
    # as default. You could change them if needed.
    $env.SubscriptionId = (Get-AzContext).Subscription.Id
    $env.Tenant = (Get-AzContext).Tenant.Id
    $env.resourceGroup = 'appconf-rg-' + (RandomString -allChars $false -len 6)
    $env.location = 'eastus'

    $appconfName00 = 'appconf-' + (RandomString -allChars $false -len 6)
    $appconfName01 = 'appconf-' + (RandomString -allChars $false -len 6)
    $appconfName02 = 'appconf-' + (RandomString -allChars $false -len 6)
    $appconfName03 = 'appconf-' + (RandomString -allChars $false -len 6)
    $env.Add('appconfName00', $appconfName00)
    $env.Add('appconfName01', $appconfName01)
    $env.Add('appconfName02', $appconfName02)
    $env.Add('appconfName03', $appconfName03)

    Write-Host -ForegroundColor Green 'Start creating resource group for test...'
    New-AzResourceGroup -Name $env.resourceGroup -Location $env.location
    Write-Host -ForegroundColor Green 'Resource group created successfully.'

    Write-Host -ForegroundColor Green '--------------------------------------------'
    Write-Host -ForegroundColor Green 'Start deploying app configuration for testing.'
    New-AzAppConfigurationStore -Name $env.appconfName00 -ResourceGroupName $env.resourceGroup -Location $env.location
    Write-Host -ForegroundColor Green 'App Configuration created successfully.'

    # For any resources you created for test, you should add it to $env here.
    $envFile = 'env.json'
    if ($TestMode -eq 'live') {
        $envFile = 'localEnv.json'
    }
    set-content -Path (Join-Path $PSScriptRoot $envFile) -Value (ConvertTo-Json $env)
}
function cleanupEnv() {
    # Clean resources you create for testing
    Remove-AzResourceGroup -Name $env.resourceGroup
}

