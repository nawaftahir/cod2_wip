.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBC34:PROC
EXTRN sub_100FBED4:PROC
EXTRN sub_100FC27A:PROC
EXTRN sub_100FC28E:PROC
EXTRN sub_100FC2AA:PROC
EXTRN sub_100FC2BE:PROC
EXTRN sub_1010778E:PROC
EXTRN sub_1010787E:PROC
EXTRN g_1076AC9C:DWORD
.CODE
__write PROC
    push 12
    push 01017C890h
    call sub_100FB61C
    mov ebx, dword ptr [ebp + 8]
    cmp ebx, dword ptr [g_1076AC9C]
    jae L3
    mov eax, ebx
    sar eax, 5
    lea edi, [eax*4 + 01076ACA0h]
    mov eax, ebx
    and eax, 31
    lea esi, [eax + eax*8]
    shl esi, 2
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L3
    push ebx
    call sub_1010778E
    pop ecx
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L0
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push ebx
    call sub_100FBC34
    add esp, 12
    mov dword ptr [ebp - 28], eax
    jmp L1
L0:
    call sub_100FC27A
    mov dword ptr [eax], 9
    call sub_100FC28E
    and dword ptr [eax], 0
    or dword ptr [ebp - 28], 0FFFFFFFFh
L1:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L2
    mov eax, dword ptr [ebp - 28]
    jmp sub_100FBED4
    mov ebx, dword ptr [ebp + 8]
L2:
    push ebx
    call sub_1010787E
    pop ecx
    ret
L3:
    call sub_100FC2AA
    mov dword ptr [eax], 9
    call sub_100FC2BE
__write ENDP
END
