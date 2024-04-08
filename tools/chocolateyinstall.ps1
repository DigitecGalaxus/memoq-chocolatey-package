$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "10.6.8"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "37100C481F1991BE9CF25616CDD3B45B6DF9E9F675A9041409FEFE31C5D54649"

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