#!/bin/sh

# HomeBrew
if [ ! -x "`which brew`" ]; then
  echo "start install and update brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

# Git
if [ ! -x "`which git`" ]; then
  echo "start install git"
  brew install git
fi


# Zsh
if [ ! -x "`which zsh`" ]; then
  echo "start install zsh"
  brew install zsh
  exec $SHELL -l
  echo /usr/local/bin/zsh | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
  exec $SHELL -l
fi

# neovim
if [ ! -x "`which nvim`" ]; then
  brew install neovim/neovim/neovim
fi

# anyenv
if [ ! -x "`which anyenv`" ]; then
  echo "start install anyenv & python, ruby"
  git clone https://github.com/riywo/anyenv ~/.anyenv
  exec $SHELL -l
  anyenv install pyenv
  anyenv install rbenv
  anyenv install goenv
  exec $SHELL -l
fi

# dotfiles
dotfiles=(`find . -name "dot.*"`)
for file in ${dotfiles[@]};
do
  new=`echo "$file" | sed s/.\\\/dot//g`;
  cmd="cp -rf $PWD/dot$new ~/$new"

  echo $cmd
  eval $cmd
done


# mas (Mac App Store command line interface)
if [ ! -x "`which mas`" ]; then
  echo "start install mas"
  brew install mas

  echo "install App Store Softwares"
  mas install 497799835  # Xcode
fi
