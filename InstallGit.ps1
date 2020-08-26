[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$GIT_VERSION="2.28.0"
$GIT_PATCH_VERSION="1"
$GIT_DOWNLOAD_SHA256="c391cb018ae959a76ad2688b0cc7a05f6541d0b43d0ff4d4dacab923363c8dd8"

$destination = "C:\Program Files\Git"

New-Item -ItemType Directory -Force -Path $destination

# Download the installer
Write-Verbose "Downloading Git Version $GIT_VERSION" -Verbose

Invoke-WebRequest ("https://github.com/git-for-windows/git/releases/download/v{0}.windows.{1}/Git-{0}-64-bit.exe" -f $GIT_VERSION, $GIT_PATCH_VERSION) -OutFile "$env:TEMP/git.exe" -UseBasicParsing;


# Start the installation
Write-Verbose "Install Git Version $GIT_VERSION" -Verbose

Start-Process -FilePath "$env:TEMP/git.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/SP-', ('/DIR="{0}"' -f $destination) -PassThru | Wait-Process;

Write-Verbose "Delete Working Directory" -Verbose

# Remove the installer
dir "$env:TEMP" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

[Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\Git\usr\bin",[EnvironmentVariableTarget]::Machine)

