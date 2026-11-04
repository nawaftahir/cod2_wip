.686
.MODEL FLAT, C
EXTRN sub_100FA442:PROC
EXTRN sub_100FA44A:PROC
EXTRN sub_100FA457:PROC
EXTRN sub_100FA45A:PROC
EXTRN sub_100FA480:PROC
EXTRN sub_100FA487:PROC
EXTRN sub_100FA497:PROC
EXTRN sub_100FA4A5:PROC
EXTRN sub_100FA4C3:PROC
EXTRN sub_100FA4F8:PROC
EXTRN sub_100FA51E:PROC
EXTRN sub_100FA534:PROC
EXTRN sub_100FA541:PROC
EXTRN sub_100FBE48:PROC
EXTRN sub_100FBE9B:PROC
EXTRN sub_10106AE9:PROC
EXTRN sub_10106B33:PROC
EXTRN sub_10106B6C:PROC
.CODE
__flsbuf PROC
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 12]
    test test al, 082h
    mov mov ebx, dword ptr [esi + 16]
    je sub_100FA442
    test test al, 64
    jne sub_100FA44A
    test test al, 1
    je L0
    and and dword ptr [esi + 4], 0
    test test al, 16
    je sub_100FA45A
    mov mov ecx, dword ptr [esi + 8]
    and and eax, -2
    mov mov dword ptr [esi], ecx
    mov mov dword ptr [esi + 12], eax
    mov mov eax, dword ptr [esi + 12]
    and and dword ptr [esi + 4], 0
    and and dword ptr [ebp + 12], 0
    and and eax, -17
    or or eax, 2
    test test ax, 010Ch
    mov mov dword ptr [esi + 12], eax
    jne L2
    cmp cmp esi, 0101A48C0h
    je L1
L0:
    cmp cmp esi, 0101A48E0h
    jne L3
    push push ebx
    call sub_10106B6C
    test test eax, eax
    pop pop ecx
    jne L4
    push push esi
    call sub_10106B33
    pop pop ecx
    test test word ptr [esi + 12], 0108h
    push push edi
    je sub_100FA480
    mov mov eax, dword ptr [esi + 8]
    mov mov edi, dword ptr [esi]
    lea lea ecx, [eax + 1]
    mov mov dword ptr [esi], ecx
    mov mov ecx, dword ptr [esi + 24]
    sub sub edi, eax
    dec dec ecx
    test test edi, edi
    mov mov dword ptr [esi + 4], ecx
    jle sub_100FA457
    push push edi
    push push eax
    push push ebx
    call sub_100FBE48
    mov mov dword ptr [ebp + 12], eax
    jmp sub_100FA497
    cmp cmp ebx, -1
    je sub_100FA487
    mov mov ecx, ebx
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    mov mov eax, ebx
    and and eax, 31
    lea lea eax, [eax + eax*8]
    lea lea eax, [ecx + eax*4]
L1:
    jmp sub_100FA4A5
    mov mov eax, 0101A4E60h
    test test byte ptr [eax + 4], 32
    je sub_100FA4C3
    push push 2
    push push 0
    push push ebx
    call sub_10106AE9
    add add esp, 12
    mov mov eax, dword ptr [esi + 8]
    mov mov cl, byte ptr [ebp + 8]
    mov mov byte ptr [eax], cl
    jmp sub_100FA4F8
    xor xor edi, edi
    inc inc edi
    push push edi
    lea lea eax, [ebp + 8]
    push push eax
    push push ebx
    call sub_100FBE9B
    add add esp, 12
    mov mov dword ptr [ebp + 12], eax
    cmp cmp dword ptr [ebp + 12], edi
    pop pop edi
    je sub_100FA51E
    or or dword ptr [esi + 12], 32
    jmp sub_100FA534
    mov mov eax, dword ptr [ebp + 8]
    and and eax, 0FFh
    jmp sub_100FA541
    or or eax, 32
    mov mov dword ptr [esi + 12], eax
    or or eax, -1
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
__flsbuf ENDP
END
