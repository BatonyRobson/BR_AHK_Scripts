; Скрипт написан Батони Робсоном и нейрочатом Копайлот от майкрософт. Я нихуя не ебу в лицензиях, но если чё, то запрещаю коммерческое использование и публикацию без указания меня как автора. Скрипт тестил в течении сегодняшнего вечера у себя на компе и у меня всё гуд. Разумеется я не мог проверить все программы на свете. Сочетания клавиш модификаторов пока что не поддерживаются.

; Script was written by Batony Robson and AI chat Copilot by Microsoft. I dont know shit about licences and whatever so just know that i don't allow anyone for commercial use of this script and its republishing without giving me a credit. I tested it on my PC today and it worked okay. Just not works with modifier keys combinations.

#MaxHotkeysPerInterval 200

; Отключаем стандартное переключение Caps Lock
CapsLock::return

; Отключаем стандартное переключение Scroll Lock
ScrollLock::return

; Включение и выключение Caps Lock при нажатии Ctrl + Caps Lock
^CapsLock::
SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
return

; Включение и выключение Scroll Lock при нажатии Scroll Lock + правый Ctrl
^ScrollLock::
SetScrollLockState, % GetKeyState("ScrollLock", "T") ? "Off" : "On"
return

; Обработчик колесика вверх
WheelUp::
if GetKeyState("CapsLock", "P") {  ; Если Caps Lock удерживается
    Send, {Left}  ; Отправляем стрелку влево
    return
} else if GetKeyState("ScrollLock", "P") {  ; Если Scroll Lock удерживается
    Send, {Up}  ; Отправляем стрелку вверх
    return
}
Send, {WheelUp}  ; В остальных случаях выполняем стандартное действие
return

; Обработчик колесика вниз
WheelDown::
if GetKeyState("CapsLock", "P") {  ; Если Caps Lock удерживается
    Send, {Right}  ; Отправляем стрелку вправо
    return
} else if GetKeyState("ScrollLock", "P") {  ; Если Scroll Lock удерживается
    Send, {Down}  ; Отправляем стрелку вниз
    return
}
Send, {WheelDown}  ; В остальных случаях выполняем стандартное действие
return

; Перехват колесика вверх для правого Alt (AltGr) + стрелка влево
RAlt & WheelUp::
Send, !{Left}  ; Alt + Стрелка влево
return

; Перехват колесика вниз для правого Alt (AltGr) + стрелка вправо
RAlt & WheelDown::
Send, !{Right}  ; Alt + Стрелка вправо
return

; Перехват колесика вверх для правого Ctrl + стрелка влево
>^WheelUp::
Send, ^{Left}  ; Ctrl + Стрелка влево
return

; Перехват колесика вниз для правого Ctrl + стрелка вправо
>^WheelDown::
Send, ^{Right}  ; Ctrl + Стрелка вправо
return

; Перехват колесика вверх для правого Shift + стрелка влево
>+WheelUp::
Send, +{Left}  ; Shift + Стрелка влево
return

; Перехват колесика вниз для правого Shift + стрелка вправо
>+WheelDown::
Send, +{Right}  ; Shift + Стрелка вправо
return
