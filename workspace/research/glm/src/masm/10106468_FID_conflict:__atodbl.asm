.686
.MODEL FLAT, C
EXTRN sub_10100D88:PROC
EXTRN sub_101063F0:PROC
EXTRN sub_10106544:PROC
EXTRN g_101A50D0:DWORD
.CODE
FID_conflict:__atodbl PROC
    push ebp
    mov ebp, esp
    sub esp, 20
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 16]
    push eax
    call sub_10106544
    push dword ptr [ebp + 8]
    lea eax, [ebp - 16]
    push eax
    call sub_101063F0
    mov ecx, dword ptr [ebp - 4]
    add esp, 36
    call sub_10100D88
    leave
    ret
FID_conflict:__atodbl ENDP
END
