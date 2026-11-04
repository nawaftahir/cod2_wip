.686
.MODEL FLAT, C
EXTRN sub_1000D886:PROC
EXTRN sub_10014C7F:PROC
EXTRN sub_100173EB:PROC
EXTRN EXTRN g_101AE4C0:DWORD:DWORD
EXTRN EXTRN g_101AE4CC:DWORD:DWORD
EXTRN EXTRN g_101AE4D8:DWORD:DWORD
EXTRN EXTRN g_101AE4F0:DWORD:DWORD
EXTRN EXTRN g_101AE508:DWORD:DWORD
EXTRN EXTRN g_101D1B28:DWORD:DWORD
EXTRN EXTRN g_101D4D00:DWORD:DWORD
EXTRN EXTRN g_101D5D28:DWORD:DWORD
EXTRN EXTRN g_101D620C:DWORD:DWORD
.CODE
FUN_10012040 PROC
    push push edi
    call sub_1000D886
    call sub_100173EB
    mov mov eax, 010194250h
    mov mov dword ptr [g_101D5D28], 0
    call sub_10014C7F
    mov mov dword ptr [g_101D1B28], eax
    xor xor eax, eax
    mov mov ecx, 40
    mov mov edi, 0101D616Ch
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, 21
    mov mov edi, 0101AE4B8h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [g_101D620C], eax
    mov mov eax, 01000h
    mov mov dword ptr [g_101AE4C0], eax
    mov mov dword ptr [g_101AE4CC], 0200h
    mov mov dword ptr [g_101AE4D8], eax
    mov mov dword ptr [g_101AE4F0], 04000h
    mov mov dword ptr [g_101AE508], eax
    mov mov byte ptr [g_101D4D00], 1
    pop pop edi
    ret ret
FUN_10012040 ENDP
END
