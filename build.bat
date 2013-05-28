@echo off
if "%FORGE_HOME%" == "" goto forgeNotSet

echo == Copying "hunternif" ==
xcopy src\hunternif /s /y "%FORGE_HOME%\mcp\src\minecraft\hunternif\"
echo == Copying "mods" ==
xcopy src\mods /s /y "%FORGE_HOME%\mcp\src\minecraft\mods\"

set MOD_SRC_DIR=%cd%
cd "%FORGE_HOME%\mcp"
runtime\bin\python\python_mcp runtime\recompile.py %*
runtime\bin\python\python_mcp runtime\reobfuscate.py %*

echo == Removing "hunternif" ==
rmdir /s /q "%FORGE_HOME%\mcp\src\minecraft\hunternif"
echo == Removing "mods" ==
rmdir /s /q "%FORGE_HOME%\mcp\src\minecraft\mods"

set WINRAR=C:\Program Files\WinRAR\Rar.exe
if not exist "%WINRAR%" goto noWinRAR
echo Found WinRAR
cd "%FORGE_HOME%\mcp\reobf\minecraft"
echo == Copying resource files to "reobf" ==
xcopy "%MOD_SRC_DIR%\src\mods" /s /y "%FORGE_HOME%\mcp\reobf\minecraft\mods\"
xcopy "%MOD_SRC_DIR%\src\mcmod.info" /y "%FORGE_HOME%\mcp\reobf\minecraft\"
xcopy "%MOD_SRC_DIR%\src\*.png" /y "%FORGE_HOME%\mcp\reobf\minecraft\"
echo == Creating achive ==
rem TODO retreive the mod name and version
"%WINRAR%" a -r -ep1 mod.zip ./*
pause
goto end

:noWinRAR
echo WinRAR was not found on your computer, you will have to manually archive the contents of "%FORGE_HOME%\mcp\reobf\minecraft" and add to the archive the "mods" folder, the file "mcmod.info" and the picture.
pause
goto end

:forgeNotSet
echo FORGE_HOME is not set
pause
goto end


:end