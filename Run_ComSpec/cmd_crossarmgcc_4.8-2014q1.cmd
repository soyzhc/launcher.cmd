@echo off

set CONTITLE="CROSS-ARM-GCC"

set GCC_VERSION=4.8-2014q1

call %~dp0..\config\cfg_sys_path.cmd
call %~dp0..\config\cfg_gcc_%GCC_VERSION%_path.cmd

set MAKE_PATH=C:\Program Files\GNU MCU Eclipse\Build Tools\2.9-20170629-1013\bin\bin

set PATH=%SYS_PATH%;%MAKE_PATH%;%GCC_PATH%

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

start %CONTITLE% %ComSpec%
