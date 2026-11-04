.686
.MODEL FLAT, C
EXTRN sub_1004BA77:PROC
EXTRN sub_1004BFDB:PROC
EXTRN sub_1004C4F3:PROC
EXTRN sub_1004D072:PROC
EXTRN sub_1004DCCA:PROC
EXTRN sub_1004F984:PROC
EXTRN sub_1004F9F1:PROC
EXTRN sub_1004FC28:PROC
EXTRN sub_1004FE79:PROC
EXTRN sub_1004FEA0:PROC
EXTRN sub_1004FEA3:PROC
EXTRN sub_1004FEAF:PROC
EXTRN sub_1004FED3:PROC
EXTRN sub_1004FEE1:PROC
EXTRN sub_1004FF1F:PROC
EXTRN sub_1004FF9A:PROC
EXTRN sub_1004FFAD:PROC
EXTRN sub_1004FFB2:PROC
EXTRN sub_1004FFBD:PROC
EXTRN sub_100506AE:PROC
EXTRN sub_1005142B:PROC
EXTRN sub_1005172B:PROC
EXTRN sub_10051CE0:PROC
EXTRN sub_1005659B:PROC
EXTRN sub_100578D3:PROC
.CODE
FUN_1004fc90 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov ebp, dword ptr [esi + 0188h]
    call sub_1004F9F1
    mov mov eax, esi
    call sub_1004FC28
    xor xor ebx, ebx
    mov mov edx, esi
    mov mov dword ptr [ebp + 12], ebx
    call sub_1004F984
    mov mov byte ptr [ebp + 16], al
    mov mov dword ptr [ebp + 20], ebx
    mov mov dword ptr [ebp + 24], ebx
    mov mov al, byte ptr [esi + 82]
    cmp cmp al, bl
    je L0
    cmp cmp byte ptr [esi + 72], bl
    jne L1
    mov mov byte ptr [esi + 96], bl
    mov mov byte ptr [esi + 97], bl
    mov mov byte ptr [esi + 98], bl
    cmp cmp al, bl
    je L3
    cmp cmp byte ptr [esi + 73], bl
    je L2
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 47
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    cmp cmp dword ptr [esi + 108], 3
    je L5
    mov mov byte ptr [esi + 97], bl
    mov mov byte ptr [esi + 98], bl
    mov mov dword ptr [esi + 124], ebx
    mov mov byte ptr [esi + 96], 1
    cmp cmp byte ptr [esi + 96], bl
    je L4
    mov mov eax, esi
    call sub_1005659B
L1:
    mov mov edx, dword ptr [esi + 01B0h]
    mov mov dword ptr [ebp + 20], edx
    cmp cmp byte ptr [esi + 98], bl
    jne L6
    cmp cmp byte ptr [esi + 97], bl
    je L7
    call sub_100578D3
    mov mov eax, dword ptr [esi + 01B0h]
    mov mov dword ptr [ebp + 24], eax
    cmp cmp byte ptr [esi + 73], bl
    push push edi
    jne L12
    cmp cmp byte ptr [ebp + 16], bl
    je L10
L2:
    mov mov edi, esi
    call sub_100506AE
    jmp L12
    cmp cmp dword ptr [esi + 124], ebx
    je L11
    mov mov byte ptr [esi + 97], 1
    jmp L7
    cmp cmp byte ptr [esi + 88], bl
    je L8
    mov mov byte ptr [esi + 98], 1
    jmp L9
    call sub_1004BFDB
    call sub_10051CE0
    xor xor ecx, ecx
    mov mov cl, byte ptr [esi + 98]
    push push ecx
    call sub_1005172B
    add add esp, 4
    call sub_1004C4F3
    cmp cmp byte ptr [esi + 0D1h], bl
    je sub_1004FE79
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 1
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    jmp sub_1004FEA0
    cmp cmp byte ptr [esi + 0D0h], bl
    je sub_1004FEA3
    call sub_1005142B
    jmp sub_1004FEAF
    call sub_1004D072
L5:
    mov mov ecx, dword ptr [esi + 0198h]
    cmp cmp byte ptr [ecx + 16], bl
    jne sub_1004FED3
    cmp cmp byte ptr [esi + 72], bl
    mov mov byte ptr [esp + 16], bl
    je sub_1004FEE1
    mov mov byte ptr [esp + 16], 1
L8:
    mov mov edx, dword ptr [esp + 16]
    push push edx
    mov mov edi, esi
    call sub_1004BA77
    mov mov al, byte ptr [esi + 73]
    add add esp, 4
    cmp cmp al, bl
    pop pop edi
    jne sub_1004FF1F
    push push ebx
    mov mov eax, esi
    call sub_1004DCCA
    add add esp, 4
    mov mov eax, dword ptr [esi + 4]
    push push esi
    call call dword ptr [eax + 24]
    mov mov ecx, dword ptr [esi + 0198h]
    push push esi
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esi + 8]
    add add esp, 8
    cmp cmp ecx, ebx
    je sub_1004FFAD
    cmp cmp byte ptr [esi + 72], bl
    jne sub_1004FFB2
L10:
    mov mov edx, dword ptr [esi + 0198h]
    cmp cmp byte ptr [edx + 16], bl
    je sub_1004FFBD
    cmp cmp byte ptr [esi + 0D0h], bl
    mov mov eax, dword ptr [esi + 44]
    je sub_1004FF9A
    lea lea eax, [eax + eax*2 + 2]
    mov mov dword ptr [ecx + 4], ebx
    mov mov ecx, dword ptr [esi + 0124h]
    mov mov edx, dword ptr [esi + 8]
    imul imul ecx, eax
    mov mov dword ptr [edx + 8], ecx
    mov mov eax, dword ptr [esi + 8]
    mov mov dword ptr [eax + 12], ebx
    mov mov al, byte ptr [esi + 98]
    mov mov edx, dword ptr [esi + 8]
    xor xor ecx, ecx
    cmp cmp al, bl
    setne setne cl
    add add ecx, 2
    mov mov dword ptr [edx + 16], ecx
    inc inc dword ptr [ebp + 12]
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1004fc90 ENDP
END
