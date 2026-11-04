.686
.MODEL FLAT, C
EXTRN sub_100F7074:PROC
EXTRN sub_100F7116:PROC
EXTRN sub_100FB4E5:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB670:PROC
.CODE
_fclose PROC
    push 12
    push 01017C488h
    call sub_100FB61C
    or dword ptr [ebp - 28], 0FFFFFFFFh
    mov esi, dword ptr [ebp + 8]
    test byte ptr [esi + 12], 64
    je L1
    and dword ptr [esi + 12], 0
L0:
    mov eax, dword ptr [ebp - 28]
    call sub_100FB670
    ret
L1:
    push esi
    call sub_100FB4E5
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100F7074
    pop ecx
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F7116
    jmp L0
_fclose ENDP
END
