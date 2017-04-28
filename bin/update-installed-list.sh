#!/bin/sh

THIS_DIR=$(dirname $0)
PC_NAME=$(/usr/sbin/scutil --get LocalHostName)
LIST_FILE_PATH="${THIS_DIR}/../installed-list/${PC_NAME}"

if ls ${LIST_FILE_PATH} >/dev/null 2>&1; then
    :
else
    if mkdir -p ${LIST_FILE_PATH} >/dev/null 2>&1; then
        printf "\e[1;36m${LIST_FILE_PATH} was created.\e[m\n\n"
    else
        printf "\e[1;31mfailed to create ${LIST_FILE_PATH}\e[m\n"
        exit 1
    fi
fi

# fisher
printf "\e[1;36mfisherman\e[m\n"
ls -1 ~/.config/fisherman > ${LIST_FILE_PATH}/fisherman.list.txt
cat ${LIST_FILE_PATH}/fisherman.list.txt

# npm
printf "\e[1;36mnpm ls -g --depth 0\e[m\n"
npm ls -g --depth 0 > ${LIST_FILE_PATH}/npm.list.txt
cat ${LIST_FILE_PATH}/npm.list.txt

# brew
printf "\e[1;36mbrew list --versions\e[m\n"
brew list --versions > ${LIST_FILE_PATH}/brew.list.txt
cat ${LIST_FILE_PATH}/brew.list.txt

# brew cask
printf "\n\e[1;36mbrew cask list --versions\e[m\n"
brew cask list --versions > ${LIST_FILE_PATH}/brew.cask.list.txt
cat ${LIST_FILE_PATH}/brew.cask.list.txt

# mas
printf "\n\e[1;36mmas list\e[m\n"
mas list > ${LIST_FILE_PATH}/mas.list.txt
cat ${LIST_FILE_PATH}/mas.list.txt

# Atom
printf "\n\e[1;36mapm list -i\e[m\n"
apm list -i > ${LIST_FILE_PATH}/apm.list.txt
cat ${LIST_FILE_PATH}/apm.list.txt

printf "\n\e[1;36mgit add\e[m\n"
cd "${LIST_FILE_PATH}"
git add *.list.txt
git status -s

printf "\n\e[1;36mdone!\e[m\n"
