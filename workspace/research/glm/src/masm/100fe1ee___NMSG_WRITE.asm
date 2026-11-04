.686
.MODEL FLAT, C
EXTRN sub_100F5EBC:PROC
EXTRN sub_100F8923:PROC
EXTRN sub_100FA2A6:PROC
EXTRN sub_100FA2B5:PROC
EXTRN sub_100FA2D5:PROC
EXTRN sub_100FA2E2:PROC
EXTRN sub_100FA348:PROC
EXTRN sub_100FE929:PROC
EXTRN sub_100FE990:PROC
EXTRN sub_100FE9A7:PROC
EXTRN sub_100FE9B2:PROC
EXTRN sub_100FE9BE:PROC
EXTRN sub_10100EB9:PROC
EXTRN sub_101083B3:PROC
EXTRN fp_1010C124:DWORD
EXTRN fp_1010C154:DWORD
EXTRN fp_1010C160:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101ADD88:DWORD
EXTRN g_101ADD8C:DWORD
.CODE
__NMSG_WRITE PROC
    push ebp
    lea ebp, [esp - 00000008Ch]
    sub esp, 00000010Ch
    mov eax, dword ptr [g_101A50D0]
    mov ecx, dword ptr [ebp + 000000094h]
    push ebx
    push esi
    mov dword ptr [ebp + 000000088h], eax
    xor edx, edx
    push edi
    xor eax, eax
L0:
    cmp ecx, dword ptr [eax*8 + 0101A4F10h]
    je L1
    inc eax
    cmp eax, 19
    jb L0
L1:
    mov esi, eax
    shl esi, 3
    cmp ecx, dword ptr [esi + 0101A4F10h]
    jne L6
    mov eax, dword ptr [g_101ADD88]
    cmp eax, 1
    je L5
    cmp eax, edx
    jne L2
    cmp dword ptr [g_101ADD8C], 1
    je L5
L2:
    cmp ecx, 0000000FCh
    je L6
    push 000000104h
    lea eax, [ebp - 000000080h]
    push eax
    push edx
    mov byte ptr [ebp + 000000084h], dl
    call dword ptr [fp_1010C160]
    test eax, eax
    jne L3
    lea eax, [ebp - 000000080h]
    push 01017CDDCh
    push eax
    call sub_100FE929
    pop ecx
    pop ecx
L3:
    lea edi, [ebp - 000000080h]
    mov eax, edi
    push eax
    call sub_100FA2A6
    inc eax
    cmp eax, 60
    pop ecx
    jbe L4
    mov eax, edi
    push eax
    call sub_100FA2B5
    mov edi, eax
    lea eax, [ebp - 000000080h]
    sub eax, 59
    push 3
    add edi, eax
    push 01017CDD8h
    push edi
    call sub_100F5EBC
    add esp, 16
L4:
    push edi
    call sub_100FA2D5
    push dword ptr [esi + 0101A4F14h]
    mov ebx, eax
    call sub_100FA2E2
    lea eax, [ebx + eax + 28]
    pop ecx
    add eax, 3
    pop ecx
    and eax, 0FFFFFFFCh
    call sub_100F8923
    mov ebx, esp
    push 01017CDBCh
    push ebx
    call sub_100FE990
    push edi
    push ebx
    call sub_100FE9A7
    push 01017CDB8h
    push ebx
    call sub_100FE9B2
    push dword ptr [esi + 0101A4F14h]
    push ebx
    call sub_100FE9BE
    push 000012010h
    push 01017CD90h
    push ebx
    call sub_101083B3
    add esp, 44
    jmp L6
L5:
    push edx
    lea eax, [ebp + 000000094h]
    push eax
    lea esi, [esi + 0101A4F14h]
    push dword ptr [esi]
    call sub_100FA348
    pop ecx
    push eax
    push dword ptr [esi]
    push -12
    call dword ptr [fp_1010C154]
    push eax
    call dword ptr [fp_1010C124]
L6:
    lea esp, [ebp - 00000008Ch]
    mov ecx, dword ptr [ebp + 000000088h]
    call sub_10100EB9
    pop edi
    pop esi
    pop ebx
    add ebp, 00000008Ch
    leave
    ret
__NMSG_WRITE ENDP
END
