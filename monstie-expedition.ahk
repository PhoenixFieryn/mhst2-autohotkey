#MaxThreadsPerHotkey 2
Numpad0::
Toggle := !Toggle
loop {
    If not Toggle
        break

    MonstieExpX = false
    MonstieExpY = false
    
    ImageSearch, MonstieExpX, MonstieExpY, 0, 0, 160, 70, *30 %A_ScriptDir%\images\monstie-exp.png

    if (MonstieExpX != false and MonstieExpY != false) {

        loop {
            If not Toggle
                break

            ImageSearch, ReadyX, ReadyY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\ready.png

            if (ErrorLevel == 0) {
                DepartExp(ReadyX, ReadyY)
            }

            ImageSearch, ExpCompletionX, ExpCompletionY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\done.png

            if (ErrorLevel == 0) {
                MouseClick, L, ExpCompletionX, ExpCompletionY
            }

            ImageSearch, TakeAllX, TakeAllY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\take-all.png

            if (ErrorLevel == 0) {
                MouseClick, L, TakeAllX, TakeAllY

                ClickNext()
            }

            ClickNext()

            ClickOk()

            ClickDepart()

            ClickConfirm()
            
            SwitchScreen()
        }
    }
}
return

Escape::
ExitApp
return

IsItemScreen() {
    ImageSearch, ItemScreenX, ItemScreenY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\items.png

    return ErrorLevel == 0
}

IsResultsScreen() {
    ImageSearch, FindX, FindY, 0, 0, 160, 70, *30 %A_ScriptDir%\images\results.png

    return ErrorLevel == 0
}

ClickNext() {
    ImageSearch, NextX, NextY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\next.png

    if (ErrorLevel == 0) {
        MouseClick, L, NextX, NextY
    }
}

DepartExp(x, y) {
    MouseClick, L, x, y
    
    Sleep, 800

    ClickDepart()

    Sleep, 500

    ClickConfirm()
}

ClickDepart() {
    ImageSearch, DepartX, DepartY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\depart.png

    if (ErrorLevel == 0) {
        MouseClick, L, DepartX, DepartY
    }

    ImageSearch, DepartBlueX, DepartBlueY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\depart-blue.png

    if (ErrorLevel == 0) {
        MouseClick, L, DepartBlueX, DepartBlueY
    }
}

ClickConfirm() {
    ImageSearch, DepartConfirmX, DepartConfirmY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\depart-confirm.png
    
    if (ErrorLevel == 0) {
        MouseClick, L, DepartConfirmX, DepartConfirmY
    }
}

ClickOk() {
    ImageSearch, OkX, OkY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\ok.png

    if (ErrorLevel == 0) {
        MouseClick, L, OkX, OkY
    }
}

SwitchScreen() {
    ImageSearch, ArrowX, ArrowY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %A_ScriptDir%\images\arrow.png

    if (ErrorLevel == 0) {
        MouseClick, L, SwitchScreen, ArrowX, ArrowY
    }
}