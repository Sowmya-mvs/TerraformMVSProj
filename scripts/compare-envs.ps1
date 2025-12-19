param(
  [string[]]$Files = @("envs/dev.tfvars","envs/qa.tfvars","envs/prod.tfvars")
)

function Parse-Tfvars($path) {
  $map = @{}
  Get-Content $path | ForEach-Object {
    if ($_ -match '^\s*([a-zA-Z0-9_]+)\s*=\s*"(.*)"\s*$') {
      $map[$matches[1]] = $matches[2]
    }
  }
  return $map
}

$dicts = @{}
foreach ($f in $Files) {
  if (Test-Path $f) { $dicts[$f] = Parse-Tfvars $f }
}

$allKeys = ($dicts.Values | ForEach-Object { $_.Keys } | Sort-Object -Unique)

foreach ($k in $allKeys) {
  $values = @()
  foreach ($f in $dicts.Keys) {
    $val = $dicts[$f].ContainsKey($k) ? $dicts[$f][$k] : "<MISSING>"
    $values += "${f}: ${val}"
  }
  if (($values | Select-String '<MISSING>').Count -gt 0) {
    Write-Host "DRIFT: key '$k' missing in some envs:" -ForegroundColor Yellow
    $values | ForEach-Object { Write-Host "  $_" }
  }
}

Write-Host "Compare complete." -ForegroundColor Green
