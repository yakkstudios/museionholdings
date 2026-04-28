@echo off
cd /d "C:\Users\Jyux\Museion\_museionholdings-site"
set GIT="C:\Program Files\Git\cmd\git.exe"

echo === git status === > _gitlog.txt
%GIT% status >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === fetch origin === >> _gitlog.txt
%GIT% fetch origin main >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === branch -a === >> _gitlog.txt
%GIT% branch -a >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === reset --soft origin/main === >> _gitlog.txt
%GIT% reset --soft origin/main >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === add . === >> _gitlog.txt
%GIT% add . >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === status after add === >> _gitlog.txt
%GIT% status --short >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === commit === >> _gitlog.txt
%GIT% commit -m "v0.3 - real brand logos + static hero + nav fix" >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === push === >> _gitlog.txt
%GIT% push -u origin main >> _gitlog.txt 2>&1

echo. >> _gitlog.txt
echo === final log === >> _gitlog.txt
%GIT% log --oneline -5 >> _gitlog.txt 2>&1

echo DONE >> _gitlog.txt
