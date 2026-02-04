@echo off
chcp 65001 > nul

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format dd-MM-yyyy"') do set FECHA=%%i

echo Subiendo cambios...

git add .

:: Quitar el bat del staging
git reset subir_clase.bat

git commit -m "Clase %FECHA%"
git push -u origin main

pause
