.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBC34:PROC
EXTRN sub_100FBE51:PROC
EXTRN sub_100FBE55:PROC
EXTRN sub_100FBE71:PROC
EXTRN sub_100FBE80:PROC
EXTRN sub_100FBEB1:PROC
EXTRN sub_100FBED4:PROC
EXTRN sub_100FC27A:PROC
EXTRN sub_100FC28E:PROC
EXTRN sub_100FC2AA:PROC
EXTRN sub_100FC2BE:PROC
EXTRN sub_1010778E:PROC
EXTRN sub_1010787E:PROC
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__write PROC
    push push 12
    push push 01017C890h
    call sub_100FB61C
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp ebx, dword ptr [g_1076AC9C]
    jae sub_100FBE51
    mov mov eax, ebx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ebx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    shl shl esi, 2
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FBE71
    push push ebx
    call sub_1010778E
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FBE55
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push ebx
    call sub_100FBC34
    add add esp, 12
    mov mov dword ptr [ebp - 28], eax
    jmp sub_100FBE80
    call sub_100FC27A
    mov mov dword ptr [eax], 9
    call sub_100FC28E
    and and dword ptr [eax], 0
    or or dword ptr [ebp - 28], -1
    or or dword ptr [ebp - 4], -1
    call sub_100FBEB1
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100FBED4
    mov mov ebx, dword ptr [ebp + 8]
    push push ebx
    call sub_1010787E
    pop pop ecx
    ret ret
    call sub_100FC2AA
    mov mov dword ptr [eax], 9
    call sub_100FC2BE
__write ENDP
END
