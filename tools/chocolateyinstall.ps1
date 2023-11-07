$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "10.3.12"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "12E2E35BCAA96F11E6B70348DBA26C762977C71DDFBA346E37B9C22443067822"

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