; __get_osfhandle @ 0x10107710 — auto-synthesized
    EXTRN g_1076ac9c:DWORD
    sub_100fc245 PROTO C
    sub_100fc259 PROTO C
.CODE
__get_osfhandle PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, dword ptr [g_1076ac9c]
    jae L0
    mov ecx, eax
    and eax, 0x1f
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 0x1076aca0]
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4]
    test byte ptr [eax + 4], 1
    je L0
    mov eax, dword ptr [eax]
    ret
    call sub_100fc245
    mov dword ptr [eax], 9
    call sub_100fc259
    and dword ptr [eax], 0
    or eax, 0xffffffff
    ret
__get_osfhandle ENDP
END