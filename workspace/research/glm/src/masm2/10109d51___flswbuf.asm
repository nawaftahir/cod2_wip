.686
.MODEL FLAT, C
EXTRN sub_100FBE4F:PROC
EXTRN sub_100FBEA9:PROC
EXTRN sub_10106AEF:PROC
EXTRN sub_10106B36:PROC
EXTRN sub_10106B6F:PROC
EXTRN sub_10109E84:PROC
EXTRN sub_10109E8C:PROC
EXTRN sub_10109E96:PROC
EXTRN sub_10109E9D:PROC
EXTRN sub_10109EBE:PROC
EXTRN sub_10109EC6:PROC
EXTRN sub_10109ED5:PROC
EXTRN sub_10109EE4:PROC
EXTRN sub_10109F01:PROC
EXTRN sub_10109F3E:PROC
EXTRN sub_10109F6B:PROC
EXTRN sub_10109F80:PROC
EXTRN sub_10109F8E:PROC
.CODE
__flswbuf PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 12]
    test test al, 082h
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 4], ecx
    je sub_10109E84
    test test al, 64
    jne sub_10109E8C
    xor xor ebx, ebx
    test test al, 1
    je L0
    test test al, 16
    mov mov dword ptr [esi + 4], ebx
    je sub_10109E9D
    mov mov edx, dword ptr [esi + 8]
    and and eax, -2
    mov mov dword ptr [esi], edx
    mov mov dword ptr [esi + 12], eax
    mov mov eax, dword ptr [esi + 12]
    and and eax, -17
    or or eax, 2
    test test ax, 010Ch
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 4], ebx
    mov mov dword ptr [ebp + 12], ebx
    jne L2
    cmp cmp esi, 0101A48C0h
    je L1
    cmp cmp esi, 0101A48E0h
    jne L3
L0:
    push push ecx
    call sub_10106B6F
    test test eax, eax
    pop pop ecx
    jne L4
    push push esi
    call sub_10106B36
    pop pop ecx
    mov mov ecx, dword ptr [ebp - 4]
    test test word ptr [esi + 12], 0108h
    push push edi
    je sub_10109EBE
    mov mov eax, dword ptr [esi + 8]
    mov mov edi, dword ptr [esi]
    lea lea edx, [eax + 2]
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [esi + 24]
    sub sub edi, eax
    dec dec edx
    dec dec edx
    cmp cmp edi, ebx
    mov mov dword ptr [esi + 4], edx
    jle sub_10109E96
    push push edi
    push push eax
    push push ecx
    call sub_100FBE4F
    mov mov dword ptr [ebp + 12], eax
    jmp sub_10109ED5
    cmp cmp ecx, -1
    je sub_10109EC6
    mov mov edx, ecx
    sar sar edx, 5
    mov mov edx, dword ptr [edx*4 + 01076ACA0h]
    mov mov eax, ecx
    and and eax, 31
    lea lea eax, [eax + eax*8]
    lea lea eax, [edx + eax*4]
    jmp sub_10109EE4
    mov mov eax, 0101A4E60h
    test test byte ptr [eax + 4], 32
    je sub_10109F01
    push push 2
    push push ebx
    push push ecx
    call sub_10106AEF
    add add esp, 12
    mov mov eax, dword ptr [esi + 8]
    mov mov ebx, dword ptr [ebp + 8]
    mov mov word ptr [eax], bx
    jmp sub_10109F3E
L4:
    mov mov ebx, dword ptr [ebp + 8]
    push push 2
    pop pop edi
    push push edi
    lea lea eax, [ebp + 12]
    push push eax
    push push ecx
    mov mov word ptr [ebp + 12], bx
    call sub_100FBEA9
    add add esp, 12
    mov mov dword ptr [ebp + 12], eax
    cmp cmp dword ptr [ebp + 12], edi
    pop pop edi
    je sub_10109F6B
    or or dword ptr [esi + 12], 32
    jmp sub_10109F80
    mov mov eax, ebx
    and and eax, 0FFFFh
    jmp sub_10109F8E
    or or eax, 32
    mov mov dword ptr [esi + 12], eax
    mov mov eax, 0FFFFh
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
__flswbuf ENDP
END
