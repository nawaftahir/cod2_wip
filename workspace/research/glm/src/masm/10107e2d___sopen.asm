.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68F:PROC
EXTRN sub_10107B1E:PROC
EXTRN sub_10107EAE:PROC
.CODE
__sopen PROC
    push 20
    push 010182290h
    call sub_100FB61C
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 28]
    push eax
    mov ecx, dword ptr [ebp + 16]
    call sub_10107B1E
    add esp, 20
    mov dword ptr [ebp - 36], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_10107EAE
    mov eax, dword ptr [ebp - 36]
    call sub_100FB68F
    ret
__sopen ENDP
END
