$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "11.4.11"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "FB219FB5E12DBB66F438D0A29D98AF1758E6A9A74A470A5BF3CE5E8DE720B3F9"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  file          = "$toolsDir\memoQ-$version.exe"
  fileType      = 'EXE'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /CLOSEAPPLICATIONS /NORESTART /LOG `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).EXEInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs