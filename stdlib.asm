========================================================================================
1.界面函数，直接调用无需任何操作

YanUIs		db 0dh,0ah
		db '	       ',20 dup(01h),0dh,0ah
		db '	       ',01h,'	   yanhaijing	 ',01h,0dh,0ah
		db '	       ',20 dup(01h),0dh,0ah,0dh,0ah
		db '	       ','	       AsmUI',0dh,0ah,0dh,0ah
		db '	       ','	   QQ:776771343',0dh,0ah,0dh,0ah
		db '  -------------------------------------------------',0dh,0ah,0dh,0ah
		db '	Press enter to main...',0dh,0ah,0dh,0ah
		db '			Quit by close the window',0dh,0ah,0dh,0ah,0dh,0ah
		db '	    Copyright <C> YanhaijingTD',0dh,0ah,'$'

YanUI	proc;颜海镜界面包
	mov dx,offset YanUIs;显示提示
	call puts
	call getchar;暂停
	ret
YanUI	endp
===========================================================================================
2.暂停函数，实现暂停功能，直接调用

msgkey  	db 'Press any key to continue ...','$'

pause	proc;暂停提示
	mov dx,offset msgkey;显示提示
	call puts
	call getchar
	ret
pause	endp
=====================================================
3.回车换行函数，实现回车换行功能，直接调用

msgenter	db 0dh,0ah,'$'

enter	proc;回车换行子程序
	mov dx,offset msgenter;显示提示
	call puts;输出字符串
	ret
enter	endp
======================================================
7.改变颜色函数，bh中放颜色，37位表闪烁，6-4背景色，2-0前景色默认 ,兼容dos color
6-4        背景色。可用的是：
6 5 4         颜色
0 0 0         黑
0 0 1         蓝
0 1 0         绿
0 1 1         青
1 0 0         红
1 0 1         绛
1 1 0         褐
1 1 1         浅灰

color 	proc;改变颜色
	mov ah,06h
	mov al,40h;清窗口
	mov cx,0000h
	mov dh,24h
	mov dl,80h
	mov bh,0cbh;
	int 10h
	ret
color	endp
=========================================================