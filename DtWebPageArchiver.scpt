FasdUAS 1.101.10   ��   ��    k             l     ��  ��    T N =============================================================================     � 	 	 �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =   
  
 l     ��  ��    !  @file    DtWebPageArchiver     �   6   @ f i l e         D t W e b P a g e A r c h i v e r      l     ��  ��    E ? @brief   Snapshot a web page to DEVONthink and also archive it     �   ~   @ b r i e f       S n a p s h o t   a   w e b   p a g e   t o   D E V O N t h i n k   a n d   a l s o   a r c h i v e   i t      l     ��  ��    2 , @author  Michael Hucka <mhucka@caltech.edu>     �   X   @ a u t h o r     M i c h a e l   H u c k a   < m h u c k a @ c a l t e c h . e d u >      l     ��  ��    C = @license Please see the file LICENSE in the parent directory     �   z   @ l i c e n s e   P l e a s e   s e e   t h e   f i l e   L I C E N S E   i n   t h e   p a r e n t   d i r e c t o r y      l     ��   !��     : 4 @repo    https://github.com/mhucka/devonthink-hacks    ! � " " h   @ r e p o         h t t p s : / / g i t h u b . c o m / m h u c k a / d e v o n t h i n k - h a c k s   # $ # l     �� % &��   % T N =============================================================================    & � ' ' �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = $  ( ) ( l     ��������  ��  ��   )  * + * l     �� , -��   , &   Global variables and constants.    - � . . @   G l o b a l   v a r i a b l e s   a n d   c o n s t a n t s . +  / 0 / l     �� 1 2��   1 S M ............................................................................    2 � 3 3 �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 0  4 5 4 l     ��������  ��  ��   5  6 7 6 p       8 8 ������ "0 webarchiverpath webarchiverPath��   7  9 : 9 p       ; ; ������ "0 archiverootpath archiveRootPath��   :  < = < l     ��������  ��  ��   =  > ? > l     @���� @ r      A B A m      C C � D D 4 / o p t / l o c a l / b i n / w e b a r c h i v e r B o      ���� "0 webarchiverpath webarchiverPath��  ��   ?  E F E l    G���� G r     H I H e     J J I   �� K L
�� .earsffdralis        afdr K m    ��
�� afdrcusr L �� M��
�� 
rtyp M m    ��
�� 
TEXT��   I o      ���� 0 home  ��  ��   F  N O N l    P���� P r     Q R Q b     S T S n     U V U 1    ��
�� 
psxp V o    ���� 0 home   T m     W W � X X , r e s o u r c e s / w e b - a r c h i v e s R o      ���� "0 archiverootpath archiveRootPath��  ��   O  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _   Utility functions.    ` � a a &   U t i l i t y   f u n c t i o n s . ^  b c b l     �� d e��   d S M ............................................................................    e � f f �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . c  g h g l     ��������  ��  ��   h  i j i i      k l k I      �� m���� 0 quitifmissing quitIfMissing m  n o n o      ���� 0 thename theName o  p�� p o      ���� 0 theid theId��  ��   l Q     $ q r s q O     t u t e     v v n     w x w 1    ��
�� 
pnam x 5    �� y��
�� 
appf y o   	 
���� 0 theid theId
�� kfrmID   u m     z z�                                                                                  MACS  alis    f  clarity                    ԛn}H+     (
Finder.app                                                      �1�GЎ        ����  	                CoreServices    ԛ��      �HA       (   '   &  1clarity:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    c l a r i t y  &System/Library/CoreServices/Finder.app  / ��   r R      ������
�� .ascrerr ****      � ****��  ��   s k    $ { {  | } | I   !�� ~��
�� .sysodlogaskr        TEXT ~ b      �  b     � � � m     � � � � � 6 C o u l d   n o t   f i n d   a p p l i c a t i o n   � o    ���� 0 thename theName � m     � � � � �       q u i t t i n g .��   }  ��� � L   " $ � � m   " #���� ��   j  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 0 * From Nigel Garvey's CSV-to-list converter    � � � � T   F r o m   N i g e l   G a r v e y ' s   C S V - t o - l i s t   c o n v e r t e r �  � � � l     �� � ���   � > 8 http://macscripter.net/viewtopic.php?pid=125444#p125444    � � � � p   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? p i d = 1 2 5 4 4 4 # p 1 2 5 4 4 4 �  � � � i     � � � I      �� ����� 0 trim   �  ��� � o      ���� 0 txt  ��  ��   � k     j � �  � � � Y     , ��� � ��� � Z    ' � ��� � � l    ����� � C    � � � o    ���� 0 txt   � 1    ��
�� 
spac��  ��   � r    # � � � n    ! � � � 7   !�� � �
�� 
ctxt � m    ����  � m     ������ � o    ���� 0 txt   � o      ���� 0 txt  ��   �  S   & '�� 0 i   � m    ����  � \     � � � l   	 ����� � I   	�� ���
�� .corecnte****       **** � o    ���� 0 txt  ��  ��  ��   � m   	 
���� ��   �  � � � Y   - Y ��� � ��� � Z   = T � ��� � � l  = @ ����� � D   = @ � � � o   = >���� 0 txt   � 1   > ?��
�� 
spac��  ��   � r   C P � � � n   C N � � � 7  D N�� � �
�� 
ctxt � m   H J����  � m   K M������ � o   C D���� 0 txt   � o      ���� 0 txt  ��   �  S   S T�� 0 i   � m   0 1����  � \   1 8 � � � l  1 6 ����� � I  1 6�� ���
�� .corecnte****       **** � o   1 2���� 0 txt  ��  ��  ��   � m   6 7���� ��   �  � � � Z  Z g � ����� � l  Z ] ����� � =  Z ] � � � o   Z [���� 0 txt   � 1   [ \��
�� 
spac��  ��   � r   ` c � � � m   ` a � � � � �   � o      ���� 0 txt  ��  ��   �  ��� � L   h j � � o   h i���� 0 txt  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������  0 getwebpagedata getWebPageData��  �   � k     � � �  � � � O      � � � r     � � � n     � � � 4    �~ �
�~ 
cobj � m    �}�}  � l    ��|�{ � e     � � 6    � � � n    	 � � � 1    	�z
�z 
pnam � 2   �y
�y 
prcs � =  
  � � � 1    �x
�x 
pisf � m    �w
�w boovtrue�|  �{   � o      �v�v 0 frontapp frontApp � m      � ��                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   �u � ��u   � = 7 FIXME switch code based on which browser is being used    � � � � n   F I X M E   s w i t c h   c o d e   b a s e d   o n   w h i c h   b r o w s e r   i s   b e i n g   u s e d �  � � � l   �t � ��t   � d ^ see here for how: https://daringfireball.net/2009/01/applescripts_targetting_safari_or_webkit    � � � � �   s e e   h e r e   f o r   h o w :   h t t p s : / / d a r i n g f i r e b a l l . n e t / 2 0 0 9 / 0 1 / a p p l e s c r i p t s _ t a r g e t t i n g _ s a f a r i _ o r _ w e b k i t �  � � � Q    � � � � � Z    � � � � � � l     ��s�r � =        o    �q�q 0 frontapp frontApp m     �  S a f a r i�s  �r   � O   # N k   ' M  r   ' 2	
	 e   ' 0 n   ' 0 1   - /�p
�p 
pnam l  ' -�o�n n   ' - 1   + -�m
�m 
cTab l  ' +�l�k 4  ' +�j
�j 
cwin m   ) *�i�i �l  �k  �o  �n  
 o      �h�h 0 thetitle theTitle  r   3 > e   3 < n   3 < 1   9 ;�g
�g 
pURL l  3 9�f�e n   3 9 1   7 9�d
�d 
cTab l  3 7�c�b 4  3 7�a
�a 
cwin m   5 6�`�` �c  �b  �f  �e   o      �_�_ 0 theurl theURL �^ r   ? M !  I  ? K�]"#
�] .sfridojsnull���     ctxt" m   ? @$$ �%% 2 " " + w i n d o w . g e t S e l e c t i o n ( ) ;# �\&�[
�\ 
dcnm& n   A G'(' m   E G�Z
�Z 
docu( l  A E)�Y�X) 4  A E�W*
�W 
cwin* m   C D�V�V �Y  �X  �[  ! o      �U�U 0 selectedtext selectedText�^   m   # $++�                                                                                  sfri  alis    >  clarity                    ԛn}H+     G
Safari.app                                                     �@.Ӛ��        ����  	                Applications    ԛ��      ӛJ=       G   clarity:Applications: Safari.app   
 S a f a r i . a p p    c l a r i t y  Applications/Safari.app   / ��   � ,-, l  Q T.�T�S. =   Q T/0/ o   Q R�R�R 0 frontapp frontApp0 m   R S11 �22  G o o g l e   C h r o m e�T  �S  - 3�Q3 O   W �454 k   ] �66 787 r   ] j9:9 e   ] h;; n   ] h<=< 1   e g�P
�P 
pnam= l  ] e>�O�N> n   ] e?@? 1   a e�M
�M 
acTa@ l  ] aA�L�KA 4  ] a�JB
�J 
cwinB m   _ `�I�I �L  �K  �O  �N  : o      �H�H 0 thetitle theTitle8 CDC r   k zEFE e   k xGG n   k xHIH 1   s w�G
�G 
URL I l  k sJ�F�EJ n   k sKLK 1   o s�D
�D 
acTaL l  k oM�C�BM 4  k o�AN
�A 
cwinN m   m n�@�@ �C  �B  �F  �E  F o      �?�? 0 theurl theURLD O�>O r   { �PQP m   { ~RR �SS  Q o      �=�= 0 selectedtext selectedText�>  5 m   W ZTT�                                                                                  rimZ  alis    Z  clarity                    ԛn}H+     GGoogle Chrome.app                                               g�9ϗ�        ����  	                Applications    ԛ��      Ϙ	~       G  'clarity:Applications: Google Chrome.app   $  G o o g l e   C h r o m e . a p p    c l a r i t y  Applications/Google Chrome.app  / ��  �Q   � k   � �UU VWV I  � ��<X�;
�< .sysodlogaskr        TEXTX b   � �YZY b   � �[\[ m   � �]] �^^ 8 D o n ' t   k n o w   h o w   t o   w o r k   w i t h  \ o   � ��:�: 0 frontapp frontAppZ m   � �__ �``       q u i t t i n g .�;  W a�9a L   � �bb m   � ��8�8 �9   � R      �7�6�5
�7 .ascrerr ****      � ****�6  �5   � k   � �cc ded I  � ��4fg
�4 .sysodlogaskr        TEXTf b   � �hih b   � �jkj m   � �ll �mm 6 C o u l d   n o t   o b t a i n   i n f o   f r o m  k o   � ��3�3 0 frontapp frontAppi m   � �nn �oo  .g �2pq
�2 
btnsp J   � �rr s�1s m   � �tt �uu  O K�1  q �0v�/
�0 
dispv m   � ��.�. �/  e w�-w L   � �xx J   � �yy z{z m   � �|| �}}  { ~~ m   � ��� ���   ��,� m   � ��� ���  �,  �-   � ��+� L   � ��� J   � ��� ��� o   � ��*�* 0 theurl theURL� ��� o   � ��)�) 0 thetitle theTitle� ��(� o   � ��'�' 0 selectedtext selectedText�(  �+   � ��� l     �&�%�$�&  �%  �$  � ��� i    ��� I      �#�"�!�#  0 askdestination askDestination�"  �!  � k     ��� ��� O     ��� r    ��� 6   ��� n    
��� 1    
� 
�  
pnam� 4   ��
� 
pcap� m    �� � =   ��� 1    �
� 
pisf� m    �
� boovtrue� o      �� 0 	activeapp 	activeApp� m     ���                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��  � ��� r    ��� m    �� ���  � o      �� 0 thetags theTags� ��� r    ��� m    �
� boovfals� o      ��  0 saveexternally saveExternally� ��� O    q��� k   ' p�� ��� r   ' 3��� I  ' 1���
� .DTpacd39DTrc    ��� utxt� m   ' (�� ���  D e s t i n a t i o n� ���
� 
DTbt� J   ) -�� ��� m   ) *�� ���  C a n c e l� ��� m   * +�� ���  O K�  �  � o      �� $0 thedtdestination theDtDestination� ��� I  4 9���
� .miscactvnull��� ��� null�  �  � ��� r   : G��� I  : E���
� .DTpacd89utxt    ��� utxt� m   : ;�� ���  A d d   T a g s� ���
� 
info� m   > A�� ��� > T a g s   ( s e p a r a t e d   b y   s e m i c o l o n s ) :�  � o      �� 0 thetags theTags� ��� I  H Z���
� .sysodisAaleR        TEXT� m   H K�� ��� B S a v e   t o   e x t e r n a l   a r c h i v i n g   s i t e s ?� �
��	
�
 
btns� J   N V�� ��� m   N Q�� ���  N o� ��� m   Q T�� ���  Y e s�  �	  � ��� Z   [ p����� =   [ f��� n   [ b��� 1   ^ b�
� 
bhit� 1   [ ^�
� 
rslt� m   b e�� ���  Y e s� r   i l��� m   i j�
� boovtrue� o      ��  0 saveexternally saveExternally�  �  �  � 5    $� ���
�  
capp� m   ! "�� ��� @ c o m . d e v o n - t e c h n o l o g i e s . t h i n k p r o 2
�� kfrmID  � ��� O   r ��� I  y ~������
�� .miscactvnull��� ��� null��  ��  � 4   r v���
�� 
capp� o   t u���� 0 	activeapp 	activeApp� ���� L   � ��� J   � ��� ��� o   � ����� $0 thedtdestination theDtDestination� ��� o   � ����� 0 thetags theTags� ���� o   � �����  0 saveexternally saveExternally��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 basefilename baseFileName�  ��  o      ���� 0 thetitle theTitle��  ��  � k     T  r     ! l     ���� I     ������
�� .misccurdldt    ��� null��  ��  ��  ��   K    
 ��	
�� 
year o    ���� 0 y  	 ��

�� 
mnth
 o    ���� 0 m   ����
�� 
day  o    ���� 0 d  ��    r   " / I  " -����
�� .sysoexecTEXT���     TEXT b   " ) b   " ' m   " # � 
 e c h o   n   # & 1   $ &��
�� 
strq o   # $���� 0 thetitle theTitle m   ' ( � 6   |   s e d   ' s | [ ^ a - z A - Z 0 - 9   ] | | g '��   o      ���� 0 filename fileName  r   0 8 I   0 6�� ���� 0 trim    !��! o   1 2���� 0 filename fileName��  ��   o      ���� 0 filename fileName "#" r   9 ?$%$ n   9 =&'& 4   : =��(
�� 
cha ( m   ; <���� ' o   9 :���� 0 filename fileName% o      ���� 0 	firstchar 	firstChar# )��) L   @ T** b   @ S+,+ b   @ Q-.- b   @ M/0/ b   @ K121 b   @ G343 b   @ E565 o   @ A���� "0 archiverootpath archiveRootPath6 m   A D77 �88  /4 o   E F���� 0 	firstchar 	firstChar2 m   G J99 �::  /0 o   K L���� 0 y  . m   M P;; �<<  /, o   Q R���� 0 filename fileName��  � =>= l     ��������  ��  ��  > ?@? i    ABA I      ��C���� 0 createpdfindt createPDFinDtC DED o      ����  0 thedestination theDestinationE FGF o      ���� 0 theurl theURLG HIH o      ���� 0 thetitle theTitleI JKJ o      ���� 0 thetags theTagsK L��L o      ���� "0 destinationpath destinationPath��  ��  B k     �MM NON O     �PQP k    �RR STS r    UVU I   ��WX
�� .DTpacd78DTrc       utxtW o    	���� 0 theurl theURLX ��YZ
�� 
pwidY m   
 ���� Z ��[\
�� 
DTin[ o    ����  0 thedestination theDestination\ ��]��
�� 
DTpg] m    ��
�� boovfals��  V o      ���� 0 
thisrecord 
thisRecordT ^��^ Z    �_`����_ I   ��a��
�� .coredoexbool       obj a o    ���� 0 
thisrecord 
thisRecord��  ` O    �bcb k   " dd efe r   " %ghg o   " #���� 0 thetitle theTitleh o      ���� 	0 title  f iji r   & +klk o   & '���� "0 destinationpath destinationPathl 1   ' *��
�� 
DTcoj mnm r   , 5opo c   , 3qrq l  , 1s����s b   , 1tut m   , -vv �ww ( x - d e v o n t h i n k - i t e m : / /u n   - 0xyx 1   . 0��
�� 
UUIDy o   - .���� 0 
thisrecord 
thisRecord��  ��  r m   1 2��
�� 
TEXTp o      ���� 0 thisuuid thisUUIDn z��z Z   6 {|����{ >  6 9}~} o   6 7���� 0 thetags theTags~ m   7 8 ���  | k   < {�� ��� r   < ]��� J   < F�� ��� n  < A��� 1   = A��
�� 
txdl� 1   < =��
�� 
ascr� ���� m   A D�� ���  ;��  � J      �� ��� o      ���� 0 od  � ���� n     ��� 1   W [��
�� 
txdl� 1   V W��
�� 
ascr��  � ��� r   ^ e��� n   ^ c��� 2  _ c��
�� 
citm� o   ^ _���� 0 thetags theTags� o      ���� 0 taglist tagList� ��� r   f m��� o   f g���� 0 od  � n     ��� 1   h l��
�� 
txdl� 1   g h��
�� 
ascr� ���� r   n {��� b   n u��� o   n o���� 0 taglist tagList� J   o t�� ���� m   o r�� ���  a r c h i v e d - p a g e��  � 1   u z��
�� 
tags��  ��  ��  ��  c o    ���� 0 
thisrecord 
thisRecord��  ��  ��  Q 5     �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  O ���� L   � ��� J   � ��� ��� o   � ����� 0 
thisrecord 
thisRecord� ���� o   � ����� 0 thisuuid thisUUID��  ��  @ ��� l     ��������  ��  ��  � ��� i    ��� I      ������� ,0 createwebarchiveindt createWebArchiveInDt� ��� o      ����  0 thedestination theDestination� ��� o      ���� 0 theurl theURL� ���� o      ���� 0 thetitle theTitle��  ��  � O     ��� k    �� ��� r    ��� I   ����
�� .DTpacd77DTrc       utxt� o    	���� 0 theurl theURL� �����
�� 
DTin� o   
 ����  0 thedestination theDestination��  � o      �� 0 thisarchive thisArchive� ��~� L    �� o    �}�} 0 thisarchive thisArchive�~  � 5     �|��{
�| 
capp� m    �� ���  D N t p
�{ kfrmID  � ��� l     �z�y�x�z  �y  �x  � ��� i    ��� I      �w��v�w 40 movearchivetodestination moveArchiveToDestination� ��� o      �u�u 0 archiverecord archiveRecord� ��� o      �t�t "0 destinationpath destinationPath� ��� o      �s�s 0 theuuid theUUID� ��r� o      �q�q 0 theurl theURL�r  �v  � k     M�� ��� O     ��� r    ��� c    ��� n    ��� 1   	 �p
�p 
ppth� o    	�o�o 0 archiverecord archiveRecord� m    �n
�n 
psxf� o      �m�m 0 archivepath archivePath� 5     �l��k
�l 
capp� m    �� ���  D N t p
�k kfrmID  � ��� O    0��� k    /�� ��� l   �j���j  � C = I cannot for the life of me get the finder duplicate command   � ��� z   I   c a n n o t   f o r   t h e   l i f e   o f   m e   g e t   t h e   f i n d e r   d u p l i c a t e   c o m m a n d� ��� l   �i���i  � E ? to work; keeps giving me errors about paths. Using cp instead.   � ��� ~   t o   w o r k ;   k e e p s   g i v i n g   m e   e r r o r s   a b o u t   p a t h s .   U s i n g   c p   i n s t e a d .� ��� I   $�h��g
�h .sysoexecTEXT���     TEXT� b     ��� b    ��� b    � � b     m     �  c p   - a   ' l   �f�e n     1    �d
�d 
psxp o    �c�c 0 archivepath archivePath�f  �e    m     �		  '   '� o    �b�b "0 destinationpath destinationPath� m    

 �  '�g  � �a r   % / o   % &�`�` 0 theurl theURL n       1   , .�_
�_ 
comt l  & ,�^�] c   & , l  & *�\�[ 4   & *�Z
�Z 
psxf o   ( )�Y�Y "0 destinationpath destinationPath�\  �[   m   * +�X
�X 
alis�^  �]  �a  � m    �                                                                                  MACS  alis    f  clarity                    ԛn}H+     (
Finder.app                                                      �1�GЎ        ����  	                CoreServices    ԛ��      �HA       (   '   &  1clarity:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    c l a r i t y  &System/Library/CoreServices/Finder.app  / ��  � �W O   1 M I  9 L�V�U
�V .coremoveDTrc       null�U   �T
�T 
DTrc o   ; <�S�S 0 archiverecord archiveRecord �R�Q
�R 
DTto n   = F 1   B F�P
�P 
DTtg 1   = B�O
�O 
DTcu�Q   5   1 6�N �M
�N 
capp  m   3 4!! �""  D N t p
�M kfrmID  �W  � #$# l     �L�K�J�L  �K  �J  $ %&% i     #'(' I      �I)�H�I 0 sendtoia sendToIA) *�G* o      �F�F 0 theurl theURL�G  �H  ( I    	�E+�D
�E .sysoexecTEXT���     TEXT+ b     ,-, b     ./. m     00 �11 L c u r l   - s   ' h t t p s : / / w e b . a r c h i v e . o r g / s a v e // o    �C�C 0 theurl theURL- m    22 �33 ( '   >   / d e v / n u l l   2 > & 1   &�D  & 454 l     �B�A�@�B  �A  �@  5 676 i   $ '898 I      �?:�>�? &0 sendtowebcitation sendToWebcitation: ;�=; o      �<�< 0 theurl theURL�=  �>  9 I    	�;<�:
�; .sysoexecTEXT���     TEXT< b     =>= b     ?@? m     AA �BB ` c u r l   - s   ' h t t p : / / w w w . w e b c i t a t i o n . o r g / a r c h i v e ? u r l =@ o    �9�9 0 theurl theURL> m    CC �DD V & e m a i l = m h u c k a @ g m a i l . c o m '   >   / d e v / n u l l   2 > & 1   &�:  7 EFE l     �8�7�6�8  �7  �6  F GHG i   ( +IJI I      �5K�4�5 "0 sendtoarchiveis sendToArchiveISK L�3L o      �2�2 0 theurl theURL�3  �4  J I    	�1M�0
�1 .sysoexecTEXT���     TEXTM b     NON b     PQP m     RR �SS  c u r l   - d a t a   u r l =Q o    �/�/ 0 theurl theURLO m    TT �UU Z   h t t p : / / a r c h i v e . i s / s u b m i t /   >   / d e v / n u l l   2 > & 1   &�0  H VWV l     �.�-�,�.  �-  �,  W XYX l     �+Z[�+  Z   Main body.   [ �\\    M a i n   b o d y .Y ]^] l     �*_`�*  _ S M ............................................................................   ` �aa �   . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .^ bcb l     �)�(�'�)  �(  �'  c ded l   f�&�%f n   ghg I    �$i�#�$ 0 quitifmissing quitIfMissingi jkj m    ll �mm  D E V O N t h i n k   P r ok n�"n m    oo �pp @ c o m . d e v o n - t e c h n o l o g i e s . t h i n k p r o 2�"  �#  h  f    �&  �%  e qrq l   (s�!� s O   (tut I  " '���
� .ascrnoop****      � ****�  �  u m    vv�                                                                                  DNtp  alis    �  clarity                    ԛn}H+   aL�DEVONthink Pro.app                                             ش�օ��        ����  	                DEVONthink Pro    ԛ��      ֆ     aL�   G  8clarity:Applications: DEVONthink Pro: DEVONthink Pro.app  &  D E V O N t h i n k   P r o . a p p    c l a r i t y  .Applications/DEVONthink Pro/DEVONthink Pro.app  / ��  �!  �   r wxw l  ) <y��y O   ) <z{z r   - ;|}| m   - .�
� boovfals} n      ~~ 1   6 :�
� 
pvis 4   . 6��
� 
pcap� m   2 5�� ���  D E V O N t h i n k   P r o{ m   ) *���                                                                                  sevs  alis    �  clarity                    ԛn}H+     (System Events.app                                               ������        ����  	                CoreServices    ԛ��      ��#(       (   '   &  8clarity:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    c l a r i t y  -System/Library/CoreServices/System Events.app   / ��  �  �  x ��� l     ����  �  �  � ��� l  = d���� r   = d��� I      ����  0 askdestination askDestination�  �  � J      �� ��� o      ��  0 thedestination theDestination� ��� o      �� 0 thetags theTags� ��� o      �� &0 saveexternallytoo saveExternallyToo�  �  �  � ��� l  e ����
� r   e ���� n  e j��� I   f j�	���	  0 getwebpagedata getWebPageData�  �  �  f   e f� J      �� ��� o      �� 0 theurl theURL� ��� o      �� 0 thetitle theTitle� ��� o      �� 0 selectedtext selectedText�  �  �
  � ��� l     ��� �  �  �   � ��� l  � ������� r   � ���� b   � ���� I   � �������� 0 basefilename baseFileName� ���� o   � ����� 0 thetitle theTitle��  ��  � m   � ��� ���  . w e b a r c h i v e� o      ���� "0 destinationpath destinationPath��  ��  � ��� l  � ������� r   � ���� n  � ���� I   � �������� 0 createpdfindt createPDFinDt� ��� o   � �����  0 thedestination theDestination� ��� o   � ����� 0 theurl theURL� ��� o   � ����� 0 thetitle theTitle� ��� o   � ����� 0 thetags theTags� ���� o   � ����� "0 destinationpath destinationPath��  ��  �  f   � �� J      �� ��� o      ���� 0 dtrecord dtRecord� ���� o      ���� 0 theuuid theUUID��  ��  ��  � ��� l  � ������� r   � ���� n  � ���� I   � �������� ,0 createwebarchiveindt createWebArchiveInDt� ��� o   � �����  0 thedestination theDestination� ��� o   � ����� 0 theurl theURL� ���� o   � ����� 0 thetitle theTitle��  ��  �  f   � �� o      ���� 0 	dtarchive 	dtArchive��  ��  � ��� l  � ������� I   � �������� 40 movearchivetodestination moveArchiveToDestination� ��� o   � ����� 0 	dtarchive 	dtArchive� ��� o   � ����� "0 destinationpath destinationPath� ��� o   � ����� 0 theuuid theUUID� ���� o   � ����� 0 theurl theURL��  ��  ��  ��  � ��� l     ��������  ��  ��  � ���� l  ������� Z   �������� o   � ����� &0 saveexternallytoo saveExternallyToo� k   ��� ��� I   �������� 0 sendtoia sendToIA� ���� o   � ����� 0 theurl theURL��  ��  � ��� I  
������� "0 sendtoarchiveis sendToArchiveIS� ���� o  ���� 0 theurl theURL��  ��  � ���� I  ������� &0 sendtowebcitation sendToWebcitation� ���� o  ���� 0 theurl theURL��  ��  ��  ��  ��  ��  ��  ��       2��������������� C����������� ������������������������������������������������  � 0����������������������������������������������������������������������������������������~�}�|�{�� 0 quitifmissing quitIfMissing�� 0 trim  ��  0 getwebpagedata getWebPageData��  0 askdestination askDestination�� 0 basefilename baseFileName�� 0 createpdfindt createPDFinDt�� ,0 createwebarchiveindt createWebArchiveInDt�� 40 movearchivetodestination moveArchiveToDestination�� 0 sendtoia sendToIA�� &0 sendtowebcitation sendToWebcitation�� "0 sendtoarchiveis sendToArchiveIS
�� .aevtoappnull  �   � ****�� "0 webarchiverpath webarchiverPath�� 0 home  �� "0 archiverootpath archiveRootPath��  0 thedestination theDestination�� 0 thetags theTags�� &0 saveexternallytoo saveExternallyToo�� 0 theurl theURL�� 0 thetitle theTitle�� 0 selectedtext selectedText�� "0 destinationpath destinationPath�� 0 dtrecord dtRecord�� 0 theuuid theUUID�� 0 	dtarchive 	dtArchive��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �~  �}  �|  �{  � �z l�y�x�w�z 0 quitifmissing quitIfMissing�y �v�v   �u�t�u 0 thename theName�t 0 theid theId�x   �s�r�s 0 thename theName�r 0 theid theId 	 z�q�p�o�n�m � ��l
�q 
appf
�p kfrmID  
�o 
pnam�n  �m  
�l .sysodlogaskr        TEXT�w % � 
*��0�,EUW X  �%�%j Ok� �k ��j�i�h�k 0 trim  �j �g�g   �f�f 0 txt  �i   �e�d�e 0 txt  �d 0 i   �c�b�a�` �
�c .corecnte****       ****
�b 
spac
�a 
ctxt�`���h k +k�j  kkh �� �[�\[Zl\Zi2E�Y [OY��O +k�j  kkh �� �[�\[Zk\Z�2E�Y [OY��O��  �E�Y hO�� �_ ��^�]	�\�_  0 getwebpagedata getWebPageData�^  �]   �[�Z�Y�X�[ 0 frontapp frontApp�Z 0 thetitle theTitle�Y 0 theurl theURL�X 0 selectedtext selectedText	 " ��W�V
�U�T+�S�R�Q$�P�O�N1T�M�LR]_�K�J�Iln�Ht�G�F|��
�W 
prcs
�V 
pnam
  
�U 
pisf
�T 
cobj
�S 
cwin
�R 
cTab
�Q 
pURL
�P 
dcnm
�O 
docu
�N .sfridojsnull���     ctxt
�M 
acTa
�L 
URL 
�K .sysodlogaskr        TEXT�J  �I  
�H 
btns
�G 
disp�F �\ �� *�-�,�[�,\Ze81E�k/E�UO |��  0� (*�k/�,�,EE�O*�k/�,�,EE�O��*�k/�,l E�UY E��  /a  %*�k/a ,�,EE�O*�k/a ,a ,EE�Oa E�UY a �%a %j OkW /X  a �%a %a a kva la  Oa a  a !mvO���mv� �E��D�C�B�E  0 askdestination askDestination�D  �C   �A�@�?�>�A 0 	activeapp 	activeApp�@ 0 thetags theTags�?  0 saveexternally saveExternally�> $0 thedtdestination theDtDestination ��=�<
�;��:��9��8���7�6��5��4��3���2�1�0�
�= 
pcap
�< 
pnam
�; 
pisf
�: 
capp
�9 kfrmID  
�8 
DTbt
�7 .DTpacd39DTrc    ��� utxt
�6 .miscactvnull��� ��� null
�5 
info
�4 .DTpacd89utxt    ��� utxt
�3 
btns
�2 .sysodisAaleR        TEXT
�1 
rslt
�0 
bhit�B �� *�k/�,�[�,\Ze81E�UO�E�OfE�O)���0 K����lvl E�O*j O�a a l E�Oa a a a lvl O_ a ,a   eE�Y hUO*�/ *j UO���mv� �/��.�-�,�/ 0 basefilename baseFileName�. �+�+   �*�* 0 thetitle theTitle�-   �)�(�'�&�%�$�) 0 thetitle theTitle�( 0 y  �' 0 m  �& 0 d  �% 0 filename fileName�$ 0 	firstchar 	firstChar �#�"�!� ����������79;
�# 
Krtn
�" 
year�! 0 y  
�  
mnth� 0 m  
� 
day � 0 d  � 
� .misccurdldt    ��� null
� 
strq
� .sysoexecTEXT���     TEXT� 0 trim  
� 
cha � "0 archiverootpath archiveRootPath�, U*��������l E[�,E�Z[�,E�Z[�,E�ZO��,%�%j E�O*�k+ E�O��k/E�O�a %�%a %�%a %�%� �B���� 0 createpdfindt createPDFinDt� ��   ������  0 thedestination theDestination� 0 theurl theURL� 0 thetitle theTitle� 0 thetags theTags� "0 destinationpath destinationPath�   
��
�	��������  0 thedestination theDestination�
 0 theurl theURL�	 0 thetitle theTitle� 0 thetags theTags� "0 destinationpath destinationPath� 0 
thisrecord 
thisRecord� 	0 title  � 0 thisuuid thisUUID� 0 od  � 0 taglist tagList ��� ����������������v����������������
� 
capp
�  kfrmID  
�� 
pwid�� 
�� 
DTin
�� 
DTpg�� 
�� .DTpacd78DTrc       utxt
�� .coredoexbool       obj 
�� 
DTco
�� 
UUID
�� 
TEXT
�� 
ascr
�� 
txdl
�� 
cobj
�� 
citm
�� 
tags� �)���0 ~�����f� E�O�j 	 g� _�E�O�*�,FO��,%�&E�O�� D�a ,a lvE[a k/E�Z[a l/�a ,FZO�a -E�O��a ,FO�a kv%*a ,FY hUY hUO��lv� ����������� ,0 createwebarchiveindt createWebArchiveInDt�� ����   ��������  0 thedestination theDestination�� 0 theurl theURL�� 0 thetitle theTitle��   ����������  0 thedestination theDestination�� 0 theurl theURL�� 0 thetitle theTitle�� 0 thisarchive thisArchive ���������
�� 
capp
�� kfrmID  
�� 
DTin
�� .DTpacd77DTrc       utxt�� )���0 ��l E�O�U� ����������� 40 movearchivetodestination moveArchiveToDestination�� ����   ���������� 0 archiverecord archiveRecord�� "0 destinationpath destinationPath�� 0 theuuid theUUID�� 0 theurl theURL��   ������������ 0 archiverecord archiveRecord�� "0 destinationpath destinationPath�� 0 theuuid theUUID�� 0 theurl theURL�� 0 archivepath archivePath �����������
������!������������
�� 
capp
�� kfrmID  
�� 
ppth
�� 
psxf
�� 
psxp
�� .sysoexecTEXT���     TEXT
�� 
alis
�� 
comt
�� 
DTrc
�� 
DTto
�� 
DTcu
�� 
DTtg�� 
�� .coremoveDTrc       null�� N)���0 	��,�&E�UO� ��,%�%�%�%j 
O�*�/�&�,FUO)���0 *��*a ,a ,a  U� ��(�������� 0 sendtoia sendToIA�� ����   ���� 0 theurl theURL��   ���� 0 theurl theURL 02��
�� .sysoexecTEXT���     TEXT�� 
�%�%j � ��9�������� &0 sendtowebcitation sendToWebcitation�� ����   ���� 0 theurl theURL��   ���� 0 theurl theURL AC��
�� .sysoexecTEXT���     TEXT�� 
�%�%j � ��J���� ���� "0 sendtoarchiveis sendToArchiveIS�� ��!�� !  ���� 0 theurl theURL��   ���� 0 theurl theURL  RT��
�� .sysoexecTEXT���     TEXT�� 
�%�%j � ��"����#$��
�� .aevtoappnull  �   � ****" k    %%  >&&  E''  N(( d)) q** w++ �,, �-- �.. �// �00 �11 �����  ��  ��  #  $ * C�������������� W��lo��v������������������������������������������������������� "0 webarchiverpath webarchiverPath
�� afdrcusr
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr�� 0 home  
�� 
psxp�� "0 archiverootpath archiveRootPath�� 0 quitifmissing quitIfMissing
�� .ascrnoop****      � ****
�� 
pcap
�� 
pvis��  0 askdestination askDestination
�� 
cobj��  0 thedestination theDestination�� 0 thetags theTags�� &0 saveexternallytoo saveExternallyToo��  0 getwebpagedata getWebPageData�� 0 theurl theURL�� 0 thetitle theTitle�� 0 selectedtext selectedText�� 0 basefilename baseFileName�� "0 destinationpath destinationPath�� �� 0 createpdfindt createPDFinDt�� 0 dtrecord dtRecord�� 0 theuuid theUUID�� ,0 createwebarchiveindt createWebArchiveInDt�� 0 	dtarchive 	dtArchive�� �� 40 movearchivetodestination moveArchiveToDestination�� 0 sendtoia sendToIA�� "0 sendtoarchiveis sendToArchiveIS�� &0 sendtowebcitation sendToWebcitation���E�O���l E�O��,�%E�O)��l+ O� *j UO� f*a a /a ,FUO*j+ E[a k/E` Z[a l/E` Z[a m/E` ZO)j+ E[a k/E` Z[a l/E` Z[a m/E` ZO*_ k+ a %E` O)_ _ _ _ _ a +  E[a k/E` !Z[a l/E` "ZO)_ _ _ m+ #E` $O*_ $_ _ "_ a %+ &O_  *_ k+ 'O*_ k+ (O*_ k+ )Y h� �22 * c l a r i t y : U s e r s : m h u c k a :� �33 H / U s e r s / m h u c k a / r e s o u r c e s / w e b - a r c h i v e s� 44 5������5 6������6�                                                                                  DNtp  alis    �  clarity                    ԛn}H+   aL�DEVONthink Pro.app                                             ش�օ��        ����  	                DEVONthink Pro    ԛ��      ֆ     aL�   G  8clarity:Applications: DEVONthink Pro: DEVONthink Pro.app  &  D E V O N t h i n k   P r o . a p p    c l a r i t y  .Applications/DEVONthink Pro/DEVONthink Pro.app  / ��  
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr�� 	
�� kfrmID  � �77  p r e s e r v a t i o n
�� boovfals� �88 � h t t p s : / / n e t p r e s e r v e b l o g . w o r d p r e s s . c o m / 2 0 1 8 / 0 3 / 0 1 / i i p c - t e c h n i c a l - s p e a k e r - s e r i e s /� �99 | A n n o u n c i n g   t h e   I I P C   T e c h n i c a l   S p e a k e r   S e r i e s   |   N e t p r e s e r v e b l o g� �::  � �;; � / U s e r s / m h u c k a / r e s o u r c e s / w e b - a r c h i v e s / A / 2 0 1 8 / A n n o u n c i n g   t h e   I I P C   T e c h n i c a l   S p e a k e r   S e r i e s     N e t p r e s e r v e b l o g . w e b a r c h i v e� << =��~�}= 6�|�{�z
�| 
DTkb�{ 
�z kfrmID  
� 
DTcn�~  -b
�} kfrmID    �>> p x - d e v o n t h i n k - i t e m : / / C 9 4 8 5 E 2 B - 1 A A 6 - 4 1 F 6 - 8 3 8 C - D 0 2 0 1 7 C 3 3 6 8 7 ?? @�y�x�w@ 6�v�u�t
�v 
DTkb�u 
�t kfrmID  
�y 
DTcn�x  -d
�w kfrmID  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ascr  ��ޭ