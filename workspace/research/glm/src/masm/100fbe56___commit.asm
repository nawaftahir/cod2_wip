.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBFA9:PROC
EXTRN sub_100FC29A:PROC
EXTRN sub_100FC29B:PROC
EXTRN sub_100FC2C3:PROC
EXTRN sub_10107765:PROC
EXTRN sub_10107792:PROC
EXTRN sub_10107897:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C128:DWORD
EXTRN g_1076AC9C:DWORD
.CODE
__commit PROC
    push 12
    push 01017C8A0h
    call sub_100FB61C
    mov ebx, dword ptr [ebp + 8]
    cmp ebx, dword ptr [g_1076AC9C]
    jae L5
    mov eax, ebx
    sar eax, 5
    lea edi, [eax*4 + 01076ACA0h]
    mov eax, ebx
    and eax, 31
    lea esi, [eax + eax*8]
    shl esi, 2
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L5
    push ebx
    call sub_10107792
    pop ecx
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L2
    push ebx
    call sub_10107765
    pop ecx
    push eax
    call dword ptr [fp_1010C128]
    test eax, eax
    jne L0
    call dword ptr [fp_1010C054]
    mov dword ptr [ebp - 28], eax
    jmp L1
L0:
    and dword ptr [ebp - 28], 0
L1:
    cmp dword ptr [ebp - 28], 0
    je L3
    call sub_100FC29A
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [eax], ecx
L2:
    call sub_100FC29B
    mov dword ptr [eax], 9
    or dword ptr [ebp - 28], 0FFFFFFFFh
L3:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L4
    mov eax, dword ptr [ebp - 28]
    jmp sub_100FBFA9
    mov ebx, dword ptr [ebp + 8]
L4:
    push ebx
    call sub_10107897
    pop ecx
    ret
L5:
    call sub_100FC2C3
__commit ENDP
END
