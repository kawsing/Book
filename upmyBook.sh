#!/bin/bash 
#author:kawsing
git add .
git commit -m "Publish Book `date`"
#git push -u origin gh-pages
git push origin HEAD:gh-pages
