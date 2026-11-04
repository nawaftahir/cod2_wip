.686
.MODEL FLAT, C
EXTRN sub_10014876:PROC
EXTRN sub_10026070:PROC
EXTRN sub_100262DC:PROC
EXTRN sub_1002636E:PROC
EXTRN sub_100265E9:PROC
EXTRN sub_100265EE:PROC
EXTRN sub_100265F0:PROC
EXTRN sub_10026620:PROC
EXTRN sub_10026621:PROC
EXTRN sub_10026623:PROC
EXTRN sub_10026634:PROC
EXTRN sub_10026673:PROC
EXTRN sub_100266A5:PROC
EXTRN sub_100266FF:PROC
EXTRN sub_10026773:PROC
EXTRN sub_10026776:PROC
EXTRN sub_100267A0:PROC
EXTRN sub_100267EB:PROC
EXTRN sub_10060D08:PROC
EXTRN sub_10060D40:PROC
EXTRN sub_10060D59:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN fp_101D4AD4:DWORD:DWORD
EXTRN EXTRN fp_101D4AD8:DWORD:DWORD
EXTRN EXTRN fp_101D4B10:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1076A834:DWORD:DWORD
.CODE
FUN_100263a0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 0104h
    mov mov eax, dword ptr [ebp + 8]
    sub sub eax, 0
    push push ebx
    push push esi
    push push edi
    je L1
    dec dec eax
    jne sub_100265EE
    mov mov ebx, 010196F04h
    jmp L2
    mov mov ebx, 010196F08h
    push push 1
L0:
    mov mov edi, 010196EF8h
    call dword ptr [fp_101D4AD8]
    add add esp, 4
    mov mov esi, eax
L1:
    mov mov ecx, 10
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    call sub_100262DC
    pop pop edi
    pop pop esi
    pop pop ebx
L2:
    mov mov esp, ebp
    pop pop ebp
    ret ret
    push push 1
    mov mov edi, 010196EECh
    call dword ptr [fp_101D4AD8]
    add add esp, 4
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    call dword ptr [fp_101D4AD4]
    cmp cmp eax, 3
    jne L5
    push push 2
    call dword ptr [fp_101D4AD8]
    mov mov cl, byte ptr [eax]
    add add esp, 4
    test test cl, cl
    je L6
    push push 2
    call dword ptr [fp_101D4AD8]
    add add esp, 4
    call L0
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    push push 1
    mov mov edi, 010196EE4h
    call dword ptr [fp_101D4AD8]
    add add esp, 4
    mov mov esi, eax
    xor xor eax, eax
    mov mov ecx, 7
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov mov edx, eax
    sete sete dl
    mov mov esi, edx
    mov mov dword ptr [esp + 12], esi
    call dword ptr [fp_101D4AD4]
    cmp cmp eax, 2
    jne L7
    test test esi, esi
    jne L8
    push push ebx
    push push 1
    call dword ptr [fp_101D4AD8]
    add add esp, 4
    push push eax
    push push 010196ED0h
    mov mov esi, 0100h
    lea lea edi, [esp + 28]
    call sub_10060D08
    add add esp, 12
    jmp sub_10026634
    mov mov eax, dword ptr [g_1076A834]
    cmp cmp eax, 0270Fh
    jg sub_10026623
    lea lea esp, [esp]
    test test eax, eax
    jl sub_100265E9
    cmp cmp eax, 0270Fh
    jg sub_100265F0
    push push ebx
    push push eax
    push push 010197054h
    mov mov esi, 0100h
    lea lea edi, [esp + 28]
    call sub_10060D40
    add add esp, 12
    jmp sub_10026621
    push push ebx
    push push 01019706Ch
    mov mov esi, 0100h
    lea lea edi, [esp + 24]
    call sub_10060D59
    add add esp, 8
    lea lea eax, [esp + 16]
    push push eax
    call dword ptr [fp_101D4B10]
    add add esp, 4
    test test eax, eax
    mov mov eax, dword ptr [g_1076A834]
    je sub_10026673
    inc inc eax
    cmp cmp eax, 0270Fh
    mov mov dword ptr [g_1076A834], eax
    jle sub_10026620
    cmp cmp eax, 0270Fh
    jl sub_100266A5
    push push 010196EACh
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    inc inc eax
    mov mov dword ptr [g_1076A834], eax
    mov mov eax, dword ptr [ebp + 8]
    sub sub eax, 0
    je sub_100266FF
    dec dec eax
    jne sub_10026773
    mov mov edx, dword ptr [g_101D4C6C]
    mov mov ebx, dword ptr [g_101D4C70]
    lea lea ecx, [esp + 16]
    push push ecx
    push push edx
    push push 0
    push push 0
    call sub_1002636E
    add add esp, 16
    jmp sub_10026776
    mov mov eax, dword ptr [g_101D4C6C]
    mov mov edi, dword ptr [g_101D4C70]
    mov mov ebx, eax
    imul imul eax, edi
    lea lea eax, [eax + eax*2]
    push push eax
    call dword ptr [fp_101D49DC]
    add add esp, 4
    mov mov esi, eax
    push push esi
    push push 3
    push push edi
    push push ebx
    xor xor ecx, ecx
    xor xor eax, eax
    call sub_10026070
    add add esp, 16
    test test al, al
    je sub_100267A0
    push push esi
    push push edi
    push push ebx
    lea lea ecx, [esp + 28]
    push push 90
    push push ecx
    call sub_10014876
    add add esp, 20
    push push esi
    call dword ptr [fp_101D49E0]
    add add esp, 4
    mov mov eax, dword ptr [esp + 12]
    test test eax, eax
    jne sub_100267EB
    lea lea edx, [esp + 16]
    push push edx
    push push 010196F14h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_100263a0 ENDP
END
