.686
.MODEL FLAT, C
EXTRN sub_100C9B18:PROC
.CODE
FUN_100ca5a1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ecx + 000000100h]
    and dword ptr [ebp - 8], 0
    push ebx
    mov ebx, dword ptr [ecx + 16]
    push esi
    push edi
L0:
    mov edx, dword ptr [eax + 16]
    mov esi, dword ptr [ebp - 8]
    mov esi, dword ptr [esi + edx]
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [edx + esi*4]
    mov edi, dword ptr [edx + 4]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 4], 1
    je L1
    xor edi, edi
    cmp dword ptr [edx + 92], edi
    je L3
    jmp L2
L1:
    xor edi, edi
L2:
    mov edx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + edx*4 - 16], esi
L3:
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 8], 8
    jb L0
    cmp dword ptr [ebp - 4], edi
    jne L4
    xor eax, eax
    jmp L5
L4:
    mov esi, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + 00000018Ch]
    push edi
    mov edx, eax
    push edi
    neg edx
    push edi
    sbb edx, edx
    lea ebx, [ecx + 000000190h]
    push edi
    and edx, ebx
    neg eax
    push 4
    sbb eax, eax
    lea ebx, [ecx + 0000001A0h]
    and eax, ebx
    push eax
    push edx
    push esi
    push dword ptr [ebp - 4]
    lea eax, [ebp - 16]
    push eax
    push 37
    call sub_100C9B18
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100ca5a1 ENDP
END
