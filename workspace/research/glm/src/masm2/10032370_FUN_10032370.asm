.686
.MODEL FLAT, C
EXTRN sub_100323D8:PROC
EXTRN sub_100323DE:PROC
EXTRN EXTRN g_1072DEC0:DWORD:DWORD
EXTRN EXTRN g_1072DEC4:DWORD:DWORD
.CODE
FUN_10032370 PROC
    mov mov al, dl
    sub sub al, 48
    cmp cmp al, 10
    movzx movzx eax, al
    jb L0
    mov mov eax, 7
    movzx movzx eax, al
    cmp cmp eax, 8
    jae L1
    mov mov eax, dword ptr [eax*4 + 010197F1Ch]
    mov mov dword ptr [ecx], eax
    ret ret
    movzx movzx eax, dl
    sub sub eax, 56
    je sub_100323DE
    dec dec eax
    je sub_100323D8
    mov mov al, 0FFh
    mov mov byte ptr [ecx + 2], al
    mov mov byte ptr [ecx + 1], al
    mov mov byte ptr [ecx], al
    mov mov byte ptr [ecx + 3], al
L1:
    ret ret
    mov mov edx, dword ptr [g_1072DEC0]
    mov mov dword ptr [ecx], edx
    ret ret
    mov mov eax, dword ptr [g_1072DEC4]
    mov mov dword ptr [ecx], eax
    ret ret
FUN_10032370 ENDP
END
