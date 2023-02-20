flutter build web --release
rm -rf .dart_tool/
rm -rf .vscode/
rm -rf android/
rm -rf assets/
rm -rf ios/
rm -rf lib/
rm -rf linux/
rm -rf macos/
rm -rf web/
rm -rf windows/
rm .metadata
rm .gitignore
rm pubspec.lock
rm pubspec.yaml
mv ./build/web/* ./
rm -rf build
git checkout deploy
git add .
git reset HEAD -- deploy.sh
git commit -m "Automatic build"
git push origin deploy