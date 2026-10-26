$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command java -ErrorAction SilentlyContinue)) { throw 'Chua tim thay Java. Cai JDK 17 hoac 21, mo terminal moi va thu java -version.' }
if (-not $env:BTL_DB_USERNAME) { $env:BTL_DB_USERNAME = 'app_user' }
if (-not $env:BTL_DB_PASSWORD) {
    $secret = Read-Host ('Nhap mat khau MySQL cua ' + $env:BTL_DB_USERNAME) -AsSecureString
    $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret)
    try { $env:BTL_DB_PASSWORD = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) }
    finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
}
Write-Host 'Dang chay... Khi thay Started TeachingApplication, mo http://localhost:8080/login'
try { & java -jar "$PSScriptRoot/dist/teaching-management-1.0.0.jar" }
finally { Remove-Item Env:BTL_DB_PASSWORD -ErrorAction SilentlyContinue }
