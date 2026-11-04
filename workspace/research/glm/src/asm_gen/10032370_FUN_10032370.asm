; FUN_10032370 @ 0x10032370 — auto-synthesized
    EXTRN g_1072dec0:DWORD
    EXTRN g_1072dec4:DWORD
.CODE
FUN_10032370 PROC
    mov al, dl
    sub al, 0x30
    cmp al, 0xa
    movzx eax, al
    jb L0
    mov eax, 7
    movzx eax, al
    cmp eax, 8
    jae L1
    mov eax, dword ptr [eax*4 + 0x10197f1c]
    mov dword ptr [ecx], eax
    ret
    movzx eax, dl
    sub eax, 0x38
    je L2
    dec eax
    je L3
    mov al, 0xff
    mov byte ptr [ecx + 2], al
    mov byte ptr [ecx + 1], al
    mov byte ptr [ecx], al
    mov byte ptr [ecx + 3], al
    ret
    mov edx, dword ptr [g_1072dec0]
    mov dword ptr [ecx], edx
    ret
    mov eax, dword ptr [g_1072dec4]
    mov dword ptr [ecx], eax
    ret
FUN_10032370 ENDP
END