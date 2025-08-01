# Set Git Defaults In PC

## Requesting Git Credentials every Time 
- Every Time doing push or pull request it request git credentials 
    - User Name 
    - Password
- Solution
Let's Setup Git Cedential Manager

1. Install .NET SDK 
```bash
sudo dnf install dotnet-sdk-8.0
```

2. Install Git Credential Manager as a .NET Global Tool
```bash
dotnet tool install --global git-credential-manager
```

3. Add GCM to Your PATH (If Needed)
```bash
cat << 'EOF' >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/home/$USER/.dotnet/tools"
EOF

# Refresh your shell (or restart terminal)
source ~/.bash_profile
```
`If you use a different shell (e.g., zsh), modify .zshrc instead.`

4. Set GCM as Your Git Credential Helper
- Tell Git to use the credential manager by running
```bash
git config --global credential.helper manager-core

```
Or, if that doesn't work, try
```bash
git config --global credential.helper manager
```
5. Test GCM Setup
The next time you clone, pull, or push with a remote requiring authentication (e.g., GitHub), you’ll be prompted just once for your credentials or token. The credential manager will securely cache your authentication for future Git operations.


