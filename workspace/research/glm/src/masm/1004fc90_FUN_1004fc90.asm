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
EXTRN sub_100506AE:PROC
EXTRN sub_1005142B:PROC
EXTRN sub_1005172B:PROC
EXTRN sub_10051CE0:PROC
EXTRN sub_1005659B:PROC
EXTRN sub_100578D3:PROC
.CODE
FUN_1004fc90 PROC
    push ecx
    push ebx
    push ebp
    push esi
    mov esi, eax
    mov ebp, dword ptr [esi + 000000188h]
    call sub_1004F9F1
    mov eax, esi
    call sub_1004FC28
    xor ebx, ebx
    mov edx, esi
    mov dword ptr [ebp + 12], ebx
    call sub_1004F984
    mov byte ptr [ebp + 16], al
    mov dword ptr [ebp + 20], ebx
    mov dword ptr [ebp + 24], ebx
    mov al, byte ptr [esi + 82]
    cmp al, bl
    je L0
    cmp byte ptr [esi + 72], bl
    jne L1
L0:
    mov byte ptr [esi + 96], bl
    mov byte ptr [esi + 97], bl
    mov byte ptr [esi + 98], bl
L1:
    cmp al, bl
    je L7
    cmp byte ptr [esi + 73], bl
    je L2
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 47
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L2:
    cmp dword ptr [esi + 108], 3
    je L8
    mov byte ptr [esi + 97], bl
    mov byte ptr [esi + 98], bl
    mov dword ptr [esi + 124], ebx
L3:
    mov byte ptr [esi + 96], 1
L4:
    cmp byte ptr [esi + 96], bl
    je L5
    mov eax, esi
    call sub_1005659B
    mov edx, dword ptr [esi + 0000001B0h]
    mov dword ptr [ebp + 20], edx
L5:
    cmp byte ptr [esi + 98], bl
    jne L6
    cmp byte ptr [esi + 97], bl
    je L7
L6:
    call sub_100578D3
    mov eax, dword ptr [esi + 0000001B0h]
    mov dword ptr [ebp + 24], eax
L7:
    cmp byte ptr [esi + 73], bl
    push edi
    jne L12
    cmp byte ptr [ebp + 16], bl
    je L10
    mov edi, esi
    call sub_100506AE
    jmp L11
L8:
    cmp dword ptr [esi + 124], ebx
    je L9
    mov byte ptr [esi + 97], 1
    jmp L4
L9:
    cmp byte ptr [esi + 88], bl
    je L3
    mov byte ptr [esi + 98], 1
    jmp L4
L10:
    call sub_1004BFDB
    call sub_10051CE0
L11:
    xor ecx, ecx
    mov cl, byte ptr [esi + 98]
    push ecx
    call sub_1005172B
    add esp, 4
L12:
    call sub_1004C4F3
    cmp byte ptr [esi + 0000000D1h], bl
    je L13
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 1
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    jmp L15
L13:
    cmp byte ptr [esi + 0000000D0h], bl
    je L14
    call sub_1005142B
    jmp L15
L14:
    call sub_1004D072
L15:
    mov ecx, dword ptr [esi + 000000198h]
    cmp byte ptr [ecx + 16], bl
    jne L16
    cmp byte ptr [esi + 72], bl
    mov byte ptr [esp + 16], bl
    je L17
L16:
    mov byte ptr [esp + 16], 1
L17:
    mov edx, dword ptr [esp + 16]
    push edx
    mov edi, esi
    call sub_1004BA77
    mov al, byte ptr [esi + 73]
    add esp, 4
    cmp al, bl
    pop edi
    jne L18
    push ebx
    mov eax, esi
    call sub_1004DCCA
    add esp, 4
L18:
    mov eax, dword ptr [esi + 4]
    push esi
    call dword ptr [eax + 0x18]
    mov ecx, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [esi + 8]
    add esp, 8
    cmp ecx, ebx
    je L20
    cmp byte ptr [esi + 72], bl
    jne L20
    mov edx, dword ptr [esi + 000000198h]
    cmp byte ptr [edx + 16], bl
    je L20
    cmp byte ptr [esi + 0000000D0h], bl
    mov eax, dword ptr [esi + 44]
    je L19
    lea eax, [eax + eax*2 + 2]
L19:
    mov dword ptr [ecx + 4], ebx
    mov ecx, dword ptr [esi + 000000124h]
    mov edx, dword ptr [esi + 8]
    imul ecx, eax
    mov dword ptr [edx + 8], ecx
    mov eax, dword ptr [esi + 8]
    mov dword ptr [eax + 12], ebx
    mov al, byte ptr [esi + 98]
    mov edx, dword ptr [esi + 8]
    xor ecx, ecx
    cmp al, bl
    setne cl
    add ecx, 2
    mov dword ptr [edx + 16], ecx
    inc dword ptr [ebp + 12]
L20:
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1004fc90 ENDP
END
