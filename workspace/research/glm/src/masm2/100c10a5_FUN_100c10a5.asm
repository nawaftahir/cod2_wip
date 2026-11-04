.686
.MODEL FLAT, C
EXTRN sub_1006C596:PROC
EXTRN sub_1006C5C2:PROC
EXTRN sub_100C127D:PROC
EXTRN sub_100C1288:PROC
EXTRN sub_100C1290:PROC
EXTRN sub_100C12C5:PROC
EXTRN sub_100C12E2:PROC
EXTRN sub_100C1337:PROC
EXTRN sub_100C1338:PROC
EXTRN sub_100C1348:PROC
EXTRN sub_100C1358:PROC
EXTRN sub_100C1360:PROC
EXTRN sub_100C137A:PROC
EXTRN sub_100C1398:PROC
EXTRN sub_100C1399:PROC
EXTRN sub_100C13C8:PROC
EXTRN sub_100C13F2:PROC
EXTRN sub_100C13F6:PROC
EXTRN sub_100C1428:PROC
.CODE
FUN_100c10a5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi]
    push push 0
    push push ebx
    call call dword ptr [eax + 32]
    test test eax, eax
    jne L6
    and and dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebx + 12]
    or or dword ptr [ebp + 8], -1
    test test eax, eax
    jbe L0
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ecx]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov edx, dword ptr [eax + 76]
    cmp cmp dword ptr [ebp - 4], edx
    jae L1
    mov mov dword ptr [ebp - 4], edx
    mov mov eax, dword ptr [eax + 72]
    cmp cmp dword ptr [ebp + 8], eax
    jbe L3
    mov mov dword ptr [ebp + 8], eax
    add add ecx, 4
    dec dec dword ptr [ebp - 16]
    jne L2
    mov mov eax, dword ptr [ebx + 4]
    test test eax, eax
    jbe L7
    mov mov ecx, dword ptr [ebx + 8]
    mov mov dword ptr [ebp - 16], ecx
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    test test byte ptr [ecx + 4], 2
    je L9
    mov mov ecx, dword ptr [eax + 72]
    cmp cmp ecx, -1
    je L12
    inc inc ecx
    cmp cmp dword ptr [ebp - 4], ecx
    jae L10
    mov mov dword ptr [ebp - 4], ecx
L3:
    jmp L11
    cmp cmp ecx, -1
    je L14
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 16], edx
    jbe L15
    mov mov edi, dword ptr [esi + 24]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [ebp + 12]
    cmp cmp dword ptr [edi + edx*4], ecx
    je L5
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 16]
    jb L4
    cmp cmp edx, dword ptr [ebp + 16]
    jae sub_100C1288
    mov mov ecx, dword ptr [edi + edx*4]
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ecx + 12], 0
    jbe L16
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [edx]
    mov mov edx, dword ptr [esi + 20]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edx, dword ptr [eax + 16]
    cmp cmp edx, dword ptr [edi + 16]
    je sub_100C1290
    inc inc dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 8]
    add add dword ptr [ebp - 12], 4
    cmp cmp edx, dword ptr [ecx + 12]
    jb sub_100C127D
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp edx, dword ptr [ecx + 12]
    jae sub_100C12C5
    mov mov eax, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + 80]
    cmp cmp dword ptr [ebp + 8], ecx
    jae L13
    jmp sub_100C12E2
    mov mov eax, dword ptr [eax + 80]
    dec dec eax
    mov mov dword ptr [ebp + 8], eax
    add add dword ptr [ebp - 16], 4
    dec dec dword ptr [ebp - 20]
    jne L8
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 16], eax
    jbe sub_100C1337
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [edx + 72]
    cmp cmp edi, dword ptr [ebp - 4]
    jb sub_100C1348
    cmp cmp edi, dword ptr [ebp + 8]
    jbe sub_100C1358
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 16]
    jb sub_100C1338
    jmp sub_100C1360
    mov mov edi, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebp + 16]
    je sub_100C137A
    mov mov eax, dword ptr [esi]
    push push edi
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 52]
    test test eax, eax
    je sub_100C1399
    test test ebx, ebx
    je sub_100C1398
    push push 1
    mov mov ecx, ebx
    call sub_1006C596
    xor xor eax, eax
L5:
    inc inc eax
    jmp sub_100C13F6
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 16], eax
    jbe sub_100C13C8
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx], 0
    inc inc eax
L7:
    cmp cmp eax, dword ptr [ebp + 16]
    jb sub_100C13C8
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + edi*4]
    test test ecx, ecx
    je sub_100C13F2
    push push 1
    call sub_1006C5C2
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [eax + edi*4], ebx
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], eax
    jbe sub_100C1428
    mov mov ecx, dword ptr [ebx + 16]
L12:
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
L14:
    inc inc eax
    mov mov dword ptr [ecx + 72], edi
    cmp cmp eax, dword ptr [ebx + 12]
L15:
    jb sub_100C1428
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
L16:
    ret ret 12
FUN_100c10a5 ENDP
END
