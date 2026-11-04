.686
.MODEL FLAT, C
EXTRN g_1072DEC0:DWORD
EXTRN g_1072DEC4:DWORD
.CODE
FUN_10032370 PROC
    mov al, dl
    sub al, 48
    cmp al, 10
    movzx eax, al
    jb L0
    mov eax, 7
L0:
    movzx eax, al
    cmp eax, 8
    jae L1
    mov eax, dword ptr [eax*4 + 010197F1Ch]
    mov dword ptr [ecx], eax
    ret
L1:
    movzx eax, dl
    sub eax, 56
    je L3
    dec eax
    je L2
    mov al, 0000000FFh
    mov byte ptr [ecx + 2], al
    mov byte ptr [ecx + 1], al
    mov byte ptr [ecx], al
    mov byte ptr [ecx + 3], al
    ret
L2:
    mov edx, dword ptr [g_1072DEC0]
    mov dword ptr [ecx], edx
    ret
L3:
    mov eax, dword ptr [g_1072DEC4]
    mov dword ptr [ecx], eax
    ret
FUN_10032370 ENDP
END
