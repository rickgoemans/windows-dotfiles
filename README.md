# windows-dotfiles

This repository contains Windows configuration files and installation helpers for a personal Windows setup.

## Setup on a fresh Windows installation

1. Install Git for Windows using winget:
   - Open PowerShell as administrator and run:
     ```powershell
     winget install --id Git.Git -e --source winget
     ```
   - During install, choose "Git from the command line and also from 3rd-party software."
2. Install GitHub Desktop (optional but recommended):
   - Open PowerShell as administrator and run:
     ```powershell
     winget install --id GitHub.GitHubDesktop -e --source winget
     ```
3. Create an SSH key:
   - Open PowerShell and run:
     ```powershell
     ssh-keygen -t ed25519 -C "your_email@example.com"
     ```
   - Accept the default file location and optionally enter a passphrase.
4. Add the SSH public key to your GitHub account:
   - Copy the public key with:
     ```powershell
     type $env:USERPROFILE\.ssh\id_ed25519.pub
     ```
   - Paste the key into GitHub under Settings > SSH and GPG keys > New SSH key.
5. Verify SSH access:
   - Run:
     ```powershell
     ssh -T git@github.com
     ```
6. Clone this repository:
   - Use:
     ```powershell
     git clone git@github.com:your-username/windows-dotfiles.git
     ```
7. Run the install script:
   - From the repo folder, run:
     ```powershell
     .\InstallSoftware.ps1
     ```
   - If execution is disabled, enable it first:
     ```powershell
     Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
     ```
