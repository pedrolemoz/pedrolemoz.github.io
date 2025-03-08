# Going to master for a while
flutter channel master
flutter upgrade
flutter clean
rm -rf pubspec.lock
flutter pub get
flutter build web --wasm
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
rm -rf .flutter-plugins
rm -rf .flutter-plugins-dependencies
rm -rf .gitignore
rm -rf .metadata
rm -rf pubspec.lock
rm -rf pubspec.yaml
git checkout deploy --force
rm -rf assets/
rm -rf canvaskit/
rm -rf .last_build_id
rm -rf flutter_service_worker.js
rm -rf flutter.js
rm -rf index.html
rm -rf main.dart.js
rm -rf main.dart.js.map
rm -rf manifest.json
rm -rf version.json
mv ./build/web_wasm/* ./
rm -rf build/
git add .
git reset HEAD -- deploy.sh
current_date=`date +"%Y-%m-%d %T"`
git commit -m "[WASM] Automatic build ($current_date)"
git push origin deploy
# Going back to stable
flutter channel stable
flutter upgrade