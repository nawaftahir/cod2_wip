.686
.MODEL FLAT, C
EXTRN sub_100092FF:PROC
EXTRN sub_1000942B:PROC
EXTRN sub_10009BEB:PROC
EXTRN sub_10009DC9:PROC
EXTRN sub_10009DD1:PROC
EXTRN sub_10009DD5:PROC
EXTRN sub_10009DE3:PROC
EXTRN sub_10009DED:PROC
EXTRN sub_10009DF4:PROC
EXTRN sub_10009E01:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101CE5EC:DWORD:DWORD
EXTRN EXTRN g_101D7E9C:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_10009cf0 PROC
    mov mov eax, 01C08h
    call sub_100F883A
    push push ebp
    push push esi
    push push 0
    lea lea eax, [esp + 0C14h]
    push push eax
    mov mov eax, dword ptr [esp + 01C1Ch]
    lea lea ecx, [esp + 24]
    push push ecx
    push push edi
    push push ebx
    push push edx
    push push eax
    call sub_10009BEB
    xor xor ebp, ebp
    add add esp, 28
    test test eax, eax
    mov mov dword ptr [esp + 12], eax
    mov mov dword ptr [esp + 8], ebp
    jle sub_10009DD1
    lea lea esp, [esp]
    mov mov esi, dword ptr [esp + ebp*4 + 0C10h]
    push push edi
    push push ebx
    push push esi
    call sub_100092FF
    mov mov al, byte ptr [g_101CE5EC]
    add add esp, 12
    test test al, al
    je sub_10009DE3
    mov mov eax, dword ptr [esi + 40]
    test test eax, eax
    mov mov esi, dword ptr [esi + 44]
    je sub_10009DED
    mov mov ebp, eax
    jmp sub_10009DC9
    lea lea esp, [esp]
    mov mov ecx, dword ptr [g_101D7E9C]
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [ecx + eax*4]
    cmp cmp edx, dword ptr [g_10678500]
    je sub_10009E01
    push push edi
    mov mov ecx, ebx
    call sub_1000942B
    add add esp, 4
    add add esi, 4
    dec dec ebp
    jne sub_10009DF4
    mov mov ebp, dword ptr [esp + 8]
    mov mov eax, dword ptr [esp + 12]
    inc inc ebp
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 8], ebp
    jl sub_10009DD5
    pop pop esi
    pop pop ebp
FUN_10009cf0 ENDP
END
