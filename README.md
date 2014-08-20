Configurations for zsh.

```bash
git clone --recursive https://github.com/mateusmedeiros/zsh-config.git
mv ~/.zshrc ~/.zshrc.old
ln -s $(pwd)/zsh-config/.zshrc ~
mv ~/.zshrc.zni ~/.zshrc.zni.old
ln -s $(pwd)/zsh-config/.zshrc.zni ~
ln -s $(pwd)/zsh-config/.profile ~
ln -s $(pwd)/zsh-config/.path ~
ln -s $(pwd)/zsh-config/solarized-console.sh ~
```

```bash
yaourt -S powerline-fonts-git
```
( https://aur.archlinux.org/packages/powerline-fonts-git/ )

```bash
cd zsh-config/.oh-my-zsh
git checkout master
cd ../..
cp -i zsh-config/agnoster/\ agnoster.zsh-theme zsh-config/.oh-my-zsh/themes/agnoster.zsh-theme
cd zsh-config/.oh-my-zsh
git add themes/agnoster.zsh-theme
git commit -m "agnoster"
cd ..
ln -s $(pwd)/.oh-my-zsh ~
```

