.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC272:PROC
EXTRN sub_100FC29A:PROC
EXTRN sub_100FC2AE:PROC
EXTRN sub_100FCCE9:PROC
EXTRN sub_100FCE24:PROC
EXTRN sub_1010778E:PROC
EXTRN sub_1010786E:PROC
EXTRN g_1076AC9C:DWORD
.CODE
__close PROC
    push 12
    push 01017C960h
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
    push ebx
    call sub_100FCCE9
    pop ecx
    mov dword ptr [ebp - 28], eax
    jmp L1
L0:
    call sub_100FC272
    mov dword ptr [eax], 9
    or dword ptr [ebp - 28], 0FFFFFFFFh
L1:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L2
    mov eax, dword ptr [ebp - 28]
    jmp sub_100FCE24
    mov ebx, dword ptr [ebp + 8]
L2:
    push ebx
    call sub_1010786E
    pop ecx
    ret
L3:
    call sub_100FC29A
    mov dword ptr [eax], 9
    call sub_100FC2AE
__close ENDP
END
