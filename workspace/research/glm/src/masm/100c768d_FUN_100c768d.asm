.686
.MODEL FLAT, C
EXTRN sub_100C173B:PROC
EXTRN sub_100C175D:PROC
EXTRN sub_100C1778:PROC
EXTRN sub_100C1793:PROC
EXTRN sub_100C17AE:PROC
EXTRN sub_100C17C9:PROC
EXTRN sub_100C17E8:PROC
EXTRN sub_100C1807:PROC
EXTRN sub_100C3AAE:PROC
.CODE
FUN_100c768d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax]
    push esi
    push edi
    mov edi, eax
    mov edx, 0000FFFFFh
    and eax, 0FFF00000h
    and edi, edx
    cmp eax, 070300000h
    mov dword ptr [ebp - 8], ecx
    je L0
    xor eax, eax
    inc eax
    jmp L7
L0:
    mov eax, dword ptr [ecx + 0000000FCh]
    push ebx
    mov ebx, dword ptr [ecx + 000000100h]
    mov dword ptr [ebp - 4], eax
    push 2
    lea eax, [ebp - 24]
    push eax
    mov eax, edi
    and eax, edx
    push ebx
    or eax, 020500000h
    push eax
    call sub_100C3AAE
    mov ecx, dword ptr [ebp - 16]
    test ecx, ecx
    je L5
    and dword ptr [ebp - 12], 0
    test edi, edi
    jbe L2
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [ecx + 16]
    lea eax, [eax + edi*8]
L1:
    mov esi, dword ptr [eax]
    cmp esi, dword ptr [edx]
    jne L5
    inc dword ptr [ebp - 12]
    add eax, 4
    add edx, 4
    cmp dword ptr [ebp - 12], edi
    jb L1
L2:
    push dword ptr [ebp - 4]
    mov esi, dword ptr [ebx + 8]
    push ebx
    mov eax, edi
    mov edi, dword ptr [ecx + 8]
    shl eax, 2
    push ecx
    mov ecx, dword ptr [ebp - 8]
    lea edx, [eax + esi]
    add eax, edi
    push eax
    push edi
    push edx
    push esi
    mov dword ptr [ebp - 36], edx
    mov dword ptr [ebp - 28], eax
    call sub_100C173B
    test eax, eax
    jne L4
L3:
    xor eax, eax
    jmp L6
L4:
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 28]
    push edi
    push esi
    push dword ptr [ebp - 36]
    call sub_100C175D
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push edi
    push dword ptr [ebp - 28]
    push dword ptr [ebp - 36]
    push esi
    call sub_100C1778
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push edi
    push dword ptr [ebp - 28]
    push esi
    push dword ptr [ebp - 36]
    call sub_100C1793
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 36]
    push esi
    push dword ptr [ebp - 28]
    push edi
    call sub_100C17AE
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 36]
    push esi
    push edi
    push dword ptr [ebp - 28]
    call sub_100C17C9
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push esi
    push dword ptr [ebp - 36]
    push dword ptr [ebp - 28]
    push edi
    call sub_100C17E8
    test eax, eax
    je L3
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 16]
    push esi
    push dword ptr [ebp - 36]
    push edi
    push dword ptr [ebp - 28]
    call sub_100C1807
    jmp L6
L5:
    xor eax, eax
    inc eax
L6:
    pop ebx
L7:
    pop edi
    pop esi
    leave
    ret
FUN_100c768d ENDP
END
