$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version = "10.2.11"
$url = "https://dl.memoq.com/memoq/memoQ-$version.exe"
$checksum = "C7E893EEF0A6F2BC4D87D6932A46DCC1EBC8A0FB17D5988DD1ED67CFCC2A26CA"

$packageArgs = @{
  fullZipPath   = "$toolsDir\memoQ.exe"
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  file          = "$toolsDir\memoQ-$version.exe"

  softwareName  = "memoQ Translator Pro version $version"

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = "/SILENT /CLOSEAPPLICATIONS /NORESTART /LOG `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).EXEInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Get-ChocolateyWebFile `
  -PackageName $packageArgs.packageName `
  -FileFullPath $packageArgs.file `
  -Url $packageArgs.url

Get-ChecksumValid `
-File $packageArgs.file `
-Checksum $packageArgs.checksum `
-ChecksumType $packageArgs.checksumType `
-OriginalUrl $packageArgs.url

Install-ChocolateyInstallPackage `
  -PackageName $packageArgs.packageName `
  -FileType $packageArgs.fileType `
  -File $packageArgs.file `
  -SilentArgs $packageArgs.silentArgs `
  -ValidExitCodes $packageArgs.validExitCodes
