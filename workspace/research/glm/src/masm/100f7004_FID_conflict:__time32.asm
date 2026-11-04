.686
.MODEL FLAT, C
EXTRN sub_100FCC5E:PROC
EXTRN fp_1010C0F4:DWORD
.CODE
FID_conflict:__time32 PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    lea eax, [ebp - 8]
    push eax
    call dword ptr [fp_1010C0F4]
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    push 0
    add eax, 02AC18000h
    push 000989680h
    adc ecx, 0FE624E21h
    push ecx
    push eax
    call sub_100FCC5E
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L0
    mov dword ptr [ecx], eax
L0:
    leave
    ret
FID_conflict:__time32 ENDP
END
