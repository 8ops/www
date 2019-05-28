#!/bin/bash

prepare(){
cat README.html | \
  sed -e 's/fonts.googleapis.com\/css/www.8ops.top\/asset\/index.css/g' \
      -e 's/file:\/\/.*github/asset/g' > index.html

cat >> index.html <<EOF
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b4169476d6bbeb09748f80aca3fa4d2e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
EOF
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

