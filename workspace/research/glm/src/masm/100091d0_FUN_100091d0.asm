.686
.MODEL FLAT, C
EXTRN sub_10006420:PROC
EXTRN sub_1000865A:PROC
EXTRN sub_100088F3:PROC
EXTRN sub_1002467A:PROC
EXTRN g_101D1B9C:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_100091d0 PROC
    mov edx, dword ptr [g_10678510]
    sub esp, 24
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 36]
    mov ebx, ebp
    mov ecx, ebp
    imul ebx, ebx, 52
    imul ecx, ecx, 116
    push esi
    push edi
    add ebx, 010678AC4h
    mov edi, dword ptr [ebx + 4]
    add ecx, edx
    lea esi, [esp + 28]
    lea edx, [esp + 16]
    call sub_100088F3
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 48]
    call sub_10006420
    test al, al
    jne L0
    mov eax, esi
    push eax
    mov ecx, edx
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 12]
    push ecx
    push ebp
    push eax
    call sub_1000865A
    add esp, 16
    cmp eax, -1
    jne L0
    push ebp
    mov eax, ebx
    call sub_1002467A
    add esp, 4
L0:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_100091d0 ENDP
END
