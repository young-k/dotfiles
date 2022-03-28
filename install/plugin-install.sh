cd ~

echo 'Copying bash configs...'
cp -f ~/dotfiles/.bashrc ~/.bashrc

echo 'Copying vim configs...'
cp -Rf ~/dotfiles/dotvim/.vim ~/.vim
cp -f ~/dotfiles/dotvim/vimrc ~/.vimrc

echo 'Copying global gitignore...'
cp -f ~/dotfiles/.gitignore_global ~/.gitignore_global

echo 'Copying zsh configs...'
cp -f ~/dotfiles/dotprezto/zpreztorc ~/.zpreztorc
cp -f ~/dotfiles/dotprezto/zshrc ~/.zshrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.bashrc
