
 @TopRow     equ   1
 @LeftCol    equ   3
 @BotRow     equ   22
 @RightCol   equ   76
 @MsgAddres  dw    ?
 @VGAFlag    db    1
 @ScrBufSeg  dw    0B800h
 @PageOfs    dw    ?
 @SaveRegime db    ?
 @Attr1      db    74*8 dup(1Ch),74*2 dup(0)
 @Attr2      db    74*13 dup(1Eh)
 @PelRegMas  db    300h dup(?)

 ifdef       Color
 @ColorInfo  db    ' ����������������������������������������������������������������������Ŀ '
             db    ' �                                                                      � '
             db    ' �                   �����  �����  �     �����  �����                   � '
             db    ' �                   �      �   �  �     �   �  �   �                   � '
             db    ' �                   �      �   �  �     �   �  ����                    � '
             db    ' �                   �����  �����  ����� �����  �  ��                   � '
             db    ' �                                                                      � '
             db    ' ������������������������������������������������������������������������ '
             db    '                                                                          '
             db    '                                                                          '
             db    ' ����������������������������������������������������������������������ͻ '
             db    ' �  COLOR - �� ��������樮����  �ணࠬ�� �� �ᯮ�짮����� ��⥬���  � '
             db    ' �  �।�� MS DOS � BIOS  ��� IBM-ᮢ���⨬��  �������஢. COLOR ��-  � '
             db    ' �  ������ �������� ���� 16 梥⮢�� ॣ���஢ �������� ����� ���-  � '
             db    ' �  ����, �������� � ᨭ��� 梥⮢. ��ࠢ����� �����⢫���� ������-  � '
             db    ' �  ��:                                                                 � '
             db    ' �     7,8,9         - 㢥��祭�� ����� ��᭮��, �������� � ᨭ���;    � '
             db    ' �     4,5,6         - 㬥��襭�� ����� ��᭮��, �������� � ᨭ���;    � '
             db    ' �     gray+ � gray- - ᬥ�� �����塞��� 梥⮢��� ॣ����;            � '
             db    ' �     Enter         - �����襭�� �ணࠬ�� � ��࠭����� ���������;    � '
             db    ' �     Esc           - �����襭�� �ணࠬ�� � ����⠭�������� �������.  � '
             db    ' ����������������������������������������������������������������������ͼ '
 endif

 ifdef       Defend
 @DefendInfo db    ' ����������������������������������������������������������������������Ŀ '
             db    ' �                                                                      � '
             db    ' �               �����  �����  �����  �����  �    �  �����              � '
             db    ' �               �   �  ����   ����   ����   ���  �  �   �              � '
             db    ' �               �   �  �      �      �      �  ���  �   �              � '
             db    ' �               �����  �����  �      �����  �    �  �����              � '
             db    ' �                                                                      � '
             db    ' ������������������������������������������������������������������������ '
             db    '                                                                          '
             db    '                                                                          '
             db    ' ����������������������������������������������������������������������ͻ '
             db    ' �  DEFEND - �� ��������樮���� �ணࠬ�� �� �ᯮ�짮����� ��⥬���  � '
             db    ' �  �।�� MS DOS � BIOS  ��� IBM-ᮢ���⨬�� �������஢. DEFEND ��-  � '
             db    ' �  �頥� COM-䠩�� �� ����஢���� ��⮤�� �ਢ離� � ����� �� ��᪥.  � '
             db    ' �  ��᫥  ����஢���� ���饭���  �ணࠬ�� �뢥��� ᮮ�饭�� � �⪠-  � '
             db    ' �  ����� ࠡ����. � �ணࠬ�� �� �।�ᬮ�७� ���⨥ ��堭���� ��-  � '
             db    ' �  ��� �� �⫠�稪�� � �����ᥬ���஢, �� ������ ����� �ࠪ��᪨  � '
             db    ' �  �����᫥����, �� ��⠢��� �� ���室�饩 ��� �ਬ��. �� ����᪥  � '
             db    ' �  ����室��� �१  �஡��  㪠���� ��� ���頥���� 䠩��, ����� �  � '
             db    ' �  ��᫥��⢨� �⠭�� ���饭��, ��᪮�쪮  㤫��������. ������⢨�  � '
             db    ' �  ����� 䠩�� � ��������� ��ப� �맮��� ������ ������ ���ଠ樨. � '
             db    ' ����������������������������������������������������������������������ͼ '
 endif

 ifdef       Locker
 @LockerInfo db    ' ����������������������������������������������������������������������Ŀ '
             db    ' �                                                                      � '
             db    ' �               �      �����  �����  �  ��   �����  �����              � '
             db    ' �               �      �   �  �      ���     ����   �   �              � '
             db    ' �               �      �   �  �      � ��    �      ����               � '
             db    ' �               �����  �����  �����  �   ��  �����  �  ��              � '
             db    ' �                                                                      � '
             db    ' ������������������������������������������������������������������������ '
             db    '                                                                          '
             db    '                                                                          '
             db    ' ����������������������������������������������������������������������ͻ '
             db    ' � LOCKER is a demo program for using MS DOS and BIOS system tools for  � '
             db    ' � IBM-compatible computers. LOCKER allows you to "lock" the keyboard   � '
             db    ' � for the duration of your existence, if you want to hide something    � '
             db    ' � from prying eyes or unwanted influences.                             � '
             db    ' � When enabled, keys are allowed:                                      � '
             db    ' �     /i - install the program in the resident;                        � '
             db    ' �     /u - remove the program from the resident.                       � '
             db    ' � The keyboard is "locked" by applications <Cntrl+Alt+L> , and         � '
             db    ' � "unlocked" by three applications on <Cntrl> (knock-knock-knock).     � '
             db    ' � Any other key, or lack thereof, will cause this information to appear� '
             db    ' ����������������������������������������������������������������������ͼ '
 endif

 ifdef       Floppy
 @FloppyInfo db    ' ����������������������������������������������������������������������Ŀ '
             db    ' �                                                                      � '
             db    ' �               �����  �      �����  �����  �����  �   �               � '
             db    ' �               ����   �      �   �  �   �  �   �  �� ��               � '
             db    ' �               �      �      �   �  ����   ����     �                 � '
             db    ' �               �      �����  �����  �      �        �                 � '
             db    ' �                                                                      � '
             db    ' ������������������������������������������������������������������������ '
             db    '                                                                          '
             db    '                                                                          '
             db    ' ����������������������������������������������������������������������ͻ '
             db    ' �  FLOPPY - �� ��������樮���� �ணࠬ�� �� �ᯮ�짮����� ��⥬���  � '
             db    ' �  �।�� MS DOS � BIOS  ��� IBM-ᮢ���⨬�� �������஢. FLOPPY ��-  � '
             db    ' �  ⠭�������� ����� ����� ��� �⥭��/����� �� floppy-��᪮����.    � '
             db    ' �  �� ����᪥ �ᯮ������� ᫥���騥 ����:                           � '
             db    ' �     /w - ���� �� ����� � ��⠭���� � p�������;                    � '
             db    ' �     /r - ���� �� �⥭��/����� � ��⠭���� � p�������;             � '
             db    ' �     /n - ��⨥ ����� � ��⠭���� � p�������;                       � '
             db    ' �     /u - ���� �ணࠬ�� � १�����.                                � '
             db    ' �  ��⠭���� � १����� ⮫쪮 �� ��ࢮ� ����᪥. �� ��㣮� ����   � '
             db    ' �  ��� ��� ������⢨� �맮��� ������ ������ ���ଠ樨.             � '
             db    ' ����������������������������������������������������������������������ͼ '
 endif

 ifdef       Elisa
 @ElisaInfo  db    ' ����������������������������������������������������������������������Ŀ '
             db    ' �                                                                      � '
             db    ' �                 �����  �      �����  �����   ���                     � '
             db    ' �                 ����   �        �    ���    �   �                    � '
             db    ' �                 �      �        �       ��  �����                    � '
             db    ' �                 �����  �����  �����  �����  �   �                    � '
             db    ' �                                                                      � '
             db    ' ������������������������������������������������������������������������ '
             db    '                                                                          '
             db    '                                                                          '
             db    ' ����������������������������������������������������������������������ͻ '
             db    ' �  ELISA - �� ��������樮���� �ணࠬ�� �� �ᯮ�짮����� ��⥬���   � '
             db    ' �  �।�� MS DOS � BIOS ��� IBM-ᮢ���⨬�� �������஢. ELISA ���-   � '
             db    ' �  �ந������ �������, ���� �� ����� �� �ந�����⥫쭮���  ������-   � '
             db    ' �  ��. �� ����᪥ �ᯮ������� ᫥���騥 ����:                     � '
             db    ' �     /i - ��⠭����� �ணࠬ�� � १����� (install);                  � '
             db    ' �     /u - ���� �ணࠬ�� � १����� (uninstall).                    � '
             db    ' �  �� ��㣮� ���� ��� ��� ������⢨� �맮��� ������ ������ ��-   � '
             db    ' �  �ଠ樨.                                                           � '
             db    ' �                                                                      � '
             db    ' �                                                                      � '
             db    ' ����������������������������������������������������������������������ͼ '
 endif

 @WriteInfo  proc
             push  ES

             ifdef Floppy
              lea   BP,@FloppyInfo
             endif

             ifdef Elisa             
              lea   BP,@ElisaInfo
             endif
             
             ifdef Locker
              lea   BP,@LockerInfo
             endif   

             ifdef Color
              lea   BP,@ColorInfo
             endif

             ifdef Defend
              lea   BP,@DefendInfo
             endif

             lea   SI,@Attr1
             mov   AX,@ScrBufSeg
             mov   ES,AX
             mov   DH,@TopRow
             mov   AL,160
             mul   DH
             mov   DI,AX
    @L1Draw: mov   DL,@LeftCol
             xor   BH,BH
             mov   BL,DL
             shl   BX,1
             add   BX,@PageOfs
    @L2Draw: mov   AH,DS:[SI]
             inc   SI
             mov   AL,DS:[BP]
             inc   BP
             mov   ES:[BX+DI],AX
             inc   BX
             inc   BX
             inc   DL
             cmp   DL,@RightCol
             jbe   @L2Draw
             add   DI,160
             inc   DH
             cmp   DH,@BotRow
             jbe   @L1Draw
             pop   ES
             ret
 @WriteInfo  endp
 
 @TestVideo  proc
             mov   AH,0Fh
             int   10h
             mov   @SaveRegime,AL
             cmp   AL,07h
             mov   AL,02h
             jne   @NotMDA

             mov   @ScrBufSeg,0B000h
             mov   AL,70h
             mov   CX,74*8
             lea   DI,@Attr1
             rep   stosb
             mov   AL,07h
             mov   CX,74*13
             lea   DI,@Attr2
             rep   stosb

   @NotMDA:  xor   AH,AH
             int   10h
             mov   CH,20h
             mov   AH,1
             int   10h

             push  ES
             xor   AX,AX
             mov   ES,AX
             mov   AX,ES:[44Eh]
             mov   @PageOfs,AX
             pop   ES
             
             mov   AX,1A00h
             int   10h
             cmp   AL,1Ah
             je    @EndTst
             dec   @VGAFlag

   @EndTst:  ret
 @TestVideo  endp

 @ReadPelReg proc
             mov   DX,3C7h
             xor   AL,AL
             cli
             out   DX,AL

             mov   CX,300h
             mov   DX,3C9h

   @NextPelR:in    AL,DX
             and   AL,3Fh
             stosb
             loop  @NextPelR

             sti
             ret
 @ReadPelReg endp

 @WritePelReg proc
             mov   DX,3C8h
             xor   AL,AL
             cli
             out   DX,AL

    @Vert:   mov   DX,3DAh
             in    AL,DX            
             and   AL,08h
             jz    @Vert

             mov   CX,300h
             mov   DX,3C9h

   @NextPelW:lodsb
             or    AL,AL
             jz    @OutPel
             add   AL,AH
             cmp   AL,0
             jg    @MaxPel
             mov   AL,0
             jmp   short @OutPel

   @MaxPel:  cmp   AL,3Fh
             jbe   @OutPel
             mov   AL,3Fh

   @OutPel:  out   DX,AL
             loop  @NextPelW

             sti
             ret
 @WritePelReg endp

 @BeepSound  proc
             mov     CX,90
             mov     DX,600
             mov     BX,600

             in      AL,61h
             and     AL,0FEh

    @L1Beep: push    CX
             or      AL,02h
             out     61h,AL

             mov     CX,DX
    @L2Beep: loop    @L2Beep
             sub     DX,5

             and     AL,0FDh
             out     61h,AL

             mov     CX,BX
    @L3Beep: loop    @L3Beep
             add     BX,5

             pop     CX
             loop    @L1Beep

             ret
 @BeepSound  endp

 @InfoAbout  proc
             cld
             mov   @MsgAddres,DX
             call  @TestVideo
             cmp   @VGAFlag,1
             jne   @NotVGA

             lea   DI,@PelRegMas
             call  @ReadPelReg
             mov   AH,-60
             lea   SI,@PelRegMas
             call  @WritePelReg

    @NotVGA: call  @WriteInfo
             cmp   @VGAFlag,1
             jne   @Key

             mov   AH,-60

    @Next:   inc   AH
             lea   SI,@PelRegMas
             call  @WritePelReg

             mov   CX,25000
    @Pausa:  loop  @Pausa

             cmp   AH,0
             jne   @Next

    @Key:    call  @BeepSound
             mov   AH,08h
             int   21h

             xor   AH,AH
             mov   AL,@SaveRegime
             int   10h
             ret 
 @InfoAbout  endp