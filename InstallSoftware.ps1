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
    @{name = "Bitwarden.Bitwarden"},
    @{name = "Brave.Brave"},
    @{name = "Corsair.iCUE.5"},
    @{name = "Logitech.GHUB" },
    @{name = "Malwarebytes.Malwarebytes" },
    @{name = "Microsoft.PowerToys" },
    @{name = "MOTU.MSeries" },
    @{name = "RevoUninstaller.RevoUninstaller" },
    @{name = "Rufus.Rufus" },
    @{name = "Spotify.Spotify" },
    @{name = "Tailscale.Tailscale" },
    
    # Coding
    @{name = "Docker.DockerDesktop" },
    # @{name = "Git.Git" },
    # @{name = "GitHub.GitHubDesktop" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "OpenJS.NodeJS"},
    @{name = "pnpm.pnpm"},
    @{name = "PuTTY.PuTTY" },
    @{name = "TablePlus.TablePlus" },
    @{name = "TimKosse.FileZilla.Client" },

    # Gaming
    @{name = "Discord.Discord" },
    @{name = "ElectronicArts.EADesktop" },
    @{name = "Valve.Steam" },

    # Overclocking
    @{name = "CPUID.CPU-Z.MSI" },
    @{name = "Guru3D.Afterburner" },
    @{name = "MSI.Kombustor.4"},
    @{name = "REALiX.HWiNFO" },
    @{name = "TechPowerUp.GPU-Z" },
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
