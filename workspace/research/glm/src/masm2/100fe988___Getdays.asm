.686
.MODEL FLAT, C
EXTRN sub_100FA217:PROC
EXTRN sub_100FA221:PROC
EXTRN sub_100FA254:PROC
EXTRN sub_100FA26A:PROC
EXTRN sub_100FC49A:PROC
EXTRN sub_100FE8DE:PROC
EXTRN sub_100FE8F4:PROC
EXTRN sub_100FEA3D:PROC
EXTRN sub_100FEA3E:PROC
EXTRN EXTRN g_101A4FD0:DWORD:DWORD
.CODE
__Getdays PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [g_101A4FD0]
    xor xor esi, esi
    xor xor ebx, ebx
    push push dword ptr [edi + ebx*4 + 28]
    call sub_100FA217
    push push dword ptr [edi + ebx*4]
    mov mov ebp, eax
    call sub_100FA221
    add add eax, esi
    inc inc ebx
    cmp cmp ebx, 7
    pop pop ecx
    pop pop ecx
    lea lea esi, [eax + ebp + 2]
    jb L0
    inc inc esi
    push push esi
    call sub_100FC49A
    mov mov ebp, eax
    test test ebp, ebp
    pop pop ecx
    je sub_100FEA3D
L0:
    mov mov esi, ebp
    xor xor ebx, ebx
    mov mov byte ptr [esi], 58
    push push dword ptr [edi + ebx*4]
    inc inc esi
    push push esi
    call sub_100FE8DE
    push push eax
    call sub_100FA254
    add add esi, eax
    mov mov byte ptr [esi], 58
    push push dword ptr [edi + ebx*4 + 28]
    inc inc esi
    push push esi
    call sub_100FE8F4
    push push eax
    call sub_100FA26A
    add add esp, 24
    add add esi, eax
    inc inc ebx
    cmp cmp ebx, 7
    jb sub_100FEA3E
    mov mov byte ptr [esi], 0
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    ret ret
__Getdays ENDP
END
