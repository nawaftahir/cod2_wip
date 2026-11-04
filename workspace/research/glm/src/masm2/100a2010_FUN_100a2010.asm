.686
.MODEL FLAT, C
EXTRN sub_100637A6:PROC
EXTRN sub_100650FD:PROC
EXTRN sub_10065127:PROC
EXTRN sub_10065185:PROC
EXTRN sub_100651AE:PROC
EXTRN sub_100651D9:PROC
EXTRN sub_10065201:PROC
EXTRN sub_10082900:PROC
EXTRN sub_100829EF:PROC
EXTRN sub_10082F09:PROC
EXTRN sub_10082F8B:PROC
EXTRN sub_100832F7:PROC
EXTRN sub_10083380:PROC
EXTRN sub_100835B3:PROC
EXTRN sub_10099527:PROC
EXTRN sub_1009A729:PROC
EXTRN sub_100A1CFD:PROC
EXTRN sub_100A21E9:PROC
EXTRN sub_100A2215:PROC
EXTRN sub_100A2227:PROC
EXTRN sub_100A225A:PROC
EXTRN sub_100A2270:PROC
EXTRN sub_100A22AB:PROC
EXTRN sub_100A22C0:PROC
EXTRN sub_100A22FE:PROC
EXTRN sub_100A2310:PROC
EXTRN sub_100A234F:PROC
EXTRN sub_100A2362:PROC
.CODE
FUN_100a2010 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp eax, esi
    push push edi
    mov mov dword ptr [ebp - 8], ecx
    je L0
    cmp cmp dword ptr [ebp + 12], esi
    je L1
    lea lea edi, [eax + 16]
    lea lea eax, [ebp - 24]
    push push eax
    push push 2
    push push dword ptr [edi + 8]
    mov mov dword ptr [ebp - 12], edi
    call sub_100637A6
    test test eax, eax
    jge L2
    push push dword ptr [edi + 8]
    push push 01011589Ch
    push push 0BE1h
    push push edi
    push push dword ptr [ebp - 8]
    call sub_10099527
    add add esp, 20
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
    mov mov eax, dword ptr [ebp - 20]
    mov mov ecx, 0FFFF0000h
    and and eax, ecx
    cmp cmp eax, 0FFFE0000h
    je L3
    cmp cmp eax, ecx
L1:
    jne L4
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 20], esi
    setne setne al
    lea lea eax, [eax + eax + 25]
    jmp L5
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 20], esi
    setne setne al
    lea lea eax, [eax + eax + 26]
    mov mov dword ptr [ebp + 20], eax
    push push 80
L2:
    call sub_100650FD
    cmp cmp eax, esi
    je L8
    push push edi
    push push 1
    push push esi
    push push esi
    push push 27
    push push esi
    mov mov ecx, eax
    call sub_100832F7
    mov mov ebx, eax
    mov mov dword ptr [ebp - 4], ebx
    jmp L10
    mov mov dword ptr [ebp - 4], esi
    mov mov ebx, esi
    cmp cmp ebx, esi
    je L6
    push push 36
    call sub_10065127
    cmp cmp eax, esi
    mov mov edi, 0200h
    je L13
    push push edi
    push push 1
    push push 1
    push push dword ptr [ebp + 20]
    mov mov ecx, eax
    push push 3
    call sub_10082F09
    jmp L14
    xor xor eax, eax
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 16], eax
    je L7
    push push dword ptr [ebp + 8]
    call sub_10082900
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 32], eax
    je L9
    mov mov ecx, dword ptr [ebp - 8]
    push push 1
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    call sub_100A1CFD
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 36], eax
    je L11
    push push 80
    call sub_10065185
    cmp cmp eax, esi
    je sub_100A225A
    push push dword ptr [ebp - 12]
    mov mov ecx, eax
    push push 1
    push push esi
    push push esi
    push push esi
    push push esi
    call sub_10083380
    mov mov ebx, eax
    jmp sub_100A2270
L7:
    xor xor ebx, ebx
    cmp cmp ebx, esi
    je L12
    push push 36
    call sub_100651AE
    cmp cmp eax, esi
L9:
    je sub_100A22AB
    push push edi
    push push 1
    push push 1
    push push dword ptr [ebp + 20]
    mov mov ecx, eax
    push push 3
    call sub_10082F8B
    jmp sub_100A22C0
L10:
    xor xor eax, eax
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 16], eax
    je L15
    push push 20
    call sub_100651D9
    cmp cmp eax, esi
    je sub_100A22FE
    push push 010114AE8h
    push push esi
    push push esi
    mov mov ecx, eax
    call sub_100829EF
    jmp sub_100A2310
    xor xor eax, eax
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 32], eax
L12:
    je sub_100A21E9
    push push 64
    call sub_10065201
    cmp cmp eax, esi
    je sub_100A234F
L13:
    push push dword ptr [ebp - 12]
    mov mov ecx, eax
    push push dword ptr [ebp - 4]
    push push 4
    call sub_100835B3
    jmp sub_100A2362
    xor xor eax, eax
    cmp cmp eax, esi
L14:
    mov mov ecx, dword ptr [ebx + 32]
    mov mov dword ptr [ecx + 8], eax
    je sub_100A2215
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    call sub_1009A729
    mov mov eax, ebx
    jmp sub_100A2227
FUN_100a2010 ENDP
END
