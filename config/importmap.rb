# Pin npm packages by running ./bin/importmap

#Javascriptのライブラリの名前と実際のライブラリのファイルを対応付ける
pin "application", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "popper", to: "popper.js", preload: true
