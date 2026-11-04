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
EXTRN sub_100FEA9D:PROC
EXTRN sub_100FEAB9:PROC
EXTRN g_101A4FD0:DWORD
.CODE
__Gettnames PROC
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    push esi
    mov esi, dword ptr [g_101A4FD0]
    push edi
    xor edi, edi
    mov dword ptr [ebp - 4], edi
L0:
    mov ebx, dword ptr [ebp - 4]
    shl ebx, 2
    push dword ptr [ebx + esi + 28]
    call sub_100FA223
    push dword ptr [ebx + esi]
    mov dword ptr [ebp - 16], eax
    call sub_100FA22E
    add eax, edi
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 7
    pop ecx
    pop ecx
    mov ecx, dword ptr [ebp - 16]
    lea edi, [eax + ecx + 2]
    jb L0
    lea eax, [esi + 56]
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 8], 12
L1:
    mov ebx, dword ptr [ebp - 12]
    push dword ptr [ebx + 48]
    call sub_100FA25A
    push dword ptr [ebx]
    mov dword ptr [ebp - 16], eax
    call sub_100FA264
    add dword ptr [ebp - 12], 4
    pop ecx
    pop ecx
    mov ecx, dword ptr [ebp - 16]
    add eax, edi
    dec dword ptr [ebp - 8]
    lea edi, [eax + ecx + 2]
    jne L1
    push dword ptr [esi + 000000098h]
    call sub_100FA283
    push dword ptr [esi + 00000009Ch]
    mov ebx, eax
    call sub_100FA290
    push dword ptr [esi + 0000000A0h]
    add eax, edi
    lea edi, [eax + ebx + 2]
    call sub_100FA2A1
    push dword ptr [esi + 0000000A4h]
    lea edi, [edi + eax + 1]
    call sub_100FA2B0
    push dword ptr [esi + 0000000A8h]
    lea edi, [edi + eax + 1]
    call sub_100FA2BF
    lea eax, [edi + eax + 1]
    add eax, 0000000B8h
    push eax
    call sub_100FC532
    mov ebx, eax
    add esp, 24
    test ebx, ebx
    je L5
    push 0000000B8h
    push dword ptr [g_101A4FD0]
    lea edi, [ebx + 0000000B8h]
    push ebx
    call sub_100FCEE2
    and dword ptr [ebp - 4], 0
    lea eax, [esi + 28]
    mov dword ptr [ebp - 12], ebx
    add esp, 12
    sub dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 8], eax
L2:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + eax*4], edi
    mov eax, dword ptr [ebp - 8]
    push dword ptr [eax - 28]
    push edi
    call sub_100FE9A7
    push eax
    call sub_100FA31D
    mov ecx, dword ptr [ebp - 12]
    lea edi, [edi + eax + 1]
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ecx + eax], edi
    push dword ptr [eax]
    push edi
    call sub_100FE9C2
    push eax
    call sub_100FA338
    add dword ptr [ebp - 8], 4
    add esp, 24
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 7
    lea edi, [edi + eax + 1]
    jb L2
    lea eax, [ebx + 104]
    mov dword ptr [ebp - 4], eax
    lea eax, [esi + 56]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 16], 12
    jmp L4
L3:
    mov eax, dword ptr [ebp - 8]
L4:
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax + ecx], edi
    push dword ptr [eax]
    push edi
    call sub_100FEA02
    push eax
    call sub_100FA378
    lea edi, [edi + eax + 1]
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [eax], edi
    mov eax, dword ptr [ebp - 8]
    push dword ptr [eax + 48]
    push edi
    call sub_100FEA1D
    push eax
    call sub_100FA393
    add dword ptr [ebp - 8], 4
    add dword ptr [ebp - 4], 4
    add esp, 24
    dec dword ptr [ebp - 16]
    lea edi, [edi + eax + 1]
    jne L3
    mov dword ptr [ebx + 000000098h], edi
    push dword ptr [esi + 000000098h]
    push edi
    call sub_100FEA49
    push eax
    call sub_100FA3BF
    lea edi, [edi + eax + 1]
    mov dword ptr [ebx + 00000009Ch], edi
    push dword ptr [esi + 00000009Ch]
    push edi
    call sub_100FEA65
    push eax
    call sub_100FA3DB
    lea edi, [edi + eax + 1]
    mov dword ptr [ebx + 0000000A0h], edi
    push dword ptr [esi + 0000000A0h]
    push edi
    call sub_100FEA81
    push eax
    call sub_100FA3F7
    lea edi, [edi + eax + 1]
    mov dword ptr [ebx + 0000000A4h], edi
    push dword ptr [esi + 0000000A4h]
    push edi
    call sub_100FEA9D
    push eax
    call sub_100FA413
    lea eax, [edi + eax + 1]
    mov dword ptr [ebx + 0000000A8h], eax
    push dword ptr [esi + 0000000A8h]
    push eax
    call sub_100FEAB9
    add esp, 56
L5:
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    leave
    ret
__Gettnames ENDP
END
