; FID_conflict:__time32 @ 0x100f7004 — auto-synthesized
    EXTRN fp_1010c0f4:DWORD
    sub_100fcc5e PROTO C
.CODE
FID_conflict:__time32 PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    lea eax, [ebp - 8]
    push eax
    call dword ptr [fp_1010c0f4]
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    push 0
    add eax, 0x2ac18000
    push 0x989680
    adc ecx, 0xfe624e21
    push ecx
    push eax
    call sub_100fcc5e
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L0
    mov dword ptr [ecx], eax
    leave
    ret
FID_conflict:__time32 ENDP
END