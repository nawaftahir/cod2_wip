.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC272:PROC
EXTRN sub_100FC29A:PROC
EXTRN sub_100FC2AE:PROC
EXTRN sub_100FCCE9:PROC
EXTRN sub_100FCDB1:PROC
EXTRN sub_100FCDBD:PROC
EXTRN sub_100FCDD1:PROC
EXTRN sub_100FCDD8:PROC
EXTRN sub_100FCE01:PROC
EXTRN sub_100FCE24:PROC
EXTRN sub_1010778E:PROC
EXTRN sub_1010786E:PROC
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__close PROC
    push push 12
    push push 01017C960h
    call sub_100FB61C
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp ebx, dword ptr [g_1076AC9C]
    jae sub_100FCDB1
    mov mov eax, ebx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ebx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    shl shl esi, 2
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FCDD1
    push push ebx
    call sub_1010778E
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 1
    je sub_100FCDBD
    push push ebx
    call sub_100FCCE9
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    jmp sub_100FCDD8
    call sub_100FC272
    mov mov dword ptr [eax], 9
    or or dword ptr [ebp - 28], -1
    or or dword ptr [ebp - 4], -1
    call sub_100FCE01
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100FCE24
    mov mov ebx, dword ptr [ebp + 8]
    push push ebx
    call sub_1010786E
    pop pop ecx
    ret ret
    call sub_100FC29A
    mov mov dword ptr [eax], 9
    call sub_100FC2AE
__close ENDP
END
