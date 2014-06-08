Configurations for zsh.

```bash
git clone --recursive https://github.com/mateusmedeiros/zsh-config.git
mv ~/.zshrc ~/.zshrc.old
ln -s $(pwd)/.zshrc ~/.zshrc
mv ~/.zshrc.zni ~/.zshrc.zni.old
ln -s $(pwd)/.zshrc.zni ~/.zshrc.zni
```

```bash
cp -R zsh-config/.oh-my-zsh ~
cp -i zsh-config/agnoster/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cd ~/.oh-my-zsh
git add themes/agnoster.zsh-theme
git commit -m "agnoster"
```

