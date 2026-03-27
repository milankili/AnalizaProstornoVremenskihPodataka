@echo off

echo === Unesi commit poruku (Enter = default "update") ===
set /p msg=

if "%msg%"=="" set msg=update

echo === Rendering Quarto ===
quarto render

echo === Git add ===
git add .

git diff --cached --quiet
if %errorlevel%==0 (
    echo === Nema promena za commit ===
    pause
    exit /b
)

echo === Commit ===
git commit -m "%msg%"

echo === Push ===
git push

echo === DONE ===
pause