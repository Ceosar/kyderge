
 ;����������������������������������������������������������
 ;��                                                      ��
 ;��         ���������������������������������Ŀ          ��
 ;��         � � � � � � � � � �   L O C K E R �          ��
 ;��         �����������������������������������          ��
 ;��                                                      ��
 ;�� �� १����⭠� �ணࠬ�� COM ⨯�, "��������" ��  ��
 ;�� �६�  ����������. �ணࠬ��  ���墠�뢠��  �����  ��
 ;�� ���뢠��� Int09 � �������� � १����� 5232 ����.   ��
 ;��                                                      ��
 ;����������������������������������������������������������


 PROGRAM   segment
           assume CS:PROGRAM
           org   100h         ;�ய�� PSP ��� COM-�ணࠬ��

 Start:    jmp   InitProc     ;���室 �� ���樠������


 ;��������� � � � � � � � � � � �   � � � � � � ������������

 FuncNum   equ   0EEh           ;����������� �㭪�� ��-
                                ;�뢠��� BIOS Int16h
 CodeOut   equ   2D0Ch          ;���,�����頥�� ��訬 ��-
                                ;ࠡ��稪�� Int16h
 TestInt09 equ   9D0Ah          ;᫮�� ��। Int09h
 TestInt16 equ   3AFAh          ;᫮�� ��। Int16h

 OldInt09  label dword          ;��࠭���� ����� Int09h:
  OfsInt09 dw    ?              ;   ��� ᬥ饭��
  SegInt09 dw    ?              ;   � ᥣ����

 OldInt16  label dword          ;��࠭���� ����� Int16h:
  OfsInt16 dw    ?              ;   ��� ᬥ饭��
  SegInt16 dw    ?              ;   � ᥣ����

 OK_Text   db    0              ;�ਧ��� ��襭�� �࠭�
 Sign      db    ?              ;�������⢮ ����⨩ Ctrl
 VideoLen  equ   800h           ;����� ���������

 VideoBuf  db    160 dup(' ')
 db  13 dup(' ')
 db '����������������������������������������������������ͻ'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '�   ��� ࠧ�����஢�� ������ �� ࠧ� LeftControl   �'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '����������������������������������������������������ͼ'
 db  2000 dup(' ')

 AttrBuf   db    VideoLen dup(07h)  ;��ਡ��� �࠭�
 VideoBeg  dw    0B800h         ;���� ��砫� �����������
 VideoOffs dw    ?              ;ᬥ饭�� ��⨢��� ��࠭���
 CurSize   dw    ?              ;��࠭���� ࠧ��� �����

 ;������ � � � � � � � � � � �   � � � � � � � � � ���������

 ;
 ;������������ ������ ������������ � ������� ���������

 VideoXcg proc
     lea   DI,VideoBuf   ;� DI - ���� ���� ᨬ�����
     lea   SI,AttrBuf    ;� SI - ���� ���� ��ਡ�⮢

     mov   AX,VideoBeg   ;�� ES - ᥣ����� ����
     mov   ES,AX         ;٭�砫� �����������

     mov   CX,VideoLen   ;� CX - ����� ���������
     mov   BX,VideoOffs  ;� BX - ���. ᬥ饭�� ��ப�

   Draw:
     mov   AX,ES:[BX]    ;��������� ᨬ���/��ਡ�� ��
     xchg  AH,DS:[SI]    ;��࠭� � ᨬ����� � ��ਡ�-
     xchg  AL,DS:[DI]    ;�⮬ �� ���஢
     mov   ES:[BX],AX    ;�

     inc   SI            ;�㢥����� ����
     inc   DI            ;٢ �����

     inc   BX            ;�㢥����� ����
     inc   BX            ;٢ ���������

     loop  Draw          ;ᤥ���� ��� �ᥩ �����������
     ret                 ;������
 VideoXcg endp

 ;
 ;���������� ���������� Int09h (���������� �� ����������)

     dw    TestInt09     ;᫮�� ��� �����㦥��� ���墠�

 Int09Hand proc
     push  AX            ;�
     push  BX            ;�
     push  CX            ;���࠭���
     push  DI            ;��ᯮ��㥬�
     push  SI            ;�ॣ�����
     push  DS            ;�
     push  ES            ;�

     push  CS            ;�㪠���� DS ��
     pop   DS            ;٭��� �ணࠬ��

     in    AL,60h        ;������� ᪠� ��� ����⮩ ������

     cmp   AL,26h        ;��஢���� �� ᪠�-��� ������
     jne   Exit_09       ;�<L> � ���, �᫨ �� ��

     xor   AX,AX         ;�
     mov   ES,AX         ;��஢���� 䫠�� ���������� ��
     mov   AL,ES:[417h]  ;�����⨥ <Ctrl+Alt>
     and   AL,0010b        ;�
     cmp   AL,0010b        ;�
     je    Cont          ;�

   Exit_09:
     jmp   Exit09        ;��室

   Cont:


     sti                 ;ࠧ���� ���뢠���

     mov   AH,0Fh        ;�������� ⥪�騩
     int   10h           ;٢����०��
     cmp   AL,2          ;�
     je    InText        ;���३� �� InText
     cmp   AL,3          ;��᫨ ०��
     je    InText        ;�⥪�⮢� 80#25
     cmp   AL,7          ;�
     je    InText        ;�

     jmp   short SwLoop1 ;���� - �ய�����

  InText:
     xor   AX,AX         ;���⠭����� ᥣ�����
     mov   ES,AX         ;٠��� � 0000h

     mov   AX,ES:[44Eh]  ;�������� ᬥ饭�� ��⨢���
     mov   VideoOffs,AX  ;���࠭��� � VideoOffs

     mov   AX,ES:[44Ch]  ;��ࠢ���� ����� ���������
     cmp   AX,1000h      ;�� 1000h.�᫨ �� ࠢ��,
     jne   Exit009       ;�� ०�� EGA Lines
                         ;�(�࠭ ����� �� ����)
     mov   AH,03h        ;����� ��࠭���
     int   10h           ;�ࠧ��� �����
     mov   CurSize,CX    ;٢ CurSize

     mov   AH,01h        ;�
     mov   CH,20h        ;�� �������� ���
     int   10h           ;�

     mov   OK_Text,01h   ;��⠭����� �ਧ��� ��襭��
                         ;�࠭�
     call  VideoXcg      ;� �맢��� ��楤��� ��襭��

   SwLoop1:
     in    AL,60h        ;� AL - ��� ����⮩ ������
     cmp   AL,1Dh        ;��᫨ ����� Ctrl - � ��
     je    SwLoop2       ;ٯ஢��� ���᪠���
     cmp   AL,9Dh        ;��᫨ �뫠 ���饭� Ctrl, �
     je    SwLoop1       ;٤���� �� ���� ����������
     mov   Sign,0        ;���� ����� ���-�� ����⨩
     jmp   short SwLoop1 ;� ᭮�� �� ���� ����������

   SwLoop2:
     in    AL,60h        ;� AL - ᪠� ��� ������
     cmp   AL,9Dh        ;��᫨ �� ��� ���᪠��� Ctrl, �
     jne   SwLoop2       ;ٮ������ ���᪠��� ������
     inc   Sign          ;㢥����� ���-�� ����⨩ �� Ctrl
     cmp   Sign,3        ;��᫨ �� �� ������ 3-� ࠧ�,�
     jne   SwLoop1       ;ٯ�३� �� ���� ����������

     mov   Sign,0        ;����� ���-�� ����⨩ �� Ctrl

     cmp   OK_Text,01h   ;��᫨ �࠭ �� �� �몫�祭,
     jne   Exit009       ;�� ��室

     call  VideoXcg      ;���� ������� �࠭

     mov   AH,01h        ;�
     mov   CX,CurSize    ;�����⠭����� �����
     int   10h           ;�

     mov   OK_Text,0h    ;����� �ਧ��� ��襭�� �࠭�

   Exit009:
     xor   AX,AX         ;�
     mov   ES,AX         ;������� 䫠�� ������
     mov   AL,ES:[417h]  ;�<Control+Alt> �� �����
     and   AL,11110011b  ;�0000h:0417h � 䫠��
     mov   ES:[417h],AL  ;�<LeftControl+LeftAlt>
     mov   AL,ES:[418h]  ;��� ����� 0000h:0418h
     and   AL,11111100b  ;�
     mov   ES:[418h],AL  ;�

     mov   AL,20h        ;����㦨�� ����஫���
     out   20h,AL        ;ٯ��뢠���

     cli                 ;������� ���뢠���
     pop   ES            ;�
     pop   DS            ;�
     pop   SI            ;�����⠭�����
     pop   DI            ;��ᯮ��㥬�
     pop   CX            ;�ॣ�����
     pop   BX            ;�
     pop   AX            ;�
     iret                ;��� �� ���뢠���

   Exit09:
     cli                 ;������� ���뢠���
     pop   ES            ;�
     pop   DS            ;�
     pop   SI            ;�����⠭�����
     pop   DI            ;��ᯮ��㥬�
     pop   CX            ;�ॣ�����
     pop   BX            ;�
     pop   AX            ;�
     jmp   CS:OldInt09   ;�;��।��� �ࠢ����� "�� 楯�窥"
                         ;�;᫥���饬� ��ࠡ��稪� Int09h
 Int09Hand endp

 ;
 ;���������� ���������� Int16h (����� ������� BIOS)

     dw    TestInt16     ;᫮�� ��� �����㦥��� ���墠�

 Presense proc
     cmp   AH,FuncNum    ;���饭�� �� ��襩 �ணࠬ��?
     jne   Pass          ;�᫨ ��� � ��祣� �� ������
     mov   AX,CodeOut    ;���� � AX �᫮������ ���
     iret                ;� ����������

   Pass:
     jmp   CS:OldInt16   ;��।��� �ࠢ����� "�� 楯�窥"
                         ;᫥���饬� ��ࠡ��稪� Int16h
 Presense endp


 ;�������� � � � � � � � � � � � � �   � � � � � � ���������

 ResEnd      db    ?    ;���� ��� ��।������ �࠭��� �-
                        ;�����⭮� ��� �ணࠬ��
 On          equ   1    ;���祭�� "��⠭�����" ���  䫠���
 Off         equ   0    ;���祭�� "��襭" ��� 䫠���
 Bell        equ   7    ;��� ᨬ���� BELL
 CR          equ   13   ;��� ᨬ���� CR
 LF          equ   10   ;��� ᨬ���� LF
 MinDosVer   equ   2    ;�������쭠� ��������� ����� DOS

 InstFlag    db    ?    ;䫠� ������ �ணࠬ�� � �����
 SaveCS      dw    ?    ;��࠭���� CS १����⭮� �ண-
                        ;ࠬ��

 Copyright   db CR,LF,' L O C K E R  ��������樮���� ��'
             db '�ࠬ��',CR,LF,LF,'$'
 VerDosMsg   db '�訡��: �����४⭠� ����� DOS'
             db Bell,CR,LF,'$'
 InstMsg     db '�ணࠬ�� LOCKER ��⠭������.��� ���� ��'
             db '������ ���� /u',CR,LF
             db '��� "����࠭��" ������ <Ctrl+Alt+L>',CR,LF
             db '��� "�⯨࠭��" �ਦ�� ������ <Ctrl>'
             db CR,LF,'$'
 AlreadyMsg  db '�訡��: LOCKER 㦥 १����⭠ � �����'
             db Bell,CR,LF,'$'
 UninstMsg   db '�ணࠬ�� LOCKER ��� � १�����'
             db CR,LF,'$'
 NotInstMsg  db '�訡��: �ணࠬ�� LOCKER �� ��⠭������'
             db Bell,CR,LF,'$'
 NotSafeMsg  db '�訡��: ���� � १����� �ணࠬ�� LOCKER'
             db ' � ����� ������',CR,LF,'���������� ��-�� '
             db '���墠� �������� ����஢',Bell,CR,LF,'$'


 ;������ � � � � � � � � � � � � �   � � � � � � � � � �����

 ;
 ;���������� ���� ��� ���������� ��������� ������ ����������

 Locker      equ   0      ;��� ��� �����䨪�樨 �p��p����
                          ;�� ����砥��� 䠩��
 include     INFO.INC     ;����砥�� 䠩� � ��楤�ன ��-
                          ;���� ���ଠ樨

 ;
 ;������� ��������� �������������

 InitProc proc
     mov   AH,09h          ;�
     lea   DX,Copyright    ;��뢥�� ��砫쭮� ᮮ�饭��
     int   21h             ;�

     lea   DX,VerDosMsg    ;��஢���� ����� DOS � ��-
     call  ChkDosVer       ;����� ᮮ�饭��,�᫨ �����-
     jc    Output          ;�室���

     call  PresentTest     ;�஢���� ����稥 � �����

     mov   BL,DS:[5Dh]     ;�
     and   BL,11011111b    ;�
     cmp   BL,'I'          ;�ࠧ����� ���� (��������
     je    Install         ;�� ������� FCB1 PSP)
     cmp   BL,'U'          ;�
     je    Uninst          ;�

     call  @InfoAbout      ;�뢥�� ���ଠ��
     jmp   short ToDos     ;� �������� � DOS
                           ;�᫨ ���� �� ��
   Install:
     lea   DX,AlreadyMsg
     cmp   InstFlag,On     ;��᫨ 㦥 ��⠭������,�
     je    Output          ;ٯ�३� �� �뢮� ᮮ�饭��

     xor   AX,AX           ;����� ������� ��砫�
     mov   ES,AX           ;������������ : �᫨ � ���� ��
     mov   AL,ES:[411h]    ;������ 0000h:0411h ��⠭�����
     and   AL,30h          ;�3-� ���,� ᥣ����� ���� ��-
     cmp   AL,30h          ;�砫� ����������� 0B000h ����
     jne   Vid1            ;�ᥣ����� ���� ࠢ�� 0B800h
     mov   VideoBeg,0B000h ;�

   Vid1:
     call  GrabIntVec      ;��墠��� �㦭� �����

     mov   AX,DS:[2Ch]     ;��᢮������ ���㦥���,�뤥���-
     mov   ES,AX           ;���� �ணࠬ�� ��� 㬥��襭��
     mov   AH,49h          ;����������� � १����� �����
     int   21h             ;�

     mov   AH,09h          ;��뢥�� ᮮ�饭�� �� ��⠭����
     lea   DX,InstMsg      ;�� १�����
     int   21h             ;�

     lea   DX,ResEnd       ;��������� � ��⠢��� �ணࠬ-
     int   27h             ;٬� � १�����

   Uninst:
     lea   DX,NotInstMsg   ;��᫨ �ணࠬ�� �� ��⠭������,
     cmp   InstFlag,Off    ;�� �뢥�� ᮮ�饭�� �� �⮬
     je    Output          ;�

     lea   DX,NotSafeMsg   ;��᫨ �ணࠬ�� ����������
     call  TestIntVec      ;����� � १�����,� �뢥��
     jc    Output          ;�ᮮ�饭�� �� �⮬

     call  FreeIntVec      ;�᢮������ ����� ���뢠���

     mov   AH,49h          ;��᢮������ ������,����������
     mov   ES,SaveCS       ;�१����⭮� ����� �ணࠬ��
     int   21h             ;�

     lea   DX,UninstMsg

   Output:
     mov   AH,09h          ;��뢥�� �㦭�� ᮮ�饭��
     int   21h             ;�

   ToDos:
     mov   AX,4C00h        ;��������� � DOS � �����
     int   21h             ;٧����襭�� 0
     ret                   ;������
 InitProc endp

 ;
 ;��������� �������� ������ DOS
 ;�����頥� ��⠭������� 䫠� ��७��,�᫨
 ;����� DOS ����� �������� � MinDosVer

 ChkDosVer proc
     mov   AH,30h         ;�������� � AX ����� ���ᨨ
     int   21h            ;�DOS
     cmp   AL,MinDosVer   ;�ࠢ���� �� � �������쭮�

     clc                  ;����� 䫠� ��७�� (CF)
     jge   Norma          ;�᫨ ����� ���室���
     stc                  ;���� ��⠭����� 䫠� ��७��

   Norma:
     ret                  ;������
 ChkDosVer endp

 ;
 ;��������� ����������� ������� ��������� � ������

 PresentTest proc
     mov   InstFlag,Off   ;����� 䫠� ������ � १�����
     mov   AH,FuncNum     ;��������� � ��襬� ������
     int   16h            ;�
     cmp   AX,CodeOut     ;����稫� �⢥�?
     jne   Return         ;�᫨ ���,� �����
     mov   InstFlag,On    ;���� ��⠭����� 䫠� ������
   Return:
     ret                  ;������
 PresentTest endp

 ;
 ;��������� ������� �������� ����������

 GrabIntVec proc
     mov   AX,3509h       ;���࠭��� �� ����७��� ���-
     int   21h            ;������� ���� ����� ���뢠-
     mov   OfsInt09,BX    ;���� Int09h
     mov   SegInt09,ES    ;�

     mov   AX,3516h       ;���࠭��� �� ����७��� ���-
     int   21h            ;������� ���� ����� ���뢠-
     mov   OfsInt16,BX    ;���� Int16h
     mov   SegInt16,ES    ;�

     mov   AX,2509h       ;���⠭����� Int09Hand � ����⢥
     lea   DX,Int09Hand   ;������� ��ࠡ��稪� ���뢠���
     int   21h            ;�Int09

     mov   AX,2516h       ;���⠭����� Presense � ����⢥
     lea   DX,Presense    ;������� ��ࠡ��稪� ���뢠���
     int   21h            ;�Int16h
     ret
 GrabIntVec endp

 ;
 ;��������� �������� ��������� �������� ����������
 ;�����頥� ��⠭������� 䫠� ��७�� � ��砥 ���墠�
 ;��� �� ������ ����� ���뢠���

 TestIntVec proc
     mov   AX,3509h            ;��஢����,��室���� �� ��-
     int   21h                 ;������ ᫮�� ��। ��ࠡ��-
     cmp   ES:[BX-2],TestInt09 ;�稪�� ���뢠��� Int09
     stc                       ;��⠭����� 䫠� ��७�� CF,
     jne   Cant                ;�᫨ ���뢠��� ���墠⨫�

     mov   AX,3516h            ;��஢����,��室���� �� ��-
     int   21h                 ;������ ᫮�� ��। ��ࠡ��-
     cmp   ES:[BX-2],TestInt16 ;�稪�� ���뢠��� Int16h
     stc                       ;��⠭����� 䫠� ��७�� CF,
     jne   Cant                ;�᫨ ���뢠��� ���墠⨫�

     mov   SaveCS,ES           ;��������� CS १����⭮�
     clc                       ;�ணࠬ��,����� 䫠�
                               ;��७��
   Cant:
     ret                       ;������
 TestIntVec endp

 ;
 ;��������� �������������� ����������� �������� ����������

 FreeIntVec proc
     push  DS             ;��࠭��� DS

     mov   AX,2509h       ;�����⠭����� ����� ���뢠���
     mov   DS,ES:SegInt09 ;�Int09h �� ����७��� ��६�����
     mov   DX,ES:OfsInt09 ;�१����⭮� �ணࠬ��
     int   21h            ;�

     mov   AX,2516h       ;�����⠭����� ����� ���뢠���
     mov   DS,ES:SegInt16 ;�Int16h �� ����७��� ��६�����
     mov   DX,ES:OfsInt16 ;�१����⭮� �ணࠬ��
     int   21h            ;�

     pop   DS             ;����⠭����� DS
     ret                  ;������
 FreeIntVec endp

 PROGRAM   ends
           end   Start
