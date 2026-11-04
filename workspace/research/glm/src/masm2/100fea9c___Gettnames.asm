.686
.MODEL FLAT, C
EXTRN sub_100FA223:PROC
EXTRN sub_100FA22E:PROC
EXTRN sub_100FA25A:PROC
EXTRN sub_100FA264:PROC
EXTRN sub_100FA283:PROC
EXTRN sub_100FA290:PROC
EXTRN sub_100FA2A1:PROC
EXTRN sub_100FA2B0:PROC
EXTRN sub_100FA2BF:PROC
EXTRN sub_100FA31D:PROC
EXTRN sub_100FA338:PROC
EXTRN sub_100FA378:PROC
EXTRN sub_100FA393:PROC
EXTRN sub_100FA3BF:PROC
EXTRN sub_100FA3DB:PROC
EXTRN sub_100FA3F7:PROC
EXTRN sub_100FA413:PROC
EXTRN sub_100FC532:PROC
EXTRN sub_100FCEE2:PROC
EXTRN sub_100FE9A7:PROC
EXTRN sub_100FE9C2:PROC
EXTRN sub_100FEA02:PROC
EXTRN sub_100FEA1D:PROC
EXTRN sub_100FEA49:PROC
EXTRN sub_100FEA65:PROC
EXTRN sub_100FEA81:PROC
EXTRN sub_100FECED:PROC
EXTRN sub_100FED61:PROC
EXTRN sub_100FEDA3:PROC
EXTRN sub_100FEDA4:PROC
EXTRN EXTRN g_101A4FD0:DWORD:DWORD
.CODE
__Gettnames PROC
    push push ebp
L0:
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    push push esi
    mov mov esi, dword ptr [g_101A4FD0]
    push push edi
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], edi
    mov mov ebx, dword ptr [ebp - 4]
    shl shl ebx, 2
    push push dword ptr [ebx + esi + 28]
    call sub_100FA223
    push push dword ptr [ebx + esi]
    mov mov dword ptr [ebp - 16], eax
    call sub_100FA22E
    add add eax, edi
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 7
    pop pop ecx
    pop pop ecx
    mov mov ecx, dword ptr [ebp - 16]
    lea lea edi, [eax + ecx + 2]
    jb L2
    lea lea eax, [esi + 56]
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], 12
    mov mov ebx, dword ptr [ebp - 12]
    push push dword ptr [ebx + 48]
    call sub_100FA25A
    push push dword ptr [ebx]
    mov mov dword ptr [ebp - 16], eax
    call sub_100FA264
    add add dword ptr [ebp - 12], 4
    pop pop ecx
    pop pop ecx
    mov mov ecx, dword ptr [ebp - 16]
    add add eax, edi
    dec dec dword ptr [ebp - 8]
    lea lea edi, [eax + ecx + 2]
    jne L3
    push push dword ptr [esi + 098h]
    call sub_100FA283
    push push dword ptr [esi + 09Ch]
    mov mov ebx, eax
    call sub_100FA290
    push push dword ptr [esi + 0A0h]
    add add eax, edi
    lea lea edi, [eax + ebx + 2]
    call sub_100FA2A1
    push push dword ptr [esi + 0A4h]
    lea lea edi, [edi + eax + 1]
    call sub_100FA2B0
    push push dword ptr [esi + 0A8h]
    lea lea edi, [edi + eax + 1]
    call sub_100FA2BF
    lea lea eax, [edi + eax + 1]
    add add eax, 0B8h
    push push eax
    call sub_100FC532
    mov mov ebx, eax
    add add esp, 24
    test test ebx, ebx
    je sub_100FEDA3
    push push 0B8h
    push push dword ptr [g_101A4FD0]
    lea lea edi, [ebx + 0B8h]
    push push ebx
    call sub_100FCEE2
    and and dword ptr [ebp - 4], 0
    lea lea eax, [esi + 28]
    mov mov dword ptr [ebp - 12], ebx
    add add esp, 12
    sub sub dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + eax*4], edi
    mov mov eax, dword ptr [ebp - 8]
    push push dword ptr [eax - 28]
    push push edi
    call sub_100FE9A7
    push push eax
    call sub_100FA31D
    mov mov ecx, dword ptr [ebp - 12]
    lea lea edi, [edi + eax + 1]
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + eax], edi
    push push dword ptr [eax]
    push push edi
    call sub_100FE9C2
    push push eax
    call sub_100FA338
    add add dword ptr [ebp - 8], 4
    add add esp, 24
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 7
    lea lea edi, [edi + eax + 1]
    jb sub_100FECED
    lea lea eax, [ebx + 104]
    mov mov dword ptr [ebp - 4], eax
    lea lea eax, [esi + 56]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 16], 12
    jmp sub_100FED61
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax + ecx], edi
    push push dword ptr [eax]
    push push edi
    call sub_100FEA02
    push push eax
    call sub_100FA378
    lea lea edi, [edi + eax + 1]
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [eax], edi
    mov mov eax, dword ptr [ebp - 8]
    push push dword ptr [eax + 48]
    push push edi
    call sub_100FEA1D
    push push eax
    call sub_100FA393
    add add dword ptr [ebp - 8], 4
    add add dword ptr [ebp - 4], 4
    add add esp, 24
    dec dec dword ptr [ebp - 16]
    lea lea edi, [edi + eax + 1]
    jne sub_100FEDA4
    mov mov dword ptr [ebx + 098h], edi
    push push dword ptr [esi + 098h]
    push push edi
    call sub_100FEA49
    push push eax
    call sub_100FA3BF
    lea lea edi, [edi + eax + 1]
    mov mov dword ptr [ebx + 09Ch], edi
    push push dword ptr [esi + 09Ch]
    push push edi
    call sub_100FEA65
    push push eax
    call sub_100FA3DB
    lea lea edi, [edi + eax + 1]
    mov mov dword ptr [ebx + 0A0h], edi
    push push dword ptr [esi + 0A0h]
    push push edi
    call sub_100FEA81
    push push eax
    call sub_100FA3F7
    lea lea edi, [edi + eax + 1]
    mov mov dword ptr [ebx + 0A4h], edi
    push push dword ptr [esi + 0A4h]
    push push edi
    call L0
    push push eax
    call sub_100FA413
    lea lea eax, [edi + eax + 1]
    mov mov dword ptr [ebx + 0A8h], eax
    push push dword ptr [esi + 0A8h]
    push push eax
    call L1
    add add esp, 56
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    leave leave
    ret ret
__Gettnames ENDP
END
