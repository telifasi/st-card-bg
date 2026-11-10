@echo off
echo ========================================
echo 开始同步文件到 GitHub...
echo ========================================
echo.

REM 添加所有更改
echo [1/3] 正在添加文件...
git add .

REM 检查是否有更改
git diff-index --quiet HEAD 2>nul
if %errorlevel% equ 0 (
    echo 没有检测到文件变化，无需同步。
    echo.
    pause
    exit /b 0
)

REM 提交更改（使用当前时间作为提交信息）
echo [2/3] 正在提交更改...
git commit -m "更新文件 - %date% %time%"

REM 推送到 GitHub
echo [3/3] 正在推送到 GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo 同步完成！
    echo ========================================
) else (
    echo.
    echo ========================================
    echo 同步失败，请检查网络连接和 Git 配置
    echo ========================================
)

echo.
pause
