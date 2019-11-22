#!/bin/bash

echo "Enter the title:"
read title
sed -i -e "s/^\# Papaer Template/# ${title}/" ./README.md
NOW_DATE=`date "+%F"`
sed -i -e "s/YYYY-MM-DD/${NOW_DATE}/" ./README.md
git init
touch manuscript/1_main.md
mkdir figs
mkdir out
rm README.md-e
rm init.sh
