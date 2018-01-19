@echo off

set PYTHON_VERSION=36

set MSYSTEM_VERSION=64

call %~dp0..\config\cfg_global_proxy.cmd

call %~dp0..\config\cfg_sys_path.cmd
call %~dp0..\config\cfg_node_path.cmd
call %~dp0..\config\cfg_python%PYTHON_VERSION%_path.cmd
call %~dp0..\config\cfg_msys%MSYSTEM_VERSION%_path.cmd
call %~dp0..\config\cfg_vscode_path.cmd

set CONTITLE="%MSYSTEM% NVM PYTHON%PYTHON_VERSION%"

set PATH=%SYS_PATH%;%PYTHON_PATH%;%NODE_PATH%;%MINGW_PATH%

set work_dir=%~dp0
set target_arg=%1
set target_attr=%~a1
set target_type=%target_attr:~,1%
if defined target_arg (
  echo target_arg is %target_arg%
  echo target_attr is %target_attr%
  echo target_type is %target_type%
  if "%target_type%" equ "d" (
    echo target is dir
    set work_dir=%~f1
  ) else (
    echo target is file
    set work_dir=%~dp1
  )
)
echo cd to "%work_dir%"
cd "%work_dir%"
set work_dir=
set target_arg=
set target_attr=
set target_type=

start %CONTITLE% %VSCODE_PATH%

:: $ MINGW64 ~
:: pacman -S mingw64/mingw-w64-x86_64-gcc
:: pacman -S mingw64/mingw-w64-x86_64-gdb
:: pacman -S mingw64/mingw-w64-x86_64-make
