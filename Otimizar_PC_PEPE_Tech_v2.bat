@echo off
setlocal enabledelayedexpansion
title Otimizador PEPE Tech v2
color 0A

echo ===============================================
echo      OTIMIZADOR DE PC - PEPE TECH ^& PLAY
echo ===============================================
echo.

REM --- Verifica se esta rodando como Administrador ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Clique com o botao direito neste arquivo e escolha
    echo        "Executar como administrador".
    echo.
    pause
    exit /b 1
)

REM --- Espaco livre antes (em bytes) ---
for /f %%A in ('powershell -NoProfile -Command "(Get-PSDrive C).Free"') do set FREE_BEFORE=%%A

echo [1/3] Ativando plano de energia de Desempenho Maximo...
set GUID_ULT=99999999-9999-9999-9999-999999999999
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 %GUID_ULT% >nul 2>&1
powercfg /setactive %GUID_ULT% >nul 2>&1
if %errorlevel% neq 0 (
    echo      Plano "Desempenho Maximo" indisponivel neste PC.
    echo      Ativando plano "Alto desempenho"...
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
    if !errorlevel! neq 0 (echo      [AVISO] Nao foi possivel trocar o plano de energia.) else (echo      OK: Alto desempenho ativo.)
) else (
    echo      OK: Desempenho Maximo ativo.
)

echo [2/3] Limpando arquivos temporarios...
del /q /f /s "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
for /d %%D in ("C:\Windows\Temp\*") do rd /s /q "%%D" >nul 2>&1
echo      OK: pastas Temp limpas (arquivos em uso sao ignorados).

echo [3/3] Limpando cache de shaders do DirectX...
del /q /f /s "%LOCALAPPDATA%\D3DSCache\*" >nul 2>&1
echo      OK: cache recriado pelo Windows na proxima vez que abrir um jogo.
echo      (Na primeira abertura de cada jogo pode ter leve engasgo.)

REM --- Espaco livre depois ---
for /f %%A in ('powershell -NoProfile -Command "(Get-PSDrive C).Free"') do set FREE_AFTER=%%A
for /f %%A in ('powershell -NoProfile -Command "[math]::Round((%FREE_AFTER% - %FREE_BEFORE%) / 1MB)"') do set FREED_MB=%%A

echo.
echo ===============================================
echo      CONCLUIDO! Espaco liberado: %FREED_MB% MB
echo      Reinicie o PC para aplicar tudo.
echo ===============================================
echo.
pause
