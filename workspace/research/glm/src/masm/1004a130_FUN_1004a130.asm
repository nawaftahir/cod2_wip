.686
.MODEL FLAT, C
EXTRN sub_1004A201:PROC
.CODE
FUN_1004a130 PROC
    mov eax, dword ptr [esi + 20]
    cmp eax, 0000000C8h
    je L0
    cmp eax, 0000000C9h
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, esi
    call sub_1004A201
    mov ecx, eax
    dec ecx
    je L4
    dec ecx
    jne L5
    mov al, byte ptr [esp + 4]
    test al, al
    je L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 51
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L1:
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L3
    push 1
    push esi
    call dword ptr [eax + 0x24]
    mov al, byte ptr [esi + 16]
    add esp, 8
    test al, al
    je L2
    mov dword ptr [esi + 20], 0000000C8h
    mov dword ptr [esi + 000000114h], 0
    mov eax, 2
    ret
L2:
    mov dword ptr [esi + 20], 100
L3:
    mov eax, 2
    ret
L4:
    mov eax, 1
L5:
    ret
FUN_1004a130 ENDP
END
