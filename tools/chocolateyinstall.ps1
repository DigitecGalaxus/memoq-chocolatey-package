$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "10.3.10"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "E6E92247F9F0152BDFCC7FC61216622364E5D20DCF285384E31D7E30F9F60396"

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