.686
.MODEL FLAT, C
EXTRN sub_100FC277:PROC
EXTRN sub_10109EE6:PROC
EXTRN sub_10109F04:PROC
EXTRN sub_10109F1B:PROC
.CODE
__setmode_lk PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, eax
    sar sar ecx, 5
    and and eax, 31
    lea lea edx, [ecx*4 + 01076ACA0h]
    lea lea ecx, [eax + eax*8]
    mov mov eax, dword ptr [edx]
    shl shl ecx, 2
    movzx movzx eax, byte ptr [eax + ecx + 4]
    push push esi
    mov mov esi, 08000h
    and and eax, 080h
    cmp cmp dword ptr [esp + 12], esi
    jne sub_10109EE6
    mov mov edx, dword ptr [edx]
    lea lea ecx, [edx + ecx + 4]
    and and byte ptr [ecx], 127
    jmp sub_10109F04
    cmp cmp dword ptr [esp + 12], 04000h
    jne sub_10109F1B
    mov mov edx, dword ptr [edx]
    lea lea ecx, [edx + ecx + 4]
    or or byte ptr [ecx], 080h
    neg neg eax
    sbb sbb eax, eax
    and and eax, 0FFFFC000h
    add add eax, esi
    pop pop esi
    ret ret
    call sub_100FC277
    mov mov dword ptr [eax], 22
    or or eax, -1
    pop pop esi
    ret ret
__setmode_lk ENDP
END
