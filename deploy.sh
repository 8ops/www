#!/bin/bash

prepare(){
cat Readme.html | \
  sed -e 's/fonts.googleapis.com\/css/www.8ops.top\/asset\/index.css/g' \
      -e 's/file:\/\/.*github/asset/g' > index.html
}

deploy(){
upx switch jesse-8ops-www

upx put index.html index.html
upx put favicon.ico favicon.ico
upx sync --delete asset/ asset/

upx switch jesse-8ops-normal
}

prepare
deploy

