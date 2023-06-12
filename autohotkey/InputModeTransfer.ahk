CapsLock::
SendInput  {ESC}
; 下方代码可只保留一个
;SwitchIME(0x04090409) ; 英语(美国) 美式键盘
SwitchIME(0x08040804) ; 中文(中国) 简体中文-美式键盘
return

RAlt::
SendInput {Shift down}{LAlt down}{LAlt up}{Shift up}

SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}