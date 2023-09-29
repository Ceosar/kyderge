tasm LOCKER.asm 
pause
tlink.exe LOCKER.obj /t

del *.obj
del *.map

LOCKER.COM i