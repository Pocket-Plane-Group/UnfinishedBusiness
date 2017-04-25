@echo off
echo "Unfinished Business is updating all WeiDU programs. Please be patient..."
"setup-ub.exe" --update-all > nul
cls
rem echo Press any key to install Unfinished Business ...
echo "Some String" | pause > nul
"setup-ub.exe"