cd ~
cp -f ~/dotfiles/.bashrc ~/.bashrc
cp -Rf ~/dotfiles/dotvim/.vim ~/.vim
cp -f ~/dotfiles/dotvim/.vimrc ~/.vimrc
cp -f ~/dotfiles/.gitignore_global ~/.gitignore_global
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.bashrc
