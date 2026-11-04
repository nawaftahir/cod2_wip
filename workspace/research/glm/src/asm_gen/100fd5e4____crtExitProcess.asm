; ___crtExitProcess @ 0x100fd5e4 — auto-synthesized
    EXTRN fp_1010c04c:DWORD
    EXTRN fp_1010c07c:DWORD
    EXTRN fp_1010c144:DWORD
.CODE
___crtExitProcess PROC
    push 0x1017c9a4
    call dword ptr [fp_1010c07c]
    test eax, eax
    je L0
    push 0x1017c994
    push eax
    call dword ptr [fp_1010c04c]
    test eax, eax
    je L0
    push dword ptr [esp + 4]
    call eax
    push dword ptr [esp + 4]
    call dword ptr [fp_1010c144]
___crtExitProcess ENDP
END