
 ;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
 ;께                                                      께
 ;께         旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�          께
 ;께         � � � � � � � � � �   L O C K E R �          께
 ;께         읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�          께
 ;께                                                      께
 ;께 앪� 誓㎤ㄵ�狩좑 �昔｀젹쵟 COM 殊캙, "쭬�ⓣ좐�좑" 췅  께
 ;께 №�э  か젪쯄栒說. 뤲�｀젹쵟  ��誓罌졻猶젰�  ´も��  께
 ;께 �誓贍쥯�⑨ Int09 � 쭬�º젰� � 誓㎤ㄵ�收 5232 줎⒱.   께
 ;께                                                      께
 ;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께


 PROGRAM   segment
           assume CS:PROGRAM
           org   100h         ;�昔�信� PSP ㄻ� COM-�昔｀젹щ

 Start:    jmp   InitProc     ;��誓若� 췅 Þⓩ쯄エ쭬與�


 ;같같같같� � � � � � � � � � � �   � � � � � � 같같같같같같

 FuncNum   equ   0EEh           ;�α申α手莘�좑 押�ゆ⑨ �誓-
                                ;贍쥯�⑨ BIOS Int16h
 CodeOut   equ   2D0Ch          ;ぎ�,¡㎖�좈젰щ� 췅鼇� ��-
                                ;�젩�洵Ø�� Int16h
 TestInt09 equ   9D0Ah          ;笹�¡ ��誓� Int09h
 TestInt16 equ   3AFAh          ;笹�¡ ��誓� Int16h

 OldInt09  label dword          ;貰魚젺���硫 ´も�� Int09h:
  OfsInt09 dw    ?              ;   ⅲ� 細ι����
  SegInt09 dw    ?              ;   � 醒，���

 OldInt16  label dword          ;貰魚젺���硫 ´も�� Int16h:
  OfsInt16 dw    ?              ;   ⅲ� 細ι����
  SegInt16 dw    ?              ;   � 醒，���

 OK_Text   db    0              ;�黍㎛젶 짛蜈�⑨ 咨�젺�
 Sign      db    ?              ;ぎカ①α手� 췅쬊殊� Ctrl
 VideoLen  equ   800h           ;ㄻÞ� ˘ㄵ�▲芯��

 VideoBuf  db    160 dup(' ')
 db  13 dup(' ')
 db '�袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '�   꽞� �젳∥�え昔˚� 췅━ⓥ� 循� �젳� LeftControl   �'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '�                                                    �'
 db  26 dup(' ')
 db '훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠'
 db  2000 dup(' ')

 AttrBuf   db    VideoLen dup(07h)  ;졻黍▲瞬 咨�젺�
 VideoBeg  dw    0B800h         ;젮誓� 췅�젷� ˘ㄵ��∥졹殊
 VideoOffs dw    ?              ;細ι���� 젶殊˛�� 飡�젺ⓩ�
 CurSize   dw    ?              ;貰魚젺���硫 �젳Д� ゃ褻���

 ;같같같 � � � � � � � � � � �   � � � � � � � � � 같같같같�

 ;
 ;룑꼷릮깘�뙆� 럞똿�� 굠꼨럫걢�몤� � 걪봾릮� 룓럠��뙆�

 VideoXcg proc
     lea   DI,VideoBuf   ;� DI - 젮誓� ▲芯�� 歲Б�ギ�
     lea   SI,AttrBuf    ;� SI - 젮誓� ▲芯�� 졻黍▲獸�

     mov   AX,VideoBeg   ;엑 ES - 醒，��狩硫 젮誓�
     mov   ES,AX         ;螟좂젷� ˘ㄵ��∥졹殊

     mov   CX,VideoLen   ;� CX - ㄻÞ� ˘ㄵ�▲芯��
     mov   BX,VideoOffs  ;� BX - 췅�. 細ι���� 飡昔え

   Draw:
     mov   AX,ES:[BX]    ;엶＼��汀� 歲Б��/졻黍▲� 췅
     xchg  AH,DS:[SI]    ;논む젺� � 歲Б�ギ� � 졻黍▲-
     xchg  AL,DS:[DI]    ;년�� �� ▲芯昔�
     mov   ES:[BX],AX    ;�

     inc   SI            ;욍´エ葉筍 젮誓�
     inc   DI            ;冥 ▲芯�졾

     inc   BX            ;욍´エ葉筍 젮誓�
     inc   BX            ;冥 ˘ㄵ�▲芯誓

     loop  Draw          ;誠�쳽筍 ㄻ� ㏇ⅸ ˘ㄵ��∥졹殊
     ret                 ;¡㎖�졻
 VideoXcg endp

 ;
 ;럞��걥뮉닁 룓뀗썏�뜄� Int09h (룓뀗썏�뜄� 럲 뒎�굠�뮄맀)

     dw    TestInt09     ;笹�¡ ㄻ� �∼졷拾��⑨ ��誓罌졻�

 Int09Hand proc
     push  AX            ;�
     push  BX            ;�
     push  CX            ;녁�魚젺ⓥ�
     push  DI            ;낏召�レ㎯�щ�
     push  SI            ;녀ⅲⓤ循�
     push  DS            ;�
     push  ES            ;�

     push  CS            ;욍첓쭬筍 DS 췅
     pop   DS            ;螟좄� �昔｀젹с

     in    AL,60h        ;��ャ葉筍 稅젺 ぎ� 췅쬊獸� か젪②�

     cmp   AL,26h        ;엷昔´黍筍 췅 稅젺-ぎ� か젪②�
     jne   Exit_09       ;�<L> � �硫殊, αエ �� ��

     xor   AX,AX         ;�
     mov   ES,AX         ;날昔´黍筍 氏젫� か젪쯄栒贍 췅
     mov   AL,ES:[417h]  ;난젲졻�� <Ctrl+Alt>
     and   AL,0010b        ;�
     cmp   AL,0010b        ;�
     je    Cont          ;�

   Exit_09:
     jmp   Exit09        ;�音��

   Cont:


     sti                 ;�젳誓鼇筍 �誓贍쥯�⑨

     mov   AH,0Fh        ;엷�ャ葉筍 收ゃ蟯�
     int   10h           ;冥Ħ��誓┬�
     cmp   AL,2          ;�
     je    InText        ;날�誓⒱� 췅 InText
     cmp   AL,3          ;낄笹� 誓┬�
     je    InText        ;년ⅹ飡��硫 80#25
     cmp   AL,7          ;�
     je    InText        ;�

     jmp   short SwLoop1 ;Þ좂� - �昔�信殊筍

  InText:
     xor   AX,AX         ;욍飡젺�˘筍 醒，��狩硫
     mov   ES,AX         ;�젮誓� � 0000h

     mov   AX,ES:[44Eh]  ;엷�ャ葉筍 細ι���� 젶殊˛��
     mov   VideoOffs,AX  ;錨循젺ⓩ� � VideoOffs

     mov   AX,ES:[44Ch]  ;욉�젪�ⓥ� ㄻÞ� ˘ㄵ�▲芯��
     cmp   AX,1000h      ;녁 1000h.끷エ �� �젪��,
     jne   Exit009       ;년� 誓┬� EGA Lines
                         ;�(咨�젺 栒鼇筍 �� 췅ㄾ)
     mov   AH,03h        ;엥췅曄 貰魚젺ⓥ�
     int   10h           ;녀젳Д� ゃ褻���
     mov   CurSize,CX    ;冥 CurSize

     mov   AH,01h        ;�
     mov   CH,20h        ;낏 ��쩆˘筍 ⅲ�
     int   10h           ;�

     mov   OK_Text,01h   ;信�젺�˘筍 �黍㎛젶 짛蜈�⑨
                         ;咨�젺�
     call  VideoXcg      ;� �留쥯筍 �昔璵ㅳ說 짛蜈�⑨

   SwLoop1:
     in    AL,60h        ;� AL - ぎ� 췅쬊獸� か젪②�
     cmp   AL,1Dh        ;엠笹� 췅쬊�� Ctrl - 獸 췅
     je    SwLoop2       ;銘昔´夕� �琇信첓�⑨
     cmp   AL,9Dh        ;엠笹� 〓쳽 �琇申�췅 Ctrl, 獸
     je    SwLoop1       ;命젷麟� 췅 ��昔� か젪쯄栒贍
     mov   Sign,0        ;Þ좂� 聖昔歲筍 ぎ�-¡ 췅쬊殊�
     jmp   short SwLoop1 ;� 說�쥯 췅 ��昔� か젪쯄栒贍

   SwLoop2:
     in    AL,60h        ;� AL - 稅젺 ぎ� か젪②�
     cmp   AL,9Dh        ;엠笹� �� ぎ� �琇信첓�⑨ Ctrl, 獸
     jne   SwLoop2       ;酩┬쩆筍 �琇信첓�⑨ か젪②�
     inc   Sign          ;瑟�エ葉筍 ぎ�-¡ �～졻Ł 췅 Ctrl
     cmp   Sign,3        ;엠笹� ι� �� 췅쬊エ 3-� �젳�,獸
     jne   SwLoop1       ;銘�誓⒱� 췅 ��昔� か젪쯄栒贍

     mov   Sign,0        ;聖昔歲筍 ぎ�-¡ 췅쬊殊� 췅 Ctrl

     cmp   OK_Text,01h   ;엠笹� 咨�젺 �� 〓� �紐ヮ曄�,
     jne   Exit009       ;務� �音��

     call  VideoXcg      ;Þ좂� ˚ヮ葉筍 咨�젺

     mov   AH,01h        ;�
     mov   CX,CurSize    ;끼�遜�젺�˘筍 ゃ褻��
     int   10h           ;�

     mov   OK_Text,0h    ;聖昔歲筍 �黍㎛젶 짛蜈�⑨ 咨�젺�

   Exit009:
     xor   AX,AX         ;�
     mov   ES,AX         ;낟葉飡ⓥ� 氏젫� 췅쬊殊�
     mov   AL,ES:[417h]  ;�<Control+Alt> �� 젮誓率
     and   AL,11110011b  ;�0000h:0417h � 氏젫�
     mov   ES:[417h],AL  ;�<LeftControl+LeftAlt>
     mov   AL,ES:[418h]  ;날� 젮誓率 0000h:0418h
     and   AL,11111100b  ;�
     mov   ES:[418h],AL  ;�

     mov   AL,20h        ;엶■ャ┬筍 ぎ�循�カ��
     out   20h,AL        ;銘誓贍쥯�Ł

     cli                 ;쭬�誓殊筍 �誓贍쥯�⑨
     pop   ES            ;�
     pop   DS            ;�
     pop   SI            ;끼�遜�젺�˘筍
     pop   DI            ;낏召�レ㎯�щ�
     pop   CX            ;녀ⅲⓤ循�
     pop   BX            ;�
     pop   AX            ;�
     iret                ;�硫殊 �� �誓贍쥯�⑨

   Exit09:
     cli                 ;쭬�誓殊筍 �誓贍쥯�⑨
     pop   ES            ;�
     pop   DS            ;�
     pop   SI            ;끼�遜�젺�˘筍
     pop   DI            ;낏召�レ㎯�щ�
     pop   CX            ;녀ⅲⓤ循�
     pop   BX            ;�
     pop   AX            ;�
     jmp   CS:OldInt09   ;�;��誓쩆筍 承�젪ゥ��� "�� 璵��囹�"
                         ;�;笹ⅳ莘耀с �□젩�洵Ø� Int09h
 Int09Hand endp

 ;
 ;럞��걥뮉닁 룓뀗썏�뜄� Int16h (굠꼨� 뵑뜇뻽� BIOS)

     dw    TestInt16     ;笹�¡ ㄻ� �∼졷拾��⑨ ��誓罌졻�

 Presense proc
     cmp   AH,FuncNum    ;�□좈���� �� 췅蜈� �昔｀젹щ?
     jne   Pass          ;αエ �β 獸 �①ⅲ� �� ㄵ쳽筍
     mov   AX,CodeOut    ;Þ좂� � AX 信ギ˙���硫 ぎ�
     iret                ;� ¡㎖�졻ⓥ藺�

   Pass:
     jmp   CS:OldInt16   ;��誓쩆筍 承�젪ゥ��� "�� 璵��囹�"
                         ;笹ⅳ莘耀с �□젩�洵Ø� Int16h
 Presense endp


 ;같같같같 � � � � � � � � � � � � �   � � � � � � 같같같같�

 ResEnd      db    ?    ;줎⒱ ㄻ� ��誓ㄵゥ�⑨ ｀젺ⓩ� 誓-
                        ;㎤ㄵ�狩�� �졹殊 �昔｀젹щ
 On          equ   1    ;㎛좂���� "信�젺�˙��" ㄻ�  氏젫��
 Off         equ   0    ;㎛좂���� "聖昔蜈�" ㄻ� 氏젫��
 Bell        equ   7    ;ぎ� 歲Б�쳽 BELL
 CR          equ   13   ;ぎ� 歲Б�쳽 CR
 LF          equ   10   ;ぎ� 歲Б�쳽 LF
 MinDosVer   equ   2    ;Ж�º젷彛좑 ¡㎚�┃좑 ´褻⑨ DOS

 InstFlag    db    ?    ;氏젫 췅エ葉� �昔｀젹щ � 캙э殊
 SaveCS      dw    ?    ;貰魚젺���硫 CS 誓㎤ㄵ�狩�� �昔�-
                        ;�젹щ

 Copyright   db CR,LF,' L O C K E R  ㄵМ�飡�졿Ŧ�췅� �昔'
             db '｀젹쵟',CR,LF,LF,'$'
 VerDosMsg   db '롨Æ첓: �ⅹ�薛ⅹ狩좑 ´褻⑨ DOS'
             db Bell,CR,LF,'$'
 InstMsg     db '뤲�｀젹쵟 LOCKER 信�젺�˙�췅.꽞� 說汀⑨ ⓤ'
             db '��レ㎯⒱� か蹟 /u',CR,LF
             db '꽞� "쭬�ⓣ젺⑨" 췅━ⓥ� <Ctrl+Alt+L>',CR,LF
             db '꽞� "�琇ⓣ젺⑨" 循Ĳㅻ 췅━ⓥ� <Ctrl>'
             db CR,LF,'$'
 AlreadyMsg  db '롨Æ첓: LOCKER 拾� 誓㎤ㄵ�狩� � 캙э殊'
             db Bell,CR,LF,'$'
 UninstMsg   db '뤲�｀젹쵟 LOCKER 說汀� � 誓㎤ㄵ���'
             db CR,LF,'$'
 NotInstMsg  db '롨Æ첓: �昔｀젹쵟 LOCKER �� 信�젺�˙�췅'
             db Bell,CR,LF,'$'
 NotSafeMsg  db '롨Æ첓: 說汀� � 誓㎤ㄵ��� �昔｀젹с LOCKER'
             db ' � 쩆��硫 МД��',CR,LF,'�ⅱ�㎚�┃� ��-쭬 '
             db '��誓罌졻� �ⅹ�獸贍� ´も�昔�',Bell,CR,LF,'$'


 ;같같같 � � � � � � � � � � � � �   � � � � � � � � � 같같�

 ;
 ;굤떈��뀒썖 ��뎸 꼱� 궀룑땷뀓닟 룓럷뀈뱪� 궀굨�� 닄뵊릪�뻽�

 Locker      equ   0      ;º� ㄻ� Ħ��殊十첓與� 칛�즤젹щ
                          ;¡ ˚ヮ�젰М� �젵ゥ
 include     INFO.INC     ;˚ヮ�젰щ� �젵� � �昔璵ㅳ昔� ��-
                          ;¡쩆 Þ兒席졿Ŀ

 ;
 ;깑�굧�� 룓럷뀈뱪� 닄닑��땲��뻽�

 InitProc proc
     mov   AH,09h          ;�
     lea   DX,Copyright    ;끼猶α殊 췅�젷彛�� 貰�↓����
     int   21h             ;�

     lea   DX,VerDosMsg    ;엷昔´黍筍 ´褻⑧ DOS � ��-
     call  ChkDosVer       ;끼α殊 貰�↓����,αエ �����-
     jc    Output          ;懋�ㅿ�좑

     call  PresentTest     ;�昔´黍筍 췅エ葉� � 캙э殊

     mov   BL,DS:[5Dh]     ;�
     and   BL,11011111b    ;�
     cmp   BL,'I'          ;녀젳�□졻� か蹟 (쭬��歲恂�
     je    Install         ;끼 �∥졹筍 FCB1 PSP)
     cmp   BL,'U'          ;�
     je    Uninst          ;�

     call  @InfoAbout      ;�猶α殊 Þ兒席졿⑧
     jmp   short ToDos     ;� ´惜呻藺� � DOS
                           ;αエ か蹟 �� 獸�
   Install:
     lea   DX,AlreadyMsg
     cmp   InstFlag,On     ;엠笹� 拾� 信�젺�˙�췅,獸
     je    Output          ;銘�誓⒱� 췅 �猶�� 貰�↓��⑨

     xor   AX,AX           ;엥췅曄 ��ャ葉筍 췅�젷�
     mov   ES,AX           ;끼Ħ���∥졹殊 : αエ � 줎⒱� ��
     mov   AL,ES:[411h]    ;퀬ㅰα� 0000h:0411h 信�젺�˙��
     and   AL,30h          ;�3-� 〃�,獸 醒，��狩硫 젮誓� 췅-
     cmp   AL,30h          ;녕젷� ˘ㄵ��∥졹殊 0B000h Þ좂�
     jne   Vid1            ;녁ⅲД�狩硫 젮誓� �젪�� 0B800h
     mov   VideoBeg,0B000h ;�

   Vid1:
     call  GrabIntVec      ;쭬罌졻ⓥ� �拾�瑜 ´も���

     mov   AX,DS:[2Ch]     ;엶聲�‘ㄸ筍 �む拾����,�琉�ゥ�-
     mov   ES,AX           ;난�� �昔｀젹Д ㄻ� 僧��麟��⑨
     mov   AH,49h          ;낍젺º젰М� � 誓㎤ㄵ�收 캙э殊
     int   21h             ;�

     mov   AH,09h          ;엑猶α殊 貰�↓���� �� 信�젺�˚�
     lea   DX,InstMsg      ;끼 誓㎤ㄵ��
     int   21h             ;�

     lea   DX,ResEnd       ;엣젪�殲ⓥ� � �飡젪ⓥ� �昔｀젹-
     int   27h             ;蓂� � 誓㎤ㄵ�收

   Uninst:
     lea   DX,NotInstMsg   ;엠笹� �昔｀젹쵟 �� 信�젺�˙�췅,
     cmp   InstFlag,Off    ;년� �猶α殊 貰�↓���� �� 將��
     je    Output          ;�

     lea   DX,NotSafeMsg   ;엠笹� �昔｀젹с �ⅱ�㎚�┃�
     call  TestIntVec      ;녁�汀� � 誓㎤ㄵ���,獸 �猶α殊
     jc    Output          ;錨��↓���� �� 將��

     call  FreeIntVec      ;�聲�‘ㄸ筍 ´も��� �誓贍쥯�Ł

     mov   AH,49h          ;엶聲�‘ㄸ筍 캙э筍,쭬�º젰с�
     mov   ES,SaveCS       ;녀ⅶĦ��狩�� �졹筍� �昔｀젹щ
     int   21h             ;�

     lea   DX,UninstMsg

   Output:
     mov   AH,09h          ;엑猶α殊 �拾��� 貰�↓����
     int   21h             ;�

   ToDos:
     mov   AX,4C00h        ;엑�惜呻藺� � DOS � ぎㄾ�
     int   21h             ;椧젪�殲��⑨ 0
     ret                   ;¡㎖�졻
 InitProc endp

 ;
 ;룓럷뀈뱪� 룓럟뀗뒋 굝릲늿 DOS
 ;¡㎖�좈젰� 信�젺�˙���硫 氏젫 ��誓����,αエ
 ;´褻⑨ DOS Д�麟� 쭬쩆���� � MinDosVer

 ChkDosVer proc
     mov   AH,30h         ;엷�ャ葉筍 � AX ��Д� ´褻Ŀ
     int   21h            ;�DOS
     cmp   AL,MinDosVer   ;蓀젪�ⓥ� ⅴ � Ж�º젷彛��

     clc                  ;聖昔歲筍 氏젫 ��誓���� (CF)
     jge   Norma          ;αエ ´褻⑨ ��ㅵ�ㅿ�좑
     stc                  ;Þ좂� 信�젺�˘筍 氏젫 ��誓����

   Norma:
     ret                  ;¡㎖�졻
 ChkDosVer endp

 ;
 ;룓럷뀈뱪� 럮릣꼨땯뜄� ��땲뿀� 룓럠��뙆� � ��뙚뭹

 PresentTest proc
     mov   InstFlag,Off   ;聖昔歲筍 氏젫 췅エ葉� � 誓㎤ㄵ�收
     mov   AH,FuncNum     ;엶□졻ⓥ藺� � 췅蜈с �昔璵遜�
     int   16h            ;�
     cmp   AX,CodeOut     ;��ャ葉エ �手β?
     jne   Return         ;αエ �β,獸 ぎ�ζ
     mov   InstFlag,On    ;Þ좂� 信�젺�˘筍 氏젫 췅エ葉�
   Return:
     ret                  ;¡㎖�졻
 PresentTest endp

 ;
 ;룓럷뀈뱪� ��븖��� 굝뒕럯럟 룓뀗썏�뜄�

 GrabIntVec proc
     mov   AX,3509h       ;욉�魚젺ⓥ� ¡ ˛呻誓��ⓨ ��誓-
     int   21h            ;낚���音 飡졷硫 ´も�� �誓贍쥯-
     mov   OfsInt09,BX    ;난⑨ Int09h
     mov   SegInt09,ES    ;�

     mov   AX,3516h       ;욉�魚젺ⓥ� ¡ ˛呻誓��ⓨ ��誓-
     int   21h            ;낚���音 飡졷硫 ´も�� �誓贍쥯-
     mov   OfsInt16,BX    ;난⑨ Int16h
     mov   SegInt16,ES    ;�

     mov   AX,2509h       ;욍飡젺�˘筍 Int09Hand � 첓曄飡´
     lea   DX,Int09Hand   ;난�¡． �□젩�洵Ø� �誓贍쥯�⑨
     int   21h            ;�Int09

     mov   AX,2516h       ;욍飡젺�˘筍 Presense � 첓曄飡´
     lea   DX,Presense    ;난�¡． �□젩�洵Ø� �誓贍쥯�⑨
     int   21h            ;�Int16h
     ret
 GrabIntVec endp

 ;
 ;룓럷뀈뱪� 룓럟뀗뒋 룆릣븖��� 굝뒕럯럟 룓뀗썏�뜄�
 ;¡㎖�좈젰� 信�젺�˙���硫 氏젫 ��誓���� � 笹晨젰 ��誓罌졻�
 ;若舜 〓 �ㄽ�． ´も��� �誓贍쥯�⑨

 TestIntVec proc
     mov   AX,3509h            ;엷昔´黍筍,췅若ㄸ恂� エ ぎ-
     int   21h                 ;낀�¡� 笹�¡ ��誓� �□젩��-
     cmp   ES:[BX-2],TestInt09 ;拇Ø�� �誓贍쥯�⑨ Int09
     stc                       ;信�젺�˘筍 氏젫 ��誓���� CF,
     jne   Cant                ;αエ �誓贍쥯��� ��誓罌졻Œ�

     mov   AX,3516h            ;엷昔´黍筍,췅若ㄸ恂� エ ぎ-
     int   21h                 ;낀�¡� 笹�¡ ��誓� �□젩��-
     cmp   ES:[BX-2],TestInt16 ;拇Ø�� �誓贍쥯�⑨ Int16h
     stc                       ;信�젺�˘筍 氏젫 ��誓���� CF,
     jne   Cant                ;αエ �誓贍쥯��� ��誓罌졻Œ�

     mov   SaveCS,ES           ;쭬��Лⓥ� CS 誓㎤ㄵ�狩��
     clc                       ;�昔｀젹щ,聖昔歲筍 氏젫
                               ;��誓����
   Cant:
     ret                       ;¡㎖�졻
 TestIntVec endp

 ;
 ;룓럷뀈뱪� 굨몣��뜋굥뀓닟 ��븖�뾽뜊썢 굝뒕럯럟 룓뀗썏�뜄�

 FreeIntVec proc
     push  DS             ;貰魚젺ⓥ� DS

     mov   AX,2509h       ;엑�遜�젺�˘筍 ´も�� �誓贍쥯�⑨
     mov   DS,ES:SegInt09 ;쿔nt09h �� ˛呻誓��ⓨ ��誓Д��音
     mov   DX,ES:OfsInt09 ;녀ⅶĦ��狩�� �昔｀젹щ
     int   21h            ;�

     mov   AX,2516h       ;엑�遜�젺�˘筍 ´も�� �誓贍쥯�⑨
     mov   DS,ES:SegInt16 ;쿔nt16h �� ˛呻誓��ⓨ ��誓Д��音
     mov   DX,ES:OfsInt16 ;녀ⅶĦ��狩�� �昔｀젹щ
     int   21h            ;�

     pop   DS             ;¡遜�젺�˘筍 DS
     ret                  ;¡㎖�졻
 FreeIntVec endp

 PROGRAM   ends
           end   Start
