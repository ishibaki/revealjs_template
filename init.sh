#!/bin/bash

echo "Enter the title:"
read title
sed -i -e "s/^\# Papaer Template/# ${title}/" ./README.md
sed -i -e "s/^\% Sample/% ${title}/" ./manuscript/0_1_meta.md
NOW_DATE=`date "+%F"`
sed -i -e "s/YYYY-MM-DD/${NOW_DATE}/" ./README.md
git init
touch manuscript/1_main.md
mkdir figs
mkdir out
ln -s ../reveal.js out/reveal.js
rm README.md-e
rm manuscript/0_1_meta.md-e
rm init.sh
