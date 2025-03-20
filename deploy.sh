npm install
npm run build

shopt -s extglob
rm -rf !(dist)

shopt -u extglob

mv ./dist/* ./
rm -rf ./dist/

git add .
git reset HEAD -- deploy.sh
current_date=`date +"%Y-%m-%d %T"`
git commit -m "Automatic build ($current_date)"
git push origin deploy