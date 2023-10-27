$msixBundleUrl = "https://github.com/microsoft/winget-cli/releases/download/v1.6.2771/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$downloadPath = "$env:ProgramData\pmtech\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

# Download the MSIX bundle
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($msixBundleUrl, $downloadPath)

# Check if the file exists after download
if (Test-Path $downloadPath) {
	
	try {
    # Attempt to install the MSIX bundle
    Add-AppxPackage -Path $downloadPath
    Write-Output "Installation was successful."
} catch {
    Write-Output "Installation failed with error: $_"
}	
} else {
    Write-Output "File download failed."
}

# Clean up the downloaded file
Remove-Item $downloadPath
