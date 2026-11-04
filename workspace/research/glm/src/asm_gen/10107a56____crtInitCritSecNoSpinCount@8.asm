; ___crtInitCritSecNoSpinCount@8 @ 0x10107a56 — auto-synthesized
    EXTRN fp_1010c034:DWORD
.CODE
___crtInitCritSecNoSpinCount@8 PROC
    push dword ptr [esp + 4]
    call dword ptr [fp_1010c034]
    xor eax, eax
    inc eax
    ret 8
___crtInitCritSecNoSpinCount@8 ENDP
END