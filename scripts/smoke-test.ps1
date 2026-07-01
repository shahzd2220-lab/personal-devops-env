param(
  [Parameter(Mandatory = $true)]
  [string]$BaseUrl,

  [string]$HealthPath = "/health"
)

$ErrorActionPreference = "Stop"
$uri = "$BaseUrl$HealthPath"

Write-Host "Checking $uri"
$response = Invoke-WebRequest -Uri $uri -UseBasicParsing -TimeoutSec 15

if ($response.StatusCode -lt 200 -or $response.StatusCode -ge 300) {
  throw "Smoke test failed with status code $($response.StatusCode)"
}

Write-Host "Smoke test passed with status code $($response.StatusCode)"
