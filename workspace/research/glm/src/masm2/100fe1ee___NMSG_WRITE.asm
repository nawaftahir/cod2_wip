.686
.MODEL FLAT, C
EXTRN sub_100F5EBC:PROC
EXTRN sub_100F8923:PROC
EXTRN sub_100FA2A6:PROC
EXTRN sub_100FA2B5:PROC
EXTRN sub_100FA2D5:PROC
EXTRN sub_100FA2E2:PROC
EXTRN sub_100FA348:PROC
EXTRN sub_100FE36A:PROC
EXTRN sub_100FE375:PROC
EXTRN sub_100FE386:PROC
EXTRN sub_100FE38F:PROC
EXTRN sub_100FE3BA:PROC
EXTRN sub_100FE47C:PROC
EXTRN sub_100FE929:PROC
EXTRN sub_100FE990:PROC
EXTRN sub_100FE9A7:PROC
EXTRN sub_100FE9B2:PROC
EXTRN sub_100FE9BE:PROC
EXTRN sub_10100EB9:PROC
EXTRN sub_101083B3:PROC
EXTRN EXTRN fp_1010C124:DWORD:DWORD
EXTRN EXTRN fp_1010C154:DWORD:DWORD
EXTRN EXTRN fp_1010C160:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101ADD88:DWORD:DWORD
EXTRN EXTRN g_101ADD8C:DWORD:DWORD
.CODE
__NMSG_WRITE PROC
    push push ebp
    lea lea ebp, [esp - 08Ch]
    sub sub esp, 010Ch
    mov mov eax, dword ptr [g_101A50D0]
    mov mov ecx, dword ptr [ebp + 094h]
    push push ebx
    push push esi
    mov mov dword ptr [ebp + 088h], eax
    xor xor edx, edx
    push push edi
    xor xor eax, eax
    cmp cmp ecx, dword ptr [eax*8 + 0101A4F10h]
    je L1
    inc inc eax
    cmp cmp eax, 19
    jb L0
    mov mov esi, eax
    shl shl esi, 3
    cmp cmp ecx, dword ptr [esi + 0101A4F10h]
    jne sub_100FE38F
    mov mov eax, dword ptr [g_101ADD88]
    cmp cmp eax, 1
    je sub_100FE375
    cmp cmp eax, edx
    jne L2
    cmp cmp dword ptr [g_101ADD8C], 1
    je sub_100FE386
    cmp cmp ecx, 0FCh
    je sub_100FE3BA
    push push 0104h
    lea lea eax, [ebp - 080h]
    push push eax
    push push edx
    mov mov byte ptr [ebp + 084h], dl
    call dword ptr [fp_1010C160]
    test test eax, eax
    jne L3
    lea lea eax, [ebp - 080h]
    push push 01017CDDCh
    push push eax
    call sub_100FE929
    pop pop ecx
    pop pop ecx
    lea lea edi, [ebp - 080h]
    mov mov eax, edi
    push push eax
    call sub_100FA2A6
    inc inc eax
    cmp cmp eax, 60
    pop pop ecx
    jbe sub_100FE36A
    mov mov eax, edi
    push push eax
    call sub_100FA2B5
    mov mov edi, eax
    lea lea eax, [ebp - 080h]
    sub sub eax, 59
L2:
    push push 3
    add add edi, eax
    push push 01017CDD8h
    push push edi
    call sub_100F5EBC
    add add esp, 16
    push push edi
    call sub_100FA2D5
    push push dword ptr [esi + 0101A4F14h]
    mov mov ebx, eax
    call sub_100FA2E2
    lea lea eax, [ebx + eax + 28]
    pop pop ecx
    add add eax, 3
    pop pop ecx
    and and eax, -4
    call sub_100F8923
    mov mov ebx, esp
    push push 01017CDBCh
    push push ebx
    call sub_100FE990
    push push edi
    push push ebx
    call sub_100FE9A7
    push push 01017CDB8h
    push push ebx
    call sub_100FE9B2
    push push dword ptr [esi + 0101A4F14h]
    push push ebx
    call sub_100FE9BE
    push push 012010h
    push push 01017CD90h
    push push ebx
    call sub_101083B3
    add add esp, 44
    jmp sub_100FE47C
    push push edx
    lea lea eax, [ebp + 094h]
    push push eax
    lea lea esi, [esi + 0101A4F14h]
    push push dword ptr [esi]
    call sub_100FA348
    pop pop ecx
    push push eax
    push push dword ptr [esi]
    push push -12
    call dword ptr [fp_1010C154]
    push push eax
    call dword ptr [fp_1010C124]
    lea lea esp, [ebp - 08Ch]
    mov mov ecx, dword ptr [ebp + 088h]
    call sub_10100EB9
    pop pop edi
    pop pop esi
    pop pop ebx
    add add ebp, 08Ch
    leave leave
    ret ret
__NMSG_WRITE ENDP
END
