#!/bin/bash

suffix=".$(date "+%Y%m%d")"
suffix=${suffix:-.old}

user="${USER}"
email="${USER}@gmail.com"

echo "Install dot files to your home folder ..."
mv .git _git
ls -d .* -1 |tail -n +3 > filelist

while read filename
do
	[ -f ~/${filename} ] && mv ~/${filename} ~/${filename}${suffix}
	cp -rf ${filename} ~/${filename}
done < filelist
rm -f filelist

cp -rf tmux ~/.tmux

mv _git .git
echo "Done!"
echo -e "\033[1;41mNote: Please open ~/.gitconfig and modify User and Email manually if they are incorrect!\033[0m"
