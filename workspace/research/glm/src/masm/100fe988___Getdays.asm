.686
.MODEL FLAT, C
EXTRN sub_100FA217:PROC
EXTRN sub_100FA221:PROC
EXTRN sub_100FA254:PROC
EXTRN sub_100FA26A:PROC
EXTRN sub_100FC49A:PROC
EXTRN sub_100FE8DE:PROC
EXTRN sub_100FE8F4:PROC
EXTRN g_101A4FD0:DWORD
.CODE
__Getdays PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [g_101A4FD0]
    xor esi, esi
    xor ebx, ebx
L0:
    push dword ptr [edi + ebx*4 + 28]
    call sub_100FA217
    push dword ptr [edi + ebx*4]
    mov ebp, eax
    call sub_100FA221
    add eax, esi
    inc ebx
    cmp ebx, 7
    pop ecx
    pop ecx
    lea esi, [eax + ebp + 2]
    jb L0
    inc esi
    push esi
    call sub_100FC49A
    mov ebp, eax
    test ebp, ebp
    pop ecx
    je L2
    mov esi, ebp
    xor ebx, ebx
L1:
    mov byte ptr [esi], 58
    push dword ptr [edi + ebx*4]
    inc esi
    push esi
    call sub_100FE8DE
    push eax
    call sub_100FA254
    add esi, eax
    mov byte ptr [esi], 58
    push dword ptr [edi + ebx*4 + 28]
    inc esi
    push esi
    call sub_100FE8F4
    push eax
    call sub_100FA26A
    add esp, 24
    add esi, eax
    inc ebx
    cmp ebx, 7
    jb L1
    mov byte ptr [esi], 0
L2:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
__Getdays ENDP
END
