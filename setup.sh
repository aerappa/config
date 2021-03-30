#!/usr/bin/bash

echo Starting..
###################################################################
# VIM
###################################################################
if [ -f ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc_bkp
  echo Moving old vimrc to vimrc_bkp...
fi
ln -sr ./vimrc ~/.vimrc
echo Installing VimPlug...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo done
echo Installing vim plugins...
vim +PluginInstall +qall
###################################################################
# FISH
###################################################################
echo Installing fish shell...
sudo apt install fish
echo done
echo Installing omf...
curl -L https://get.oh-my.fish | fish
echo done
echo Installing fzf...
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
if [ -d ~/.config/fish ]
then
  mv ~/.config/fish ~/.config/fish_bkp
  echo Moving old .config/fish to /config/fish_bkp...
fi
ln -sr ./fish ~/.config/fish
###################################################################
# GOGH
###################################################################
echo Installing Gogh...
sudo apt-get install dconf-cli uuid-runtime
bash -c "$(wget -qO- https://git.io/vQgMr)"
echo done
###################################################################
# GIT
###################################################################
echo Setting Git aliases...
if [ -f ~/.gitconfig ]
then
  mv ~/.gitconfig ~/.gitconfig_bkp
  echo Moving old gitconfig to gitconfig_bkp...
fi
ln -sr ./gitconfig ~/.gitconfig
