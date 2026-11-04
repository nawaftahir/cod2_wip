.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC27A:PROC
EXTRN sub_100FC28E:PROC
EXTRN sub_100FC2AA:PROC
EXTRN sub_100FC2BE:PROC
EXTRN sub_101069F7:PROC
EXTRN sub_10106ABA:PROC
EXTRN sub_10106ABE:PROC
EXTRN sub_10106ADA:PROC
EXTRN sub_10106AE9:PROC
EXTRN sub_10106B1A:PROC
EXTRN sub_10106B3D:PROC
EXTRN sub_1010778E:PROC
EXTRN sub_1010787E:PROC
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__lseek PROC
    push push 12
    push push 0101821C0h
    call sub_100FB61C
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp ebx, dword ptr [g_1076AC9C]
    jae sub_10106ABA
    mov mov eax, ebx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ebx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    shl shl esi, 2
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_10106ADA
    push push ebx
    call sub_1010778E
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_10106ABE
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push ebx
    call sub_101069F7
    add add esp, 12
    mov mov dword ptr [ebp - 28], eax
    jmp sub_10106AE9
    call sub_100FC27A
    mov mov dword ptr [eax], 9
    call sub_100FC28E
    and and dword ptr [eax], 0
    or or dword ptr [ebp - 28], -1
    or or dword ptr [ebp - 4], -1
    call sub_10106B1A
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_10106B3D
    mov mov ebx, dword ptr [ebp + 8]
    push push ebx
    call sub_1010787E
    pop pop ecx
    ret ret
    call sub_100FC2AA
    mov mov dword ptr [eax], 9
    call sub_100FC2BE
__lseek ENDP
END
