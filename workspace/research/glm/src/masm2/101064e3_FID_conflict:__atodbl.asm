.686
.MODEL FLAT, C
EXTRN sub_10100D88:PROC
EXTRN sub_10106406:PROC
EXTRN sub_10106544:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
FID_conflict:__atodbl PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 4], eax
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10106544
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10106406
    mov mov ecx, dword ptr [ebp - 4]
    add add esp, 36
    call sub_10100D88
    leave leave
    ret ret
FID_conflict:__atodbl ENDP
END
