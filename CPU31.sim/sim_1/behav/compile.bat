@echo off
set bin_path=D:\\digital_logic\\modelsim_10.4c\\_modelsim\\win32
call %bin_path%/vsim  -c -do "do {post_system_compile.do}" -l compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
