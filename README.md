Configurations for zsh.

```bash
git clone --recursive https://github.com/mateusmedeiros/zsh-config.git
mv ~/.zshrc ~/.zshrc.old > /dev/null 2>&1
ln -s $(pwd)/zsh-config/.zshrc ~
mv ~/.zshrc.zni ~/.zshrc.zni.old > /dev/null 2>&1
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
ln -sf ../../agnoster/agnoster.zsh-theme zsh-config/.oh-my-zsh/themes/agnoster.zsh-theme
cd zsh-config/.oh-my-zsh
git add themes/agnoster.zsh-theme
git commit -m "agnoster"
cd ..
ln -s $(pwd)/.oh-my-zsh ~
```

```bash
ln -s $(pwd)/hg-prompt ~
echo -e "\n\n[extensions]" >> ~/.hgrc
echo -e "prompt = $HOME/hg-prompt/prompt.py" >> ~/.hgrc
```

