.686
.MODEL FLAT, C
EXTRN sub_100C9B18:PROC
EXTRN sub_100CA65B:PROC
EXTRN sub_100CA699:PROC
.CODE
FUN_100ca5a1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ecx + 0100h]
    and and dword ptr [ebp - 8], 0
    push push ebx
    mov mov ebx, dword ptr [ecx + 16]
    push push esi
    push push edi
    mov mov edx, dword ptr [eax + 16]
    mov mov esi, dword ptr [ebp - 8]
    mov mov esi, dword ptr [esi + edx]
    mov mov edx, dword ptr [ecx + 20]
    mov mov edx, dword ptr [edx + esi*4]
    mov mov edi, dword ptr [edx + 4]
    mov mov edi, dword ptr [ebx + edi*4]
    test test byte ptr [edi + 4], 1
    je L1
    xor xor edi, edi
    cmp cmp dword ptr [edx + 92], edi
    je L3
    jmp L2
    xor xor edi, edi
    mov mov edx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ebp + edx*4 - 16], esi
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 8], 8
    jb L0
    cmp cmp dword ptr [ebp - 4], edi
    jne sub_100CA65B
    xor xor eax, eax
    jmp sub_100CA699
    mov mov esi, dword ptr [eax + 8]
    mov mov eax, dword ptr [ecx + 018Ch]
    push push edi
    mov mov edx, eax
    push push edi
    neg neg edx
    push push edi
    sbb sbb edx, edx
    lea lea ebx, [ecx + 0190h]
L1:
    push push edi
    and and edx, ebx
    neg neg eax
    push push 4
    sbb sbb eax, eax
    lea lea ebx, [ecx + 01A0h]
    and and eax, ebx
    push push eax
    push push edx
L3:
    push push esi
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 16]
    push push eax
    push push 37
    call sub_100C9B18
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100ca5a1 ENDP
END
