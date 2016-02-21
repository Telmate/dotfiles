#!/usr/bin/env bash
echo "\n"
echo "======================="
echo "= Create dirs & files ="
echo "======================="
if test ![ -d "$HOME/.history"] ; then
  mkdir $HOME/.history
fi

if test ![ -d "$HOME/.ssh"] ; then
  mkdir $HOME/.ssh
  touch $HOME/.ssh/id_rsa
  touch $HOME/.ssh/id_rsa.pub
  chmod 700 $HOME/.ssh/id_rsa
  chmod 700 $HOME/.ssh/id_rsa.pub
fi

echo "\n"
echo "============"
echo "= Symlinks ="
echo "============"
for f in $(find $HOME/.dotfiles/symlinks -maxdepth 1 -iname '.*')
 do ln -s $f ~/
done
echo "\n"
ls -alh ~/

echo "\n"
echo "============"
echo "= Homebrew ="
echo "============"
sh $HOME/.dotfiles/brew.sh
