.686
.MODEL FLAT, C
EXTRN EXTRN fp_101D4A34:DWORD:DWORD
EXTRN EXTRN fp_101D4A38:DWORD:DWORD
EXTRN EXTRN fp_101D4A48:DWORD:DWORD
EXTRN EXTRN g_10696BDC:DWORD:DWORD
EXTRN EXTRN g_10696BE0:DWORD:DWORD
EXTRN EXTRN g_10696BE4:DWORD:DWORD
EXTRN EXTRN g_10696BE8:DWORD:DWORD
EXTRN EXTRN g_10696BEC:DWORD:DWORD
EXTRN EXTRN g_10696BF0:DWORD:DWORD
EXTRN EXTRN g_10696BF4:DWORD:DWORD
EXTRN EXTRN g_10696BF8:DWORD:DWORD
EXTRN EXTRN g_10696BFC:DWORD:DWORD
EXTRN EXTRN g_10696C00:DWORD:DWORD
EXTRN EXTRN g_10696C04:DWORD:DWORD
EXTRN EXTRN g_10696C08:DWORD:DWORD
EXTRN EXTRN g_10696C0C:DWORD:DWORD
EXTRN EXTRN g_10696C10:DWORD:DWORD
EXTRN EXTRN g_10696C14:DWORD:DWORD
EXTRN EXTRN g_10696C18:DWORD:DWORD
EXTRN EXTRN g_10696C1C:DWORD:DWORD
EXTRN EXTRN g_10696C20:DWORD:DWORD
EXTRN EXTRN g_10696C24:DWORD:DWORD
EXTRN EXTRN g_10696C2C:DWORD:DWORD
EXTRN EXTRN g_10696C30:DWORD:DWORD
.CODE
FUN_10028a10 PROC
    push push 02000h
    push push 0101968DCh
    push push 01019733Ch
    call dword ptr [fp_101D4A38]
    push push 02000h
    push push 0447A0000h
    push push 03F800000h
    push push 041800000h
    push push 010197328h
    mov mov dword ptr [g_10696BE0], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 01019717Ch
    push push 010197314h
    mov mov dword ptr [g_10696C2C], eax
    call dword ptr [fp_101D4A38]
    push push 02000h
    push push 0461C4000h
    push push 0
    push push 0
    push push 010197300h
    mov mov dword ptr [g_10696C24], eax
    call dword ptr [fp_101D4A34]
    add add esp, 64
    push push 02000h
    push push 042B40000h
    push push 0
    push push 042340000h
    push push 0101972E8h
    mov mov dword ptr [g_10696BDC], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 0461C4000h
    push push 0
    push push 0451C4000h
    push push 0101972D4h
    mov mov dword ptr [g_10696C1C], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042B40000h
    push push 0
    push push 040000000h
    push push 0101972BCh
    mov mov dword ptr [g_10696C20], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 03F800000h
    push push 0
    push push 03F800000h
    push push 0101972A4h
    mov mov dword ptr [g_10696C0C], eax
    call dword ptr [fp_101D4A34]
    add add esp, 80
    push push 02000h
    push push 042700000h
    push push 0
    push push 03F800000h
    push push 010197290h
    mov mov dword ptr [g_10696C04], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042700000h
    push push 0
    push push 03F800000h
    push push 01019727Ch
    mov mov dword ptr [g_10696BF8], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042B40000h
    push push 0
    push push 041F00000h
    push push 010197264h
    mov mov dword ptr [g_10696C00], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042B40000h
    push push 0
    push push 040A00000h
    push push 01019724Ch
    mov mov dword ptr [g_10696BE4], eax
    call dword ptr [fp_101D4A34]
    add add esp, 80
    push push 02000h
    push push 03F800000h
    push push 0
    push push 03F400000h
    push push 010197234h
    mov mov dword ptr [g_10696C10], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042700000h
    push push 0
    push push 03F000000h
    push push 010197220h
    mov mov dword ptr [g_10696C08], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042700000h
    push push 0
    push push 040400000h
    push push 01019720Ch
    mov mov dword ptr [g_10696BFC], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042B40000h
    push push 0
    push push 041F00000h
    push push 0101971F4h
    mov mov dword ptr [g_10696BE8], eax
    call dword ptr [fp_101D4A34]
    add add esp, 80
    push push 02000h
    push push 042B40000h
    push push 0
    push push 040A00000h
    push push 0101971DCh
    mov mov dword ptr [g_10696C18], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 03F800000h
    push push 0
    push push 03F400000h
    push push 0101971C4h
    mov mov dword ptr [g_10696C14], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042700000h
    push push 0
    push push 03F000000h
    push push 0101971B0h
    mov mov dword ptr [g_10696C30], eax
    call dword ptr [fp_101D4A34]
    push push 02000h
    push push 042700000h
    push push 0
    push push 040400000h
    push push 01019719Ch
    mov mov dword ptr [g_10696BF0], eax
    call dword ptr [fp_101D4A34]
    add add esp, 80
    push push 02000h
    push push 043B40000h
    push push 0C3B40000h
    push push 0
    push push 0
    push push 0
    push push 010197188h
    mov mov dword ptr [g_10696BF4], eax
    call dword ptr [fp_101D4A48]
    add add esp, 28
    mov mov dword ptr [g_10696BEC], eax
    ret ret
FUN_10028a10 ENDP
END
