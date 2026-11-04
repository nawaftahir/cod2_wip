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
.CODE
FUN_100a2010 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    xor esi, esi
    cmp eax, esi
    push edi
    mov dword ptr [ebp - 8], ecx
    je L0
    cmp dword ptr [ebp + 12], esi
    je L0
    lea edi, [eax + 16]
    lea eax, [ebp - 24]
    push eax
    push 2
    push dword ptr [edi + 8]
    mov dword ptr [ebp - 12], edi
    call sub_100637A6
    test eax, eax
    jge L2
    push dword ptr [edi + 8]
    push 01011589Ch
    push 000000BE1h
    push edi
    push dword ptr [ebp - 8]
    call sub_10099527
    add esp, 20
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
L2:
    mov eax, dword ptr [ebp - 20]
    mov ecx, 0FFFF0000h
    and eax, ecx
    cmp eax, 0FFFE0000h
    je L3
    cmp eax, ecx
    jne L5
    xor eax, eax
    cmp dword ptr [ebp + 20], esi
    setne al
    lea eax, [eax + eax + 25]
    jmp L4
L3:
    xor eax, eax
    cmp dword ptr [ebp + 20], esi
    setne al
    lea eax, [eax + eax + 26]
L4:
    mov dword ptr [ebp + 20], eax
L5:
    push 80
    call sub_100650FD
    cmp eax, esi
    je L6
    push edi
    push 1
    push esi
    push esi
    push 27
    push esi
    mov ecx, eax
    call sub_100832F7
    mov ebx, eax
    mov dword ptr [ebp - 4], ebx
    jmp L7
L6:
    mov dword ptr [ebp - 4], esi
    mov ebx, esi
L7:
    cmp ebx, esi
    je L0
    push 36
    call sub_10065127
    cmp eax, esi
    mov edi, 000000200h
    je L8
    push edi
    push 1
    push 1
    push dword ptr [ebp + 20]
    mov ecx, eax
    push 3
    call sub_10082F09
    jmp L9
L8:
    xor eax, eax
L9:
    cmp eax, esi
    mov dword ptr [ebx + 16], eax
    je L0
    push dword ptr [ebp + 8]
    call sub_10082900
    cmp eax, esi
    mov dword ptr [ebx + 32], eax
    je L0
    mov ecx, dword ptr [ebp - 8]
    push 1
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    call sub_100A1CFD
    cmp eax, esi
    mov dword ptr [ebx + 36], eax
    je L0
    push 80
    call sub_10065185
    cmp eax, esi
    je L10
    push dword ptr [ebp - 12]
    mov ecx, eax
    push 1
    push esi
    push esi
    push esi
    push esi
    call sub_10083380
    mov ebx, eax
    jmp L11
L10:
    xor ebx, ebx
L11:
    cmp ebx, esi
    je L0
    push 36
    call sub_100651AE
    cmp eax, esi
    je L12
    push edi
    push 1
    push 1
    push dword ptr [ebp + 20]
    mov ecx, eax
    push 3
    call sub_10082F8B
    jmp L13
L12:
    xor eax, eax
L13:
    cmp eax, esi
    mov dword ptr [ebx + 16], eax
    je L0
    push 20
    call sub_100651D9
    cmp eax, esi
    je L14
    push 010114AE8h
    push esi
    push esi
    mov ecx, eax
    call sub_100829EF
    jmp L15
L14:
    xor eax, eax
L15:
    cmp eax, esi
    mov dword ptr [ebx + 32], eax
    je L0
    push 64
    call sub_10065201
    cmp eax, esi
    je L16
    push dword ptr [ebp - 12]
    mov ecx, eax
    push dword ptr [ebp - 4]
    push 4
    call sub_100835B3
    jmp L17
L16:
    xor eax, eax
L17:
    cmp eax, esi
    mov ecx, dword ptr [ebx + 32]
    mov dword ptr [ecx + 8], eax
    je L0
    mov ecx, dword ptr [ebp - 8]
    push ebx
    call sub_1009A729
    mov eax, ebx
    jmp L1
FUN_100a2010 ENDP
END
