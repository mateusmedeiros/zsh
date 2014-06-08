Configurations for zsh.

```bash
git clone --recursive https://github.com/mateusmedeiros/zsh-config.git
mv ~/.zshrc ~/.zshrc.old
ln -s $(pwd)/.zshrc ~/.zshrc
mv ~/.zshrc.zni ~/.zshrc.zni.old
ln -s $(pwd)/.zshrc.zni ~/.zshrc.zni
```

```bash
cp -i zsh-config/agnoster/\ agnoster.zsh-theme zsh-config/.oh-my-zsh/themes/agnoster.zsh-theme
cd zsh-config/.oh-my-zsh
git add themes/agnoster.zsh-theme
git commit -m "agnoster"
cd ..
ln -s $(pwd)/.oh-my-zsh ~
```

