# 1. Make sure the Microsoft App Installer is installed:
#    https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# 2. Edit the list of apps to install.
# 3. Run this script as administrator.

Write-Output "Installing Apps"

# Winget
$apps = @(
    # General
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Chocolatey.ChocolateyGUI" },
    @{name = "Logitech.GHUB" },
    @{name = "Malwarebytes.Malwarebytes" },
    @{name = "Microsoft.PowerToys" },
    @{name = "MOTU.MSeries" },
    @{name = "Notion.Notion" },
    @{name = "qBittorrent.qBittorrent" },
    @{name = "RevoUninstaller.RevoUninstaller" },
    @{name = "Sonos.Controller" },
    @{name = "Spotify.Spotify" },
    @{name = "VideoLAN.VLC" },
    
    # Coding
    @{name = "Docker.DockerDesktop" },
    @{name = "Git.Git" },
    @{name = "GitHub.GitHubDesktop" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "OpenJS.NodeJS.LTS" },
    @{name = "PuTTY.PuTTY" },
    @{name = "TablePlus.TablePlus" },
    @{name = "TimKosse.FileZilla.Client" },

    # Gaming
    @{name = "Discord.Discord" },
    @{name = "ElectronicArts.EADesktop" },
    @{name = "EpicGames.EpicGamesLauncher" },
    @{name = "Overwolf.CurseForge" },
    # @{name = "RiotGames.LeagueOfLegends.EUW" }, Disabled because it would install on the default location
    @{name = "Ubisoft.Connect" },
    @{name = "Valve.Steam" },

    # Overclocking
    @{name = "CPUID.CPU-Z" },
    @{name = "CPUID.HWMonitor" },
    @{name = "TechPowerUp.GPU-Z" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    } else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}

# Chocolatey

# Install chocolatey-cli
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$apps = @(
    # General
    @{name = "amd-ryzen-chipset" },

    # Overclocking
    @{name = "amd-ryzen-master" },
    @{name = "msiafterburner" }
);
Foreach ($app in $apps) {
    $listApp = choco search $app.name --local-only

    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        choco install $app.name
    } else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
