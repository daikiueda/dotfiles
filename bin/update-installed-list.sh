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

cd $LIST_FILE_PATH

# brew
printf "\e[1;36mbrew list --versions\e[m\n"
rm ./Brewfile
brew bundle dump
brew list --versions > ${LIST_FILE_PATH}/brew.list.txt
cat ${LIST_FILE_PATH}/brew.list.txt

# npm
printf "\e[1;36mnpm ls -g --depth 0\e[m\n"
npm ls -g --depth 0 > ${LIST_FILE_PATH}/npm.list.txt
cat ${LIST_FILE_PATH}/npm.list.txt

printf "\n\e[1;36mgit add\e[m\n"
cd "${LIST_FILE_PATH}"
# git add .
git status -s

printf "\n\e[1;36mdone!\e[m\n"
