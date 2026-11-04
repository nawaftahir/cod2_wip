.686
.MODEL FLAT, C
EXTRN sub_10014876:PROC
EXTRN sub_10026070:PROC
EXTRN sub_100262DC:PROC
EXTRN sub_1002636E:PROC
EXTRN sub_100263CC:PROC
EXTRN sub_10060D08:PROC
EXTRN sub_10060D40:PROC
EXTRN sub_10060D59:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN fp_101D4AD4:DWORD
EXTRN fp_101D4AD8:DWORD
EXTRN fp_101D4B10:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1076A834:DWORD
.CODE
FUN_100263a0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 000000104h
    mov eax, dword ptr [ebp + 8]
    sub eax, 0
    push ebx
    push esi
    push edi
    je L0
    dec eax
    jne L15
    mov ebx, 010196F04h
    jmp L1
L0:
    mov ebx, 010196F08h
L1:
    push 1
    mov edi, 010196EF8h
    call dword ptr [fp_101D4AD8]
    add esp, 4
    mov esi, eax
    mov ecx, 10
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    call sub_100262DC
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L2:
    push 1
    mov edi, 010196EECh
    call dword ptr [fp_101D4AD8]
    add esp, 4
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    call dword ptr [fp_101D4AD4]
    cmp eax, 3
    jne L3
    push 2
    call dword ptr [fp_101D4AD8]
    mov cl, byte ptr [eax]
    add esp, 4
    test cl, cl
    je L3
    push 2
    call dword ptr [fp_101D4AD8]
    add esp, 4
    call sub_100263CC
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L3:
    push 1
    mov edi, 010196EE4h
    call dword ptr [fp_101D4AD8]
    add esp, 4
    mov esi, eax
    xor eax, eax
    mov ecx, 7
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov edx, eax
    sete dl
    mov esi, edx
    mov dword ptr [esp + 12], esi
    call dword ptr [fp_101D4AD4]
    cmp eax, 2
    jne L4
    test esi, esi
    jne L4
    push ebx
    push 1
    call dword ptr [fp_101D4AD8]
    add esp, 4
    push eax
    push 010196ED0h
    mov esi, 000000100h
    lea edi, [esp + 28]
    call sub_10060D08
    add esp, 12
    jmp L11
L4:
    mov eax, dword ptr [g_1076A834]
    cmp eax, 00000270Fh
    jg L9
    lea esp, [esp]
L5:
    test eax, eax
    jl L6
    cmp eax, 00000270Fh
    jg L6
    push ebx
    push eax
    push 010197054h
    mov esi, 000000100h
    lea edi, [esp + 28]
    call sub_10060D40
    add esp, 12
    jmp L7
L6:
    push ebx
    push 01019706Ch
    mov esi, 000000100h
    lea edi, [esp + 24]
    call sub_10060D59
    add esp, 8
L7:
    lea eax, [esp + 16]
    push eax
    call dword ptr [fp_101D4B10]
    add esp, 4
    test eax, eax
    mov eax, dword ptr [g_1076A834]
    je L8
    inc eax
    cmp eax, 00000270Fh
    mov dword ptr [g_1076A834], eax
    jle L5
L8:
    cmp eax, 00000270Fh
    jl L10
L9:
    push 010196EACh
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L10:
    inc eax
    mov dword ptr [g_1076A834], eax
L11:
    mov eax, dword ptr [ebp + 8]
    sub eax, 0
    je L12
    dec eax
    jne L15
    mov edx, dword ptr [g_101D4C6C]
    mov ebx, dword ptr [g_101D4C70]
    lea ecx, [esp + 16]
    push ecx
    push edx
    push 0
    push 0
    call sub_1002636E
    add esp, 16
    jmp L14
L12:
    mov eax, dword ptr [g_101D4C6C]
    mov edi, dword ptr [g_101D4C70]
    mov ebx, eax
    imul eax, edi
    lea eax, [eax + eax*2]
    push eax
    call dword ptr [fp_101D49DC]
    add esp, 4
    mov esi, eax
    push esi
    push 3
    push edi
    push ebx
    xor ecx, ecx
    xor eax, eax
    call sub_10026070
    add esp, 16
    test al, al
    je L13
    push esi
    push edi
    push ebx
    lea ecx, [esp + 28]
    push 90
    push ecx
    call sub_10014876
    add esp, 20
L13:
    push esi
    call dword ptr [fp_101D49E0]
    add esp, 4
L14:
    mov eax, dword ptr [esp + 12]
    test eax, eax
    jne L15
    lea edx, [esp + 16]
    push edx
    push 010196F14h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
L15:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_100263a0 ENDP
END
