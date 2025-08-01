# Set Git Defaults On PC 
## Tested On
- Fedora 42 

## Git Requests Credentials Every Time

- When using Git over HTTPS Every git pull or git push asks for

    - Username

    - Password or Personal Access Token

## Best Solution
### **Use GitHub CLI Authentication (gh auth login)**
The GitHub CLI (gh) provides an effortless way to authenticate and cache credentials for all your GitHub operations, both from the CLI and with regular Git commands.

1. Install the GitHub CLI and Authenticate
```bash
sudo dnf install gh
```
Then, start the interactive login:

```bash
gh auth login
```
Follow the prompts.

When shown, copy the one-time code and visit the GitHub URL provided (opens in your web browser).

Complete authentication and approve the CLI access for your account.

2. Configure Git to Use GitHub CLI Credentials
Let gh set up your global git credential helper:

```bash
gh auth setup-git
```
This will configure Git to use your GitHub CLI authentication automatically for all future GitHub actions (no more token or password prompts).

3. Test Your Setup
Try a push or pull on one of your GitHub repositories:

```bash
git push origin main
git pull
```
You won’t need to enter your username or password again. Everything is cached and managed securely by the CLI.





