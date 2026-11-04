.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68F:PROC
EXTRN sub_10107B1E:PROC
EXTRN sub_10107EAE:PROC
.CODE
__sopen PROC
    push push 20
    push push 010182290h
    call sub_100FB61C
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 4], 0
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 28]
    push push eax
    mov mov ecx, dword ptr [ebp + 16]
    call sub_10107B1E
    add add esp, 20
    mov mov dword ptr [ebp - 36], eax
    or or dword ptr [ebp - 4], -1
    call sub_10107EAE
    mov mov eax, dword ptr [ebp - 36]
    call sub_100FB68F
    ret ret
__sopen ENDP
END
