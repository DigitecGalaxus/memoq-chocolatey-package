$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "10.4.12"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "CA1387B2085381BB9FA4A1EEBA72A702698F15CAE0B729F1087A183FFEF9DC50"

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