/usr/bish/bash


mv ~/.vimrc ~/.vimrc_bkp
cp vimrc ~/.vimrc
# install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install fish
sudo apt install omf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
