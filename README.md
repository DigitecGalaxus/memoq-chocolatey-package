# memoQ Chocolatey Package
![Chocolatey Version](https://img.shields.io/chocolatey/v/memoq-translator-pro?label=chocolatey)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/DigitecGalaxus/memoq-chocolatey-package/main.yml)

This repository contains the source code for a Chocolatey package that installs and updates the memoQ Translator Pro from Kilgray. Feel free to make adjustments and improvements to the code in this repository.

## Installation
You can install the memoQ Translator Pro package using Chocolatey. Make sure you have Chocolatey installed on your system. If you don't have it, you can get it from [chocolatey.org](https://chocolatey.org/).
Once Chocolatey is installed, run the following command in your command prompt or PowerShell:

```bash
choco upgrade memoq-translator-pro
```

## Updating the Package
To release a new version of the memoQ Translator Pro package, follow these steps:

1. Update the version number in the chocolateyinstall.ps1 file. Modify the $version variable to match the new version. For example:
```bash
$version = '10.2.11'
```

2. Update the checksum of the new installation file in the chocolateyinstall.ps1 file. Modify the $checksum variable accordingly.
```bash
$checksum = "C7E893EEF0A6F2BC4D87D6932A46DCC1EBC8A0FB17D5988DD1ED67CFCC2A26CA"
```

3. Create a new GitHub tag that matches the new version number. For example:
```bash
git tag 10.2.11
```

4. Commit your changes to the repository. Make sure you have staged all the changes you made in chocolateyinstall.ps1 and adapt the path in the git add command to the actual location of your chocolateyinstall.ps1 file:
```bash
git add tools/chocolateyinstall.ps1
git commit -m "Update version to 10.2.11"
```

5. Push the committed changes and the new tag (with ``` --tags```) to the remote repository.

GitHub Actions will automatically build and publish the updated package to Chocolatey based on the newly created tag.

## Contributing
Contributions to this repository are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.