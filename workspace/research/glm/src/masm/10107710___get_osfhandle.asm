.686
.MODEL FLAT, C
EXTRN sub_100FC245:PROC
EXTRN sub_100FC259:PROC
EXTRN g_1076AC9C:DWORD
.CODE
__get_osfhandle PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, dword ptr [g_1076AC9C]
    jae L0
    mov ecx, eax
    and eax, 31
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4]
    test byte ptr [eax + 4], 1
    je L0
    mov eax, dword ptr [eax]
    ret
L0:
    call sub_100FC245
    mov dword ptr [eax], 9
    call sub_100FC259
    and dword ptr [eax], 0
    or eax, 0FFFFFFFFh
    ret
__get_osfhandle ENDP
END
