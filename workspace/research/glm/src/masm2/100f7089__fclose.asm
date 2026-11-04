.686
.MODEL FLAT, C
EXTRN sub_100F7074:PROC
EXTRN sub_100F70EC:PROC
EXTRN sub_100F7116:PROC
EXTRN sub_100FB4E5:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB670:PROC
.CODE
_fclose PROC
    push push 12
    push push 01017C488h
    call sub_100FB61C
    or or dword ptr [ebp - 28], -1
    mov mov esi, dword ptr [ebp + 8]
    test test byte ptr [esi + 12], 64
    je L0
    and and dword ptr [esi + 12], 0
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB670
    ret ret
    push push esi
    call sub_100FB4E5
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    call sub_100F7074
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
L0:
    call sub_100F7116
    jmp sub_100F70EC
_fclose ENDP
END
