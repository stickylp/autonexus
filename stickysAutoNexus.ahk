;Autonexus v1.2 script made by Sticky for MPGH
#NoEnv
#MaxThreadsPerHotkey 2

;settings

nexusHotkey = r ; here you can change the nexus hotkey

;code - dont touch if you dont understand AHK

Gui, Add, Tab2,, First Tab
Gui, Add, Radio, vMyRadio, 20`%
Gui, Add, Radio,, 30`%
Gui, Add, Radio,, 40`%
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.
Gui, Destroy

if MyRadio = 1
{
nexusValue := 20 * 3.35 + 1570
nexusValueCeil := Ceil(nexusValue)
}
else if MyRadio = 2 
{
nexusValue := 30 * 3.35 + 1570
nexusValueCeil := Ceil(nexusValue)
}
else if MyRadio = 3 
{
nexusValue := 40 * 3.35 + 1570
nexusValueCeil := Ceil(nexusValue)
}
else 
{
nexusValue := 30 * 3.35 + 1570
nexusValueCeil := Ceil(nexusValue)
}

CustomColor := "000000"
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s25  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cLime, OFF
WinSet, TransColor, %CustomColor% 200
Gui, Show, x1100 y-5 NoActivate 

^n::
Toggle := !Toggle
loop
{
    If not Toggle
	{
        GuiControl,, MyText, OFF
	break
	}
	GuiControl,, MyText, ON
    PixelGetColor, color, %nexusValueCeil%, 485
	if ("0xE3E3E3" = color) {
		Send %nexusHotkey%
	}
	else if ("0x545454" = color) {
		Send %nexusHotkey%
	}
	Sleep, 15 
}
return