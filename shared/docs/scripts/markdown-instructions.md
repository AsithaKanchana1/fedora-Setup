

<!-- toc -->



<!-- tocstop -->

# Markdown Formatting 
## Automated Table of Contents(TOC) Workflow

- This Guide will help to to create script that can create TOC for Markdown files stat to finish 

- This Is Re usable script 

- Will affect `Globly`
## Dependecise and  Installation
1. Install markdown-toc once, system-wide
### Create a personal directory for global npm CLIs
```bash
mkdir -p "$HOME/.npm-global"
```
### Tell npm to use it (no sudo needed)
```bash
npm config set prefix "$HOME/.npm-global"
```
### Add the bin directory to your PATH
```bash
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Install the tool
```bash
npm install -g markdown-toc
```
Why avoid sudo?
Everything lives in $HOME/.npm-global, so you never fight permissions and every user can keep separate versions if needed.
(My Prefferd Way is  to use `sudo`[**sudo install -g markdown-toc**])
2. Create the “update-all-tocs.sh” helper (one time only)

### Pick a folder for personal scripts
```bash
mkdir -p ~/bin
```

### Write the script
```bash
cat <<'EOF' > ~/bin/update-all-tocs.sh
#!/usr/bin/env bash
# Refresh the Table of Contents in every *.md file in the current directory

shopt -s nullglob          # skip loop if no *.md files
for md in *.md; do
  markdown-toc -i "$md"    # edit file in place
  echo "Updated TOC in $md"
done
EOF
```

### Make it executable
```bash
chmod +x ~/bin/update-all-tocs.sh
```

### Ensure ~/bin is on your PATH
```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

- You now have a global command called update-all-tocs.sh.

3. Day-to-day usage
- For a single Markdown file
### Inside the folder that contains the file

![toc command](../../assets/images/md-img/<!--toc-->.png)




' | cat - your-file.md > temp && mv temp your-file.md   # add placeholder once
markdown-toc -i your-file.md                                              # generate or refresh TOC

- For every Markdown file in the current directory
```bash
update-all-tocs.sh
```

-  Ths will automatically finds *.md, updates each TOC
- Run the script any time after major edits; it rewrites every T O C so links stay accurate.


## Usage
- to use This Script You Have to add following Line in top of the  your `markdown` files 

![toc command](../../assets/images/md-img/<!--toc-->.png)

- if you didnt add that line this script will skip that file 

- to affect all of the files in your current derectry 
```bash
update-all-tocs.sh
```

