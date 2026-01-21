git checkout deploy --force
git add .
git reset HEAD -- deploy.sh
current_date=`date +"%Y-%m-%d %T"`
git commit -m "Automatic build ($current_date)"
git push origin deploy