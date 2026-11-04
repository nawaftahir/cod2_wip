.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBF19:PROC
EXTRN sub_100FBF23:PROC
EXTRN sub_100FBF25:PROC
EXTRN sub_100FBF32:PROC
EXTRN sub_100FBF39:PROC
EXTRN sub_100FBF5B:PROC
EXTRN sub_100FBF8E:PROC
EXTRN sub_100FBFA9:PROC
EXTRN sub_100FC29A:PROC
EXTRN sub_100FC29B:PROC
EXTRN sub_100FC2C3:PROC
EXTRN sub_10107765:PROC
EXTRN sub_10107792:PROC
EXTRN sub_10107897:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C128:DWORD:DWORD
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__commit PROC
    push push 12
    push push 01017C8A0h
    call sub_100FB61C
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp ebx, dword ptr [g_1076AC9C]
    jae sub_100FBF19
    mov mov eax, ebx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ebx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    shl shl esi, 2
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FBF39
    push push ebx
    call sub_10107792
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FBF25
    push push ebx
    call sub_10107765
    pop pop ecx
    push push eax
    call dword ptr [fp_1010C128]
    test test eax, eax
    jne sub_100FBF23
    call dword ptr [fp_1010C054]
    mov mov dword ptr [ebp - 28], eax
    jmp sub_100FBF32
    and and dword ptr [ebp - 28], 0
    cmp cmp dword ptr [ebp - 28], 0
    je sub_100FBF5B
    call sub_100FC29A
    mov mov ecx, dword ptr [ebp - 28]
    mov mov dword ptr [eax], ecx
    call sub_100FC29B
    mov mov dword ptr [eax], 9
    or or dword ptr [ebp - 28], -1
    or or dword ptr [ebp - 4], -1
    call sub_100FBF8E
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100FBFA9
    mov mov ebx, dword ptr [ebp + 8]
    push push ebx
    call sub_10107897
    pop pop ecx
    ret ret
    call sub_100FC2C3
__commit ENDP
END
