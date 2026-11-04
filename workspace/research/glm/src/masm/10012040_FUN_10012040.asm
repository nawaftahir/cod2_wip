.686
.MODEL FLAT, C
EXTRN sub_1000D886:PROC
EXTRN sub_10014C7F:PROC
EXTRN sub_100173EB:PROC
EXTRN g_101AE4C0:DWORD
EXTRN g_101AE4CC:DWORD
EXTRN g_101AE4D8:DWORD
EXTRN g_101AE4F0:DWORD
EXTRN g_101AE508:DWORD
EXTRN g_101D1B28:DWORD
EXTRN g_101D4D00:DWORD
EXTRN g_101D5D28:DWORD
EXTRN g_101D620C:DWORD
.CODE
FUN_10012040 PROC
    push edi
    call sub_1000D886
    call sub_100173EB
    mov eax, 010194250h
    mov dword ptr [g_101D5D28], 0
    call sub_10014C7F
    mov dword ptr [g_101D1B28], eax
    xor eax, eax
    mov ecx, 40
    mov edi, 0101D616Ch
    rep stosd dword ptr es:[edi], eax
    mov ecx, 21
    mov edi, 0101AE4B8h
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101D620C], eax
    mov eax, 000001000h
    mov dword ptr [g_101AE4C0], eax
    mov dword ptr [g_101AE4CC], 000000200h
    mov dword ptr [g_101AE4D8], eax
    mov dword ptr [g_101AE4F0], 000004000h
    mov dword ptr [g_101AE508], eax
    mov byte ptr [g_101D4D00], 1
    pop edi
    ret
FUN_10012040 ENDP
END
