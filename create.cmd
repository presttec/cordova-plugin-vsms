@echo off
D:
cd \Projects\Ionic\Plugins\cordova-plugins-vsms\
REM https://github.com/presttec/cordova-plugin-vsms

REM cordova-plugin-vsms-whatsapp
REM call npm login
for  %%J in (whatsapp w4b wifi) DO (
ECHO %%J
if not exist %%J call plugman create --name %%J --plugin_id cordova-plugin-vsms-%%J --plugin_version 0.0.1
cd %%J
if not exist package.json plugman createpackagejson .
if not exist README.md echo "# blank" >> README.md
git init
git add --all
git commit -m "first commit"
git remote add origin https://github.com/presttec/cordova-plugin-vsms-%%J.git
git push -u origin master
REM call npm init
REM pause
call npm publish --access public
cd ..
)
REM 
REM plugman create --name whatsapp --plugin_id cordova-plugin-vsms-whatsapp --plugin_version 0.0.1
