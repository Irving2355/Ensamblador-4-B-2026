@echo off
chcp 65001 > nul

:: Obtener fecha actual en formato DD-MM-YYYY usando PowerShell
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format dd-MM-yyyy"') do set FECHA=%%i

echo =====================================
echo      Subiendo cambios a Git
echo      Fecha: %FECHA%
echo =====================================

git add .
git commit -m "Clase %FECHA%"
git push -u origin main

echo.
echo Proceso terminado.
pause
