.686
.MODEL FLAT, C
EXTRN sub_100FC245:PROC
EXTRN sub_100FC259:PROC
EXTRN sub_10107761:PROC
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__get_osfhandle PROC
    mov mov eax, dword ptr [esp + 4]
    cmp cmp eax, dword ptr [g_1076AC9C]
    jae L0
    mov mov ecx, eax
    and and eax, 31
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea lea eax, [eax + eax*8]
    lea lea eax, [ecx + eax*4]
    test test byte ptr [eax + 4], 1
    je sub_10107761
    mov mov eax, dword ptr [eax]
    ret ret
    call sub_100FC245
    mov mov dword ptr [eax], 9
    call sub_100FC259
    and and dword ptr [eax], 0
    or or eax, -1
    ret ret
__get_osfhandle ENDP
END
