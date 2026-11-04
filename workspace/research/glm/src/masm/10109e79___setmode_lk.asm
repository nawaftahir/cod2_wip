.686
.MODEL FLAT, C
EXTRN sub_100FC277:PROC
.CODE
__setmode_lk PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, eax
    sar ecx, 5
    and eax, 31
    lea edx, [ecx*4 + 01076ACA0h]
    lea ecx, [eax + eax*8]
    mov eax, dword ptr [edx]
    shl ecx, 2
    movzx eax, byte ptr [eax + ecx + 4]
    push esi
    mov esi, 000008000h
    and eax, 000000080h
    cmp dword ptr [esp + 12], esi
    jne L0
    mov edx, dword ptr [edx]
    lea ecx, [edx + ecx + 4]
    and byte ptr [ecx], 127
    jmp L1
L0:
    cmp dword ptr [esp + 12], 000004000h
    jne L2
    mov edx, dword ptr [edx]
    lea ecx, [edx + ecx + 4]
    or byte ptr [ecx], 000000080h
L1:
    neg eax
    sbb eax, eax
    and eax, 0FFFFC000h
    add eax, esi
    pop esi
    ret
L2:
    call sub_100FC277
    mov dword ptr [eax], 22
    or eax, 0FFFFFFFFh
    pop esi
    ret
__setmode_lk ENDP
END
