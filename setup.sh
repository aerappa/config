#!/usr/bin/bash

echo Starting..
if [ -z ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc_bkp
  echo Moving old vimrc to vimrc_bkp...
fi 
cp vimrc ~/.vimrc
# install VimPlug
echo Installing VimPlug...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo done
echo Installing vim plugins...
vim +PluginInstall +qall
echo Installing fish shell...
sudo apt install fish
echo done
echo Installing omf...
curl -L https://get.oh-my.fish | fish
echo done
echo Installing fzf...
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo Installing Gogh...
sudo apt-get install dconf-cli uuid-runtime
bash -c "$(wget -qO- https://git.io/vQgMr)"
echo done
echo Setting Git aliases...
if [ -z ~/.vimrc ]
then
  mv ~/.gitconfig ~/.gitconfig_bkp
  echo Moving old gitconfig to gitconfig_bkp...
fi 
cp gitconfig ~/.gitconfig
