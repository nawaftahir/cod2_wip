.686
.MODEL FLAT, C
EXTRN fp_101D4A34:DWORD
EXTRN fp_101D4A38:DWORD
EXTRN fp_101D4A48:DWORD
EXTRN g_10696BDC:DWORD
EXTRN g_10696BE0:DWORD
EXTRN g_10696BE4:DWORD
EXTRN g_10696BE8:DWORD
EXTRN g_10696BEC:DWORD
EXTRN g_10696BF0:DWORD
EXTRN g_10696BF4:DWORD
EXTRN g_10696BF8:DWORD
EXTRN g_10696BFC:DWORD
EXTRN g_10696C00:DWORD
EXTRN g_10696C04:DWORD
EXTRN g_10696C08:DWORD
EXTRN g_10696C0C:DWORD
EXTRN g_10696C10:DWORD
EXTRN g_10696C14:DWORD
EXTRN g_10696C18:DWORD
EXTRN g_10696C1C:DWORD
EXTRN g_10696C20:DWORD
EXTRN g_10696C24:DWORD
EXTRN g_10696C2C:DWORD
EXTRN g_10696C30:DWORD
.CODE
FUN_10028a10 PROC
    push 000002000h
    push 0101968DCh
    push 01019733Ch
    call dword ptr [fp_101D4A38]
    push 000002000h
    push 0447A0000h
    push 03F800000h
    push 041800000h
    push 010197328h
    mov dword ptr [g_10696BE0], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 01019717Ch
    push 010197314h
    mov dword ptr [g_10696C2C], eax
    call dword ptr [fp_101D4A38]
    push 000002000h
    push 0461C4000h
    push 0
    push 0
    push 010197300h
    mov dword ptr [g_10696C24], eax
    call dword ptr [fp_101D4A34]
    add esp, 64
    push 000002000h
    push 042B40000h
    push 0
    push 042340000h
    push 0101972E8h
    mov dword ptr [g_10696BDC], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 0461C4000h
    push 0
    push 0451C4000h
    push 0101972D4h
    mov dword ptr [g_10696C1C], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042B40000h
    push 0
    push 040000000h
    push 0101972BCh
    mov dword ptr [g_10696C20], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 03F800000h
    push 0
    push 03F800000h
    push 0101972A4h
    mov dword ptr [g_10696C0C], eax
    call dword ptr [fp_101D4A34]
    add esp, 80
    push 000002000h
    push 042700000h
    push 0
    push 03F800000h
    push 010197290h
    mov dword ptr [g_10696C04], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042700000h
    push 0
    push 03F800000h
    push 01019727Ch
    mov dword ptr [g_10696BF8], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042B40000h
    push 0
    push 041F00000h
    push 010197264h
    mov dword ptr [g_10696C00], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042B40000h
    push 0
    push 040A00000h
    push 01019724Ch
    mov dword ptr [g_10696BE4], eax
    call dword ptr [fp_101D4A34]
    add esp, 80
    push 000002000h
    push 03F800000h
    push 0
    push 03F400000h
    push 010197234h
    mov dword ptr [g_10696C10], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042700000h
    push 0
    push 03F000000h
    push 010197220h
    mov dword ptr [g_10696C08], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042700000h
    push 0
    push 040400000h
    push 01019720Ch
    mov dword ptr [g_10696BFC], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042B40000h
    push 0
    push 041F00000h
    push 0101971F4h
    mov dword ptr [g_10696BE8], eax
    call dword ptr [fp_101D4A34]
    add esp, 80
    push 000002000h
    push 042B40000h
    push 0
    push 040A00000h
    push 0101971DCh
    mov dword ptr [g_10696C18], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 03F800000h
    push 0
    push 03F400000h
    push 0101971C4h
    mov dword ptr [g_10696C14], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042700000h
    push 0
    push 03F000000h
    push 0101971B0h
    mov dword ptr [g_10696C30], eax
    call dword ptr [fp_101D4A34]
    push 000002000h
    push 042700000h
    push 0
    push 040400000h
    push 01019719Ch
    mov dword ptr [g_10696BF0], eax
    call dword ptr [fp_101D4A34]
    add esp, 80
    push 000002000h
    push 043B40000h
    push 0C3B40000h
    push 0
    push 0
    push 0
    push 010197188h
    mov dword ptr [g_10696BF4], eax
    call dword ptr [fp_101D4A48]
    add esp, 28
    mov dword ptr [g_10696BEC], eax
    ret
FUN_10028a10 ENDP
END
