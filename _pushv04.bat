@echo off
cd /d "C:\Users\Jyux\Museion\_museionholdings-site"
set GIT="C:\Program Files\Git\cmd\git.exe"

echo === remove v0.3 artefacts === > _v04log.txt
del /f /q _push.bat 2>> _v04log.txt
del /f /q _gitlog.txt 2>> _v04log.txt
%GIT% rm --cached -f _push.bat _gitlog.txt 2>> _v04log.txt

echo. >> _v04log.txt
echo === git add . === >> _v04log.txt
%GIT% add -A >> _v04log.txt 2>&1

echo. >> _v04log.txt
echo === status --short === >> _v04log.txt
%GIT% status --short >> _v04log.txt 2>&1

echo. >> _v04log.txt
echo === commit === >> _v04log.txt
%GIT% commit -m "v0.4 - investor section + contact + indexable + cleanup" >> _v04log.txt 2>&1

echo. >> _v04log.txt
echo === push === >> _v04log.txt
%GIT% push origin main >> _v04log.txt 2>&1

echo. >> _v04log.txt
echo === final log === >> _v04log.txt
%GIT% log --oneline -5 >> _v04log.txt 2>&1

echo DONE >> _v04log.txt
