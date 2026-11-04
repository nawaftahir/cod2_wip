.686
.MODEL FLAT, C
EXTRN sub_10006420:PROC
EXTRN sub_1000865A:PROC
EXTRN sub_100088F3:PROC
EXTRN sub_10009281:PROC
EXTRN sub_1000929F:PROC
EXTRN sub_1002467A:PROC
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_100091d0 PROC
    mov mov edx, dword ptr [g_10678510]
    sub sub esp, 24
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    mov mov ebx, ebp
    mov mov ecx, ebp
    imul imul ebx, ebx, 52
    imul imul ecx, ecx, 116
    push push esi
    push push edi
    add add ebx, 010678AC4h
    mov mov edi, dword ptr [ebx + 4]
    add add ecx, edx
    lea lea esi, [esp + 28]
    lea lea edx, [esp + 16]
    call sub_100088F3
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [esp + 48]
    call sub_10006420
    test test al, al
    jne sub_10009281
    mov mov eax, esi
    push push eax
    mov mov ecx, edx
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 12]
    push push ecx
    push push ebp
    push push eax
    call sub_1000865A
    add add esp, 16
    cmp cmp eax, -1
    jne sub_1000929F
    push push ebp
    mov mov eax, ebx
    call sub_1002467A
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
FUN_100091d0 ENDP
END
