; NSIS script NSIS-2
; Install

SetCompressor /SOLID lzma
SetCompressorDictSize 8

; --------------------
; HEADER SIZE: 32467
; START HEADER SIZE: 300
; MAX STRING LENGTH: 1024
; STRING CHARS: 8201

OutFile [NSIS].exe
!include WinMessages.nsh

ShowInstDetails show
AutoCloseWindow true
InstallDirRegKey HKCU "SOFTWARE\Gammon Software Solutions\MUSHclient\General Options" InstallDir
LicenseBkColor /windows


; --------------------
; LANG TABLES: 1
; LANG STRINGS: 78

Name MUSHclient
BrandingText "Nullsoft Install System v2.46"

; LANG: 1033
LangString LSTR_0 1033 "Nullsoft Install System v2.46"
LangString LSTR_1 1033 "MUSHclient Installer"
LangString LSTR_2 1033 MUSHclient
LangString LSTR_3 1033 "Space available: "
LangString LSTR_4 1033 "Space required: "
LangString LSTR_5 1033 "Can't write: "
LangString LSTR_8 1033 "Could not find symbol: "
LangString LSTR_9 1033 "Could not load: "
LangString LSTR_10 1033 "Create folder: "
LangString LSTR_11 1033 "Create shortcut: "
LangString LSTR_12 1033 "Created uninstaller: "
LangString LSTR_13 1033 "Delete file: "
LangString LSTR_14 1033 "Delete on reboot: "
LangString LSTR_15 1033 "Error creating shortcut: "
LangString LSTR_16 1033 "Error creating: "
LangString LSTR_17 1033 "Error decompressing data! Corrupted installer?"
LangString LSTR_19 1033 "ExecShell: "
LangString LSTR_21 1033 "Extract: "
LangString LSTR_22 1033 "Extract: error writing to file "
LangString LSTR_23 1033 "Installer corrupted: invalid opcode"
LangString LSTR_24 1033 "No OLE for: "
LangString LSTR_25 1033 "Output folder: "
LangString LSTR_26 1033 "Remove folder: "
LangString LSTR_29 1033 "Skipped: "
LangString LSTR_30 1033 "Copy Details To Clipboard"
LangString LSTR_32 1033 B
LangString LSTR_33 1033 K
LangString LSTR_34 1033 M
LangString LSTR_35 1033 G
LangString LSTR_36 1033 "Welcome to the $(LSTR_77) Setup Wizard"
LangString LSTR_37 1033 "This wizard will guide you through the installation of $(LSTR_77).$\r$\n$\r$\nIt is recommended that you close all other applications before starting Setup. This will make it possible to update relevant system files without having to reboot your computer.$\r$\n$\r$\n$_CLICK"
LangString LSTR_38 1033 "Error opening file for writing: $\r$\n$\r$\n$0$\r$\n$\r$\nClick Abort to stop the installation,$\r$\nRetry to try again, or$\r$\nIgnore to skip this file."
LangString LSTR_39 1033 "MS Shell Dlg"
LangString LSTR_40 1033 "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install $(LSTR_77)."
LangString LSTR_41 1033 "License Agreement"
LangString LSTR_42 1033 "Please review the license terms before installing $(LSTR_77)."
LangString LSTR_43 1033 "Press Page Down to see the rest of the agreement."
LangString LSTR_44 1033 "Choose Install Location"
LangString LSTR_45 1033 "Choose the folder in which to install $(LSTR_77)."
LangString LSTR_46 1033 Installing
LangString LSTR_47 1033 "Please wait while $(LSTR_77) is being installed."
LangString LSTR_48 1033 "Installation Complete"
LangString LSTR_49 1033 "Setup was completed successfully."
LangString LSTR_50 1033 "Installation Aborted"
LangString LSTR_51 1033 "Setup was not completed successfully."
LangString LSTR_52 1033 &Finish
LangString LSTR_53 1033 "Completing the $(LSTR_77) Setup Wizard"
LangString LSTR_54 1033 "Your computer must be restarted in order to complete the installation of $(LSTR_77). Do you want to reboot now?"
LangString LSTR_55 1033 "Reboot now"
LangString LSTR_56 1033 "I want to manually reboot later"
LangString LSTR_57 1033 "$(LSTR_77) has been installed on your computer.$\r$\n$\r$\nClick Finish to close this wizard."
LangString LSTR_58 1033 0
LangString LSTR_59 1033 8
LangString LSTR_60 1033 "Are you sure you want to quit $(LSTR_2) Setup?"
LangString LSTR_61 1033 Custom
LangString LSTR_62 1033 Cancel
LangString LSTR_63 1033 "< &Back"
LangString LSTR_64 1033 "&Next >"
LangString LSTR_65 1033 "Click Next to continue."
LangString LSTR_66 1033 "I &Agree"
LangString LSTR_67 1033 "Setup has determined the optimal location to install. If you would like to change the directory, do so now."
LangString LSTR_68 1033 "Destination Folder"
LangString LSTR_69 1033 B&rowse...
LangString LSTR_70 1033 "Select the folder to install $(LSTR_77) in:"
LangString LSTR_71 1033 &Install
LangString LSTR_72 1033 "Click Install to start the installation."
LangString LSTR_73 1033 "Show &details"
LangString LSTR_74 1033 Completed
LangString LSTR_75 1033 " "
LangString LSTR_76 1033 &Close
LangString LSTR_77 1033 MUSHclient


; --------------------
; VARIABLES: 3

Var _0_
Var _1_
Var _2_


InstType Typical
InstType Full
InstType Compact
InstType $(LSTR_61)    ;  Custom
InstallDir $PROGRAMFILES\MUSHclient
; install_directory_auto_append = MUSHclient
; wininit = $WINDIR\wininit.ini


; --------------------
; PAGES: 6

; Page 0
Page custom func_0 func_67 /ENABLECANCEL

; Page 1
Page license func_68 func_73 func_77 /ENABLECANCEL
  LicenseText $(LSTR_40) $(LSTR_66)    ;  "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install $(LSTR_77)." "I &Agree" MUSHclient
  LicenseData [LICENSE].txt

; Page 2
Page directory func_78 func_83 func_84 /ENABLECANCEL
  DirText $(LSTR_67) $(LSTR_68) $(LSTR_69) $(LSTR_70)    ;  "Setup has determined the optimal location to install. If you would like to change the directory, do so now." "Destination Folder" B&rowse... "Select the folder to install $(LSTR_77) in:" MUSHclient
  DirVar $CMDLINE

; Page 3
Page instfiles func_85 func_90 func_91
  CompletedText $(LSTR_74)    ;  Completed
  DetailsButtonText $(LSTR_73)    ;  "Show &details"

/*
; Page 4
Page COMPLETED
*/

; Page 5
Page custom func_103 func_205


; --------------------
; SECTIONS: 7
; COMMANDS: 567

Function func_0    ; Page 0, Pre
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NumFields 3
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NextButtonText ""
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings CancelEnabled ""
  Push $(LSTR_36)    ;  "Welcome to the $(LSTR_77) Setup Wizard" MUSHclient
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Bottom 38
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Top 45
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 185
  Push $(LSTR_37)    ;  "This wizard will guide you through the installation of $(LSTR_77).$\r$\n$\r$\nIt is recommended that you close all other applications before starting Setup. This will make it possible to update relevant system files without having to reboot your computer.$\r$\n$\r$\n$_CLICK" MUSHclient
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  LockWindow off
  InstallOptions::initDialog $PLUGINSDIR\ioSpecial.ini
    ; Call Initialize_____Plugins
    ; SetOverwrite off
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; Push $PLUGINSDIR\ioSpecial.ini
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll initDialog
  Pop $_2_
  SetCtlColors $_2_ "" 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1201
  SetCtlColors $_0_ "" 0xFFFFFF
  CreateFont $_1_ $(LSTR_39) 12 700    ;  "MS Shell Dlg"
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  GetDlgItem $_0_ $_2_ 1202
  SetCtlColors $_0_ "" 0xFFFFFF
  Push $0
  InstallOptions::show
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll show
  Pop $0
  Pop $0
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_HIDE}
  LockWindow off
FunctionEnd


Function func_67    ; Page 0, Leave
FunctionEnd


Function func_68    ; Page 1, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_41)    ;  "License Agreement"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_42)    ;  "Please review the license terms before installing $(LSTR_77)." MUSHclient
FunctionEnd


Function func_73    ; Page 1, Show
  FindWindow $_0_ "#32770" "" $HWNDPARENT
  GetDlgItem $_0_ $_0_ 1040
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_43)    ;  "Press Page Down to see the rest of the agreement."
FunctionEnd


Function func_77    ; Page 1, Leave
FunctionEnd


Function func_78    ; Page 2, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_44)    ;  "Choose Install Location"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_45)    ;  "Choose the folder in which to install $(LSTR_77)." MUSHclient
FunctionEnd


Function func_83    ; Page 2, Show
FunctionEnd


Function func_84    ; Page 2, Leave
FunctionEnd


Function func_85    ; Page 3, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_46)    ;  Installing
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_47)    ;  "Please wait while $(LSTR_77) is being installed." MUSHclient
FunctionEnd


Function func_90    ; Page 3, Show
FunctionEnd


Function func_91    ; Page 3, Leave
  IfAbort label_97
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_48)    ;  "Installation Complete"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_49)    ;  "Setup was completed successfully."
  Goto label_101
label_97:
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_50)    ;  "Installation Aborted"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_51)    ;  "Setup was not completed successfully."
label_101:
  IfAbort label_102
label_102:
FunctionEnd


Function func_103    ; Page 5, Pre
  Push $(LSTR_52)    ;  &Finish
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NextButtonText $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Bottom 38
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Top 45
  Push $(LSTR_53)    ;  "Completing the $(LSTR_77) Setup Wizard" MUSHclient
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 185
  IfRebootFlag 0 label_142
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 85
  Push $(LSTR_54)    ;  "Your computer must be restarted in order to complete the installation of $(LSTR_77). Do you want to reboot now?" MUSHclient
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings Numfields 5
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Type RadioButton
  Push $(LSTR_55)    ;  "Reboot now"
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Left 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Right 321
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Top 90
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Bottom 100
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Type RadioButton
  Push $(LSTR_56)    ;  "I want to manually reboot later"
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Left 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Right 321
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Top 110
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Bottom 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" State 1
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" State 0
  Goto label_146
label_142:
  Push $(LSTR_57)    ;  "$(LSTR_77) has been installed on your computer.$\r$\n$\r$\nClick Finish to close this wizard." MUSHclient
  Call func_237
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
label_146:
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  LockWindow off
  InstallOptions::initDialog $PLUGINSDIR\ioSpecial.ini
    ; Call Initialize_____Plugins
    ; AllowSkipFiles off
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; Push $PLUGINSDIR\ioSpecial.ini
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll initDialog
  Pop $_2_
  SetCtlColors $_2_ "" 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1201
  SetCtlColors $_0_ "" 0xFFFFFF
  CreateFont $_1_ $(LSTR_39) 12 700    ;  "MS Shell Dlg"
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  GetDlgItem $_0_ $_2_ 1202
  SetCtlColors $_0_ "" 0xFFFFFF
  IfRebootFlag 0 label_181
  GetDlgItem $_0_ $_2_ 1203
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1204
  SetCtlColors $_0_ "" 0xFFFFFF
  Goto label_181
label_181:
  Push $0
  InstallOptions::show
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll show
  Pop $0
  Pop $0
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_HIDE}
  LockWindow off
FunctionEnd


Function func_205    ; Page 5, Leave
  IfRebootFlag 0 label_211
  ReadINIStr $_0_ $PLUGINSDIR\ioSpecial.ini "Field 4" State
  StrCmp $_0_ 1 0 label_210
  Reboot
    ; Quit
label_210:
  Return

label_211:
FunctionEnd


Function .onGUIInit
  InitPluginsDir
    ; Call Initialize_____Plugins
    ; SetDetailsPrint lastused
  SetOverwrite on
  AllowSkipFiles on
  File $PLUGINSDIR\ioSpecial.ini
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings RTL $(LSTR_58)    ;  0
  File $PLUGINSDIR\modern-wizard.bmp
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 1" Text $PLUGINSDIR\modern-wizard.bmp
  GetDlgItem $_0_ $HWNDPARENT 1037
  CreateFont $_1_ $(LSTR_39) $(LSTR_59) 700    ;  "MS Shell Dlg" 8
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1038
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1034
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1039
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1028
  SetCtlColors $_0_ /BRANDING ""
  GetDlgItem $_0_ $HWNDPARENT 1256
  SetCtlColors $_0_ /BRANDING ""
  SendMessage $_0_ ${WM_SETTEXT} 0 "STR:$(LSTR_0) "    ;  "Nullsoft Install System v2.46"
FunctionEnd


Function .onUserAbort
  MessageBox MB_YESNO|MB_ICONEXCLAMATION $(LSTR_60) IDYES label_236    ;  "Are you sure you want to quit $(LSTR_2) Setup?" MUSHclient
  Abort
label_236:
FunctionEnd


Function func_237
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
  Push $1
  Push $2
  Push $3
  Push $4
  StrCpy $1 ""
  StrLen $3 $0
  IntOp $3 $3 - 1
  StrCpy $4 0
  Goto label_250
label_249:
  IntOp $4 $4 + 1
label_250:
  IntCmp $4 $3 0 0 label_267
  StrCpy $2 $0 1 $4
  StrCmp $2 \ 0 label_255
  StrCpy $2 \\
  Goto label_263
label_255:
  StrCmp $2 $\r 0 label_258
  StrCpy $2 \r
  Goto label_263
label_258:
  StrCmp $2 $\n 0 label_261
  StrCpy $2 \n
  Goto label_263
label_261:
  StrCmp $2 $\t 0 label_263
  StrCpy $2 \t
label_263:
  StrCpy $1 $1$2
  Goto label_249
  Goto label_249
  Goto label_267
label_267:
  StrCpy $0 $1
  Pop $4
  Pop $3
  Pop $2
  Pop $1
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
FunctionEnd


Function .onInit
FunctionEnd


Section ; Section_0
  ; AddSize 9114
  SectionIn 1 2 3
  SetOutPath $INSTDIR
  WriteUninstaller uninstall.exe ;  $INSTDIR\uninstall.exe
  File readme.txt
  File MUSHclient.exe
  File lua5.1.dll
  File lua5.1.lib
  File MUSHCLIENT.HLP
  File help.db
  File mushclient.cnt
  File mushclient.ico
  File tips.txt
  File Example_filters.lua
  File names.txt
  File license.txt
  File Dina.fon
  WriteRegStr HKCU "Software\Gammon Software Solutions\MUSHclient\General Options" InstallDir $INSTDIR
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\MUSHclient DisplayName "MUSHclient (remove only)"
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\MUSHclient UninstallString $INSTDIR\uninstall.exe
  ReadRegStr $1 HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" DefaultWorldFileDirectory
  StrCmp $1 "" 0 label_299
  WriteRegStr HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" DefaultWorldFileDirectory $INSTDIR\worlds\
  CreateDirectory $INSTDIR\worlds
label_299:
  ReadRegStr $1 HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" PluginsDirectory
  StrCmp $1 "" 0 label_304
  WriteRegStr HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" PluginsDirectory $INSTDIR\worlds\plugins\
  CreateDirectory $INSTDIR\worlds\plugins
  CreateDirectory $INSTDIR\worlds\plugins\state
label_304:
  ReadRegStr $1 HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" DefaultLogFileDirectory
  StrCmp $1 "" 0 label_308
  WriteRegStr HKCU "Software\Gammon Software Solutions\MUSHclient\Global prefs" DefaultLogFileDirectory $INSTDIR\logs\
  CreateDirectory $INSTDIR\logs
label_308:
  CreateDirectory $INSTDIR\locale
  SetOutPath $INSTDIR\locale
  File Localize_template.lua
  File en.dll
  File en_small.dll
  File count_locale_usage.lua
  File detect_locale_changes.lua
  File locale_notes.txt
  SetOutPath $INSTDIR
  CreateDirectory $INSTDIR\sounds
  CreateDirectory $INSTDIR\names
  SetOutPath $INSTDIR\names
  File ALBION.NAM
  File ALVER.NAM
  File ALVER1.NAM
  File ALVER2.NAM
  File DEVERRY1.NAM
  File DEVERRY2.NAM
  File DVARGAR.NAM
  File Dragonl1.nam
  File Felana.nam
  File GALLER.NAM
  File HOBER.NAM
  File ORC1.NAM
  File ORC2.NAM
  File albion1.nam
  File albion2.nam
  File dvargar1.nam
  File dvargar2.nam
  File f_female.nam
  File f_male.nam
  File gnome1.nam
  File gnome2.nam
  File hober1.nam
  File hober2.nam
  File kender1.nam
  File kender2.nam
  File kerrel.nam
  File orc.nam
  File sparhawk.nam
  SetOutPath $INSTDIR
SectionEnd


Section "Spell checker" ; Section_1
  ; AddSize 569
  SectionIn 1 2
  SetOutPath $INSTDIR\spell
  File english-words.10
  File english-words.20
  File english-words.35
  File english-words.40
  File english-upper.10
  File english-upper.35
  File english-upper.40
  File american-words.10
  File american-words.20
  File english-contractions.10
  File english-contractions.35
  SetOutPath $INSTDIR
  File spellchecker.lua
SectionEnd


Section Documentation ; Section_2
  ; AddSize 729
  SectionIn 1 2
  SetOutPath $INSTDIR\docs
  File "JSON License.txt"
  File "Lua Colors LICENSE.txt"
  File LuaJSON.txt
  File LuaSocket_license.txt
  File PCRE_ChangeLog.txt
  File RegularExpressions.txt
  File gpl.txt
  File lpeg.html
  File lpeg-128.gif
  File lsqlite3.html
  File lua_license.txt
  File luacom.pdf
  File mersenne_twister.txt
  File re.html
  CreateDirectory $INSTDIR\docs\LuaSocket_documentation
  SetOutPath $INSTDIR\docs\LuaSocket_documentation
  File dns.html
  File ftp.html
  File http.html
  File index.html
  File installation.html
  File introduction.html
  File ltn12.html
  File luasocket.png
  File mime.html
  File reference.css
  File reference.html
  File smtp.html
  File socket.html
  File tcp.html
  File udp.html
  File url.html
SectionEnd


Section Fonts ; Section_3
  ; AddSize 310
  SectionIn 1 2
  SetOutPath $INSTDIR\fonts
  File banner.flf
  File big.flf
  File block.flf
  File bubble.flf
  File digital.flf
  File lean.flf
  File mini.flf
  File script.flf
  File shadow.flf
  File slant.flf
  File small.flf
  File smscript.flf
  File smshadow.flf
  File smslant.flf
  File standard.flf
  File term.flf
SectionEnd


Section Scripting ; Section_4
  ; AddSize 605
  SectionIn 1 2
  CreateDirectory $INSTDIR\scripts
  CreateDirectory $INSTDIR\lua
  SetOutPath $INSTDIR\lua
  SetOverwrite ifnewer
  File InfoBox.lua
  File addxml.lua
  File alphanum.lua
  File check.lua
  File checkplugin.lua
  File colors.lua
  File commas.lua
  File copytable.lua
  File declare.lua
  File gauge.lua
  File getlines.lua
  File getstyle.lua
  File getworld.lua
  File mapper.lua
  File movewindow.lua
  File mw.lua
  File pairsbykeys.lua
  File ppi.lua
  File re.lua
  File sandbox.lua
  File serialize.lua
  File show_loaded.lua
  File strict.lua
  File string_indexing.lua
  File tprint.lua
  File var.lua
  File wait.lua
  File words_to_numbers.lua
  File luacom5.lua
  File socket.lua
  File ltn12.lua
  File mime.lua
  CreateDirectory $INSTDIR\mime
  SetOutPath $INSTDIR\mime
  File core.dll
  CreateDirectory $INSTDIR\socket
  SetOutPath $INSTDIR\socket
  File core.dll
  File ftp.lua
  File http.lua
  File smtp.lua
  File tp.lua
  File url.lua
  SetOutPath $INSTDIR\lua
  File json.lua
  CreateDirectory $INSTDIR\lua\json
  SetOutPath $INSTDIR\lua\json
  File encode.lua
  File decode.lua
  File util.lua
  CreateDirectory $INSTDIR\lua\json\encode
  SetOutPath $INSTDIR\lua\json\encode
  File array.lua
  File calls.lua
  File number.lua
  File object.lua
  File others.lua
  File output.lua
  File output_utility.lua
  File strings.lua
  CreateDirectory $INSTDIR\lua\json\decode
  SetOutPath $INSTDIR\lua\json\decode
  File array.lua
  File calls.lua
  File composite.lua
  File number.lua
  File object.lua
  File others.lua
  File state.lua
  File strings.lua
  File util.lua
  SetOutPath $INSTDIR\scripts
  File exampscript.vbs
  File exampscript.js
  File exampscript.pl
  File exampscript.pys
  File exampscript.lua
  SetOverwrite on
  File MUSHclient.tlb
SectionEnd


Section Plugins ; Section_5
  ; AddSize 318
  SectionIn 1 2
  SetOutPath $INSTDIR\worlds\plugins
  File constants.vbs
  File constants.js
  File constants.pl
  File constants.pys
  File constants.lua
  File ANSI_Log.xml
  File ATCP_Mapper.xml
  File ATCP_NJG.xml
  File Automatic_Backup.xml
  File Calculator.xml
  File chat.xml
  File Code_Chart.xml
  File ColourNote.xml
  File Config_Option_Changer.xml
  File Current_Output_Window.xml
  File gag.xml
  File health_bar.xml
  File Hyperlink_URL.xml
  File InfoBox_Demo.xml
  File Installer_sumcheck.xml
  File MUSHclient_Help.xml
  File mush_teleport.xml
  File Messages_Window.xml
  File MudDatabase.xml
  File NewActivity.xml
  File Omit_Blank_Lines.xml
  File SMAUG_automapper_helper.xml
  File showactivity.xml
  File status_bar_prompt.xml
  File Summary.xml
  File Text_To_Speech.xml
  File timer.xml
  File Timestamps.xml
  File idle_message.xml
  File msp.xml
  File multiple_send.xml
  File plugin_list.xml
  File plugin_summary.xml
  File random_socials.xml
  File reverse_speedwalk.xml
  File scan.xml
  File Version_Check.xml
SectionEnd


Section "Start Menu Shortcuts" ; Section_6
  SectionIn 1 2
  SetOutPath $SMPROGRAMS\MUSHclient
  SetOutPath $INSTDIR
  CreateShortCut $SMPROGRAMS\MUSHclient\MUSHclient.lnk $INSTDIR\MUSHclient.exe "" $INSTDIR\MUSHclient.exe
  CreateShortCut "$SMPROGRAMS\MUSHclient\Read Me.lnk" $INSTDIR\Readme.txt "" $INSTDIR\Readme.txt
  CreateShortCut "$SMPROGRAMS\MUSHclient\Uninstall MUSHclient.lnk" $INSTDIR\uninstall.exe "" $INSTDIR\uninstall.exe
SectionEnd


Function .onInstSuccess
  MessageBox MB_YESNO "Launch MUSHclient now?" IDNO label_552
  SetOutPath $INSTDIR
  ExecShell open $INSTDIR\mushclient.exe    ; "open $INSTDIR\mushclient.exe"
label_552:
FunctionEnd


/*
Function Initialize_____Plugins
  SetDetailsPrint none
  StrCmp $PLUGINSDIR "" 0 label_563
  Push $0
  SetErrors
  GetTempFileName $0
  Delete $0
  CreateDirectory $0
  IfErrors label_564
  StrCpy $PLUGINSDIR $0
  Pop $0
label_563:
  Return

label_564:
  MessageBox MB_OK|MB_ICONSTOP "Error! Can't initialize plug-ins directory. Please try again later." /SD IDOK
  Quit
FunctionEnd
*/



; --------------------
; UNREFERENCED STRINGS:

/*
34 $PROGRAMFILES
38 CommonFilesDir
53 "$PROGRAMFILES\Common Files"
70 $COMMONFILES
*/
