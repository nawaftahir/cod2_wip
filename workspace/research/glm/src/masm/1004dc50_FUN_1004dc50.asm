.686
.MODEL FLAT, C
.CODE
FUN_1004dc50 PROC
    mov eax, dword ptr [esi]
    push ebx
    mov dword ptr [eax + 20], 102
    mov ecx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 00000019Ch]
    mov al, byte ptr [edx + 12]
    xor ebx, ebx
    add esp, 8
    cmp al, bl
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 61
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L0:
    lea eax, [esi + 0000000E2h]
    mov ecx, 16
    mov dl, 5
L1:
    mov byte ptr [eax - 16], bl
    mov byte ptr [eax], 1
    mov byte ptr [eax + 16], dl
    inc eax
    dec ecx
    jne L1
    mov edx, dword ptr [esi + 00000019Ch]
    mov dword ptr [esi + 000000104h], ebx
    mov dword ptr [esi + 48], ebx
    mov byte ptr [esi + 000000112h], bl
    mov byte ptr [esi + 000000108h], bl
    mov byte ptr [esi + 00000010Bh], bl
    mov byte ptr [esi + 000000110h], bl
    mov byte ptr [esi + 000000111h], bl
    mov byte ptr [esi + 000000109h], 1
    mov byte ptr [esi + 00000010Ah], 1
    mov word ptr [esi + 00000010Ch], 1
    mov word ptr [esi + 00000010Eh], 1
    mov byte ptr [edx + 12], 1
    mov al, 1
    pop ebx
    ret
FUN_1004dc50 ENDP
END
