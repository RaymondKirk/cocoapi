#!/usr/bin/env bash
cd "$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

git clone https://github.com/RaymondKirk/cocoapi tmp_cocoapi
cd tmp_cocoapi
git checkout --orphan python-api
find . -maxdepth 1 \! -regex  '.*\(PythonAPI\|common\|\.\|\.\.\|\.git\)$' | xargs rm -r
mv PythonAPI/* .
rm -r PythonAPI
sed -i 's/..\/common/common/g' setup.py
git add .
git commit -m "Cleaned master and pushed python-api branch"
git push origin python-api -f
cd ..
rm -rf tmp_cocoapi