.686
.MODEL FLAT, C
EXTRN sub_100F7070:PROC
EXTRN sub_100FCC5E:PROC
EXTRN EXTRN fp_1010C0F4:DWORD:DWORD
.CODE
FID_conflict:__time32 PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    lea lea eax, [ebp - 8]
    push push eax
    call dword ptr [fp_1010C0F4]
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    add add eax, 02AC18000h
    push push 0989680h
    adc adc ecx, 0FE624E21h
    push push ecx
    push push eax
    call sub_100FCC5E
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je sub_100F7070
    mov mov dword ptr [ecx], eax
    leave leave
    ret ret
FID_conflict:__time32 ENDP
END
