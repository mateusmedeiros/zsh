Configurations for zsh.

```bash
cd ~/.config
git clone --recursive https://github.com/mateusmedeiros/zsh.git
ln -s ~/.config/zsh/.zshenv ~
```

Arch
```bash
mkdir -p ~/.local/share/fonts
cp ~/.config/zsh/fonts/* ~/.local/share/fonts
fc-cache -fv
yaourt -S powerline-fonts-git
```
