
.equ SCREEN_WIDTH,      640
.equ SCREEN_HEIGH,      480
.equ BITS_PER_PIXEL,    32

.globl main
main:
    //mov x20, x0 // Save framebuffer base address to x20

str x0, [sp, #-8]! // Guardar el FrameBuffer al Stack

ldr x20, =SUB_FB // Usamos el Sub Buffer

//movz x18, 0x0000, lsl 48
mov x18, xzr

mov x6, 0 //movz x6, 0x0009 // variable azul0
mov x17, 0 //movz x17, 0x0300 // variable verde0
mov x19, 0 //movz x19, 0x0000 // variable rojo0
movk x19, 0x0001, lsl 16
mov x11, -1
//movz x10, 0x3366
movz x10, 0xfdC0  // Direccion de memoria que contiene el color con el que se pinta
movk x10, 0x00b4, lsl 16
//movz x10, 0x77ff

restart:
add x11, x11, 1 // contador sobre si cambia el rango de colores del degradé
movz x3, 0x0001 // variable azul
movz x4, 0x0100 // variable verde
movz x5, 0x0000
movk x5, 0x0001 // variable rojo
movz x17, 0x0000 // x17 nos pauta de que color a cual vamos, en este caso cel-cel claro
movk x17, 0x0001, lsl 16 //
skippp:
cbz x18, skipp
mov x10, x18 // pone el ultimo color del frame 12 en el x10 para el frame "13"
//add x10, x10, x19 // resta 5 al ultimo color
skipp:

// TODO FRAME 1
frame1:
sub x10, x10, x19 // resta 5 al ultimo color
//add x10, 0x3366, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//sub x10, x10, x17 //movz x17, 0x0000, lsl 00 //
//movz x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul

bl DrawFondo

mov x14, 0
mov x15, 0
bl DrawEstrellas

//BODY
movz x13, 228, lsl 16
movk x13, 300, lsl 0
bl DrawPatas
mov x3,264 // x
mov x4,96 // y
mov x5,478 // X
mov x6,324 // Y
bl DrawBody
bl Arcoiris1
mov x3, 168
mov x4, 180
bl DrawCola1
mov x3, 396
mov x4, 168
bl DrawCabeza
// TODO FIN FRAME 1

bl delay1

// TODO FRAME 2
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3355, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

bl DrawFondo

// ESTRELLAS
// FOR REFERENCE: los circulos se van moviendo de 53 en 53 por 12 frames hasta 640 (limite de reinicio)
//el radio de 3 en 3 en 12 frames hasta 32(limite de reinicio)

mov x14, 10 //3
mov x15, 55 //53
bl DrawEstrellas

movz x13, 240, lsl 16
movk x13, 300, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,96 // y
mov x5,478 // X
mov x6,324 // Y
bl DrawBody
bl Arcoiris1
mov x3, 168
mov x4, 300 //168
bl DrawCola2
mov x3, 408
mov x4, 168
bl DrawCabeza

// TODO FIN FRAME 2
bl delay1
// TODO FRAME 3
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3350, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo

// ESTRELLAS
mov x14, 13 //6
mov x15, 108 //106
bl DrawEstrellas
// END STARS

movz x13, 252, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris2
mov x3, 168
mov x4, 192
bl DrawCola3
mov x3, 408
mov x4, 180
bl DrawCabeza

// TODO FIN FRAME 3
bl delay1
// TODO FRAME 4
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3345, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo

// ESTRELLAS
mov x14, 16 //9
mov x15, 161 //159
bl DrawEstrellas
// END STARS

movz x13, 240, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris1
mov x3, 168
mov x4, 204
bl DrawCola4
mov x3, 408
mov x4, 180
bl DrawCabeza
// TODO FIN FRAME 4
bl delay1
// TODO FRAME 5
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3340, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo
// ESTRELLAS
mov x14, 20 //12
mov x15, 214 //212
bl DrawEstrellas
// END STARS

movz x13, 216, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris1
// END PATAS
mov x3, 168
mov x4, 204
bl DrawCola3
mov x3, 396
mov x4, 180
bl DrawCabeza

// TODO FIN FRAME 5
bl delay1
// TODO FRAME 6
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3335, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo

// ESTRELLAS
mov x14, 24 //15
mov x15, 267 //265
bl DrawEstrellas
// END STARS

movz x13, 216, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris2
mov x3, 168
mov x4, 204
bl DrawCola2
mov x3, 396
mov x4, 168
bl DrawCabeza
// TODO FIN FRAME 6

bl delay1

// TODO FRAME 7

// FONDO
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3330, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo
// END FONDO

// ESTRELLAS
mov x14, 27 //18
mov x15, 320 //318
bl DrawEstrellas
// END STARS

movz x13, 228, lsl 16
movk x13, 300, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,96 // y
mov x5,478 // X
mov x6,324 // Y
bl DrawBody
bl Arcoiris1
mov x3, 168
mov x4, 180
bl DrawCola1
mov x3, 396
mov x4, 168
bl DrawCabeza

// TODO END FRAME 7

bl delay1

// TODO FRAME 8

// FONDO
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3325, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo
// END FONDO

// ESTRELLAS
mov x14, 30 //21
mov x15, 373 //371
bl DrawEstrellas
// END STARS

movz x13, 240, lsl 16
movk x13, 300, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,96 // y
mov x5,478 // X
mov x6,324 // Y
bl DrawBody
bl Arcoiris1
// END PATAS
mov x3, 168
mov x4, 168
bl DrawCola2
mov x3, 408
mov x4, 168
bl DrawCabeza

// TODO END FRAME 8

bl delay1

// TODO FRAME 9
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3320, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo
// ESTRELLAS
mov x14, 33 //24
mov x15, 426 //424
bl DrawEstrellas
// END STARS

movz x13, 252, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris2
mov x3, 168
mov x4, 204
bl DrawCola3
mov x3, 408
mov x4, 180
bl DrawCabeza
// TODO END FRAME 9

bl delay1

// TODO FRAME 10
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3315, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo

// ESTRELLAS
mov x14, 37 //27
mov x15, 479 //477
bl DrawEstrellas
// END STARS

movz x13, 240, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris1
mov x3, 168
mov x4, 204
bl DrawCola4
mov x3, 408
mov x4, 180
bl DrawCabeza

// TODO END FRAME 10

bl delay1

// TODO FRAME 11
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3310, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16
mov x18, x10

//add x10, x10, x17 //movz x17, 0x0000, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
//movk x17, 0x0001, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
bl DrawFondo

// ESTRELLAS
mov x14, 42 //30
mov x15, 532 //530
bl DrawEstrellas
// END STARS

movz x13, 216, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris1
// END PATAS
mov x3, 168
mov x4, 204
bl DrawCola3
mov x3, 396
mov x4, 180
bl DrawCabeza

// TODO END FRAME 11

bl delay1

// TODO FRAME 12 TODO: MOVER ESTRELLAS
sub x10, x18, x16 // resta 5 al ultimo color
sub x10, x10, x17
sub x10, x10, x19
//movz x10, 0x3305, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
//movk x10, 0xffff, lsl 16

mov x18, x10

bl DrawFondo

// ESTRELLAS
mov x14, 52 //mov x14, 33
mov x15, 583 //mov x15, 583
bl DrawEstrellas
// END STARS

movz x13, 216, lsl 16
movk x13, 312, lsl 0
bl DrawPatas

mov x3,264 // x
mov x4,108 // y
mov x5,478 // X
mov x6,336 // Y
bl DrawBody
bl Arcoiris2
mov x3, 168
mov x4, 204
bl DrawCola2
mov x3, 396
mov x4, 168
bl DrawCabeza

// TODO END FRAME 12

bl delay1
b restart
b frame1
b end

// FUNCIONES

DrawSquare: // Dibuja un cuadrado
    mov x0,x20 // VA AL INICIO
    sub x2,x6,x4 // Calcula el alto
    mov x8,SCREEN_WIDTH // AUX
    mul x9,x4,x8 // Y * 640
    add x9,x9,x3 // Y * 640 + x
    mov x8,4 // AUX
    mul x9,x9,x8 // 4(640Y + X)
    add x0,x0,x9 // Goto first point

    dsLoop:
    sub x1,x5,x3 // Guarda en x1 el ancho
    dsLoopb:
    stur w10,[x0] // Pinta del color de w10
    sub x1,x1,1 // x1 - 1
    add x0,x0,4 // Next Pixel
    cbnz x1,dsLoopb // return
    mov x8,SCREEN_WIDTH // AUX
    sub x8,x8,x5 // 640 - X
    add x8,x8,x3 // 640 + x
    mov x9,4 // AUX
    mul x8,x8,x9
    add x0,x0,x8
    sub x2,x2,1
    cbnz x2,dsLoop

    DrawSquareReturn:
    br lr

// x22 X; x21 Y
Bandera:
    mov x27,x30 // BACKUP DE RETORNO
    movz x10,0x0a00, lsl 00 // Rojo: fd0a00
    movk x10, 0xfd, lsl 16 // SET COLOR ROJO
    mov x3,x22 //
    mov x4,x21 // (x,y)
    add x5,x3,48 //
    add x6,x4,24
    bl DrawSquare
    movz x10, 0x9502, lsl 00 // Naranja: fe9502
    movk x10, 0x00fe, lsl 16 // SET COLOR NARANJA
    add x4,x4,24
    add x6,x6,24
    bl DrawSquare
    movz x10, 0xfe00, lsl 00 // Amarillo: fefe00
    movk x10, 0x00fe, lsl 16 // SET COLOR AMARILLO
    add x4,x4,24
    add x6,x6,24
    bl DrawSquare
    movz x10, 0xfd02, lsl 00 // Verde: 32fd02
    movk x10, 0x0032, lsl 16 // SET COLOR VERDE
    add x4,x4,24
    add x6,x6,24
    bl DrawSquare
    movz x10, 0x98fd // Celeste: 0098fd  SET COLOR CELESTE
    add x4,x4,24
    add x6,x6,24
    bl DrawSquare
    movz x10, 0x33fc, lsl 00 // Morado: 6633fc
    movk x10, 0x0066, lsl 16 // SET COLOR VIOLETA
    add x4,x4,24
    add x6,x6,24
    bl DrawSquare
    BanderaReturn:
    mov x30,x27
    br lr

// f(x,y) x21 = x y x22 = y // Dibuja un pixel 12x12 en la coordenada como esquina superior izquierda
DrawPixel:
    mov x27,x30
    mov x3,x21
    mov x4,x22
    add x5,x3,12
    add x6,x4,12
    bl DrawSquare
    ReturnDrawPixel:
    mov x30,x27
    br lr

DrawCircle:
    mov x27,x30 // Guarda la direccion de retorno en x27
    mov x0,x20 // LLEVA EL PUNTERO DEL PIXEL AL AL INICIO
    mov x2, 480 // GUARDA EN X2 LA CANTIDAD DE FILAS QUE VAMOS A RECORRER
    dcLoop:
    mov x1,640 // GUARDA EN X2 LA CANTIDAD DE COLUMNAS QUE " ...
    dcLoopb:
    //  si (x-h)² + (y-k)² <= r² ==> pintar , donde x = [640..0], y = [480..0], h = x24 (centro), k = x25 (centro), r = x26 (radio)
    sub x4, x1, x24 // x - h
    mul x4, x4, x4 // (x - h)²
    sub x5, x2, x25 // y - k
    mul x5, x5, x5 // (y - k)²
    add x5, x4, x5 // (x-h)² + (y-k)²
    mul x3, x26, x26 // r²
    cmp x5,x3  // si (x-h)² + (y-k)² < r²  ---> pintamos
    b.gt dcNoPinta
    stur w10,[x0] // Pinta del color de w10
    dcNoPinta:
    sub x1,x1,1 // x1 - 1
    add x0,x0,4 // Next Pixel
    cbnz x1,dcLoopb // return
    sub x2,x2,1 // Y - 1
    cbnz x2,dcLoop
    ReturnDrawCircle:
    mov x30,x27
    br lr

DrawFondo:
    mov x27,x30
    //movz w10,0x3366, lsl 00 // Setea color del fondo
    mov x0,x20 // VA AL INICIO
    mov x2,SCREEN_HEIGH // Calcula el alto
    mov x21, 0 //
    dfLoop:
    mov x1,SCREEN_WIDTH// Guarda en x1 el ancho
    dfLoopb:
    sub x1,x1,1 // x1 - 1
    stur w10,[x0] // Pinta del color de w10
    add x0,x0,4 // Next Pixel
    cbnz x1,dfLoopb // return
    mov x22,480
    cmp x21,x22 // COMPARA CONTADOR NUEVE
    b.ne skipResetBlue // SI NO TERMINO EL CONTADOR, NO LO RESETEA
    lsl x12, x10, 62
    lsl x12, x12, 62
    add x12, x12, x3
    cmp x12, 0xFF
    b.lt skyp
    sub x12, x12, 0xFF
    sub w10, w10, w12
    b skyp1
    skyp:
    add w10,w10,w3 // Suma azul
    skyp1:

    lsr x12, x10, 2
    lsl x12, x10, 62
    lsl x12, x12, 62
    add x12, x12, x4
    cmp x12, 0xFF
    b.lt skyp2
    sub x12, x12, 0xFF
    sub w10, w10, w12
    b skyp3
    skyp2:
    add w10,w10,w4 // Suma verde
    skyp3:
    lsr x12, x10, 4
        lsl x12, x10, 62
        lsl x12, x12, 62
        add x12, x12, x5
        cmp x12, 0xFF
        b.lt skyp4
        sub x12, x12, 0xFF
        sub w10, w10, w12
        b skyp5
        skyp4:
        add w10,w10,w5 // Suma rojo
        skyp5:
    mov x21,0   // RESETEA EL CONTADOR (Aca es donde reseteamos x21 por eso no importa usarlo como color)
    skipResetBlue: // Continua el ciclo de 9
    add x21,x21,1 // Suma 1 al contador
    sub x2,x2,1 // Resta el contador del alto del rectangulo
    cbnz x2,dfLoop
    DrawFondoReturn:
    br lr

delay1:
    mov x4, x30

    ldr x27, [sp, #0] // Obtengo de vuelta el FrameBuffer
    bl Draw_To_Screen // Aplica los cambios a la pantalla! Espera en x27 el FrameBuffer.

    movz x3 , 0x0200, lsl 16 // 0x0200 ideal time
    l1:
    sub x3, x3, 1
    cbnz x3, l1
    mov x30, x4
    br lr

// FUNCIONES DE EXTREMIDADES COMPLETAS
Arcoiris1: // Dado un punto (x22,x21) dibuja un arcoiris con ese punto como esquina superior derecha
    mov x23, x30
    mov x22,192
    mov x21,132
    bl Bandera
    sub x22,x22,48 // -48
    add x21,x21,12 // +12
    bl Bandera
    sub x22,x22,48 // -48
    sub x21,x21,12 // -12
    bl Bandera
    sub x22,x22,48 // -48
    add x21,x21,12 // +12
    bl Bandera
    sub x22,x22,48 // -48
    sub x21,x21,12 // -12
    bl Bandera
    mov x30, x23
    br lr
    // END ARCOIRIS

Arcoiris2: // Dado un punto (x22,x21) dibuja un arcoiris con ese punto como esquina superior derecha
    mov x23, x30
    mov x22,192
    mov x21,144
    bl Bandera
    sub x22,x22,48 // -48
    sub x21,x21,12 // +12
    bl Bandera
    sub x22,x22,48 // -48
    add x21,x21,12 // -12
    bl Bandera
    sub x22,x22,48 // -48
    sub x21,x21,12 // +12
    bl Bandera
    sub x22,x22,48 // -48
    add x21,x21,12 // -12
    bl Bandera
    mov x30, x23
    br lr
    // END ARCOIRIS

DrawCabeza: // mov x3, 396 y mov x4, 168
    mov x23, x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    add x5, x3,24
    add x6, x4,12
    bl DrawSquare
    mov x3, x5
    mov x4, x6
    add x5, x3,24
    add x6, x4,12
    bl DrawSquare
    mov x3, x5
    mov x4, x6
    add x5, x3,24
    add x6, x4,12
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3, 48
    add x6, x4, 12
    bl DrawSquare
    mov x21, x5
    sub x22, x6, 24
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    add x3, x21, 12
    sub x4, x22, 12
    add x5, x3, 24
    add x6, x4, 12
    bl DrawSquare
    add x3, x3, 24
    add x4, x4, 12
    add x5, x3, 12
    add x6, x4, 120
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 48
    add x5, x3, 12
    add x6, x4, 60
    bl DrawSquare
    sub x21, x5, 36
    add x22, x6, 12
    bl DrawPixel
    sub x3, x21, 132
    add x4, x22, 12
    add x5, x3, 132
    add x6, x4, 12
    bl DrawSquare
    sub x21, x3, 12
    sub x22, x4, 12
    bl DrawPixel
    sub x3, x21, 12
    sub x4, x22, 120
    add x5, x3, 12
    add x6, x4, 120
    bl DrawSquare
    sub x3, x3, 12
    add x4, x4, 48
    add x5, x3, 12
    add x6, x4, 60
    bl DrawSquare
    //Gris
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    add x3 ,x3, 12
    add x5 ,x3, 180
    add x6, x4, 60
    bl DrawSquare
    add x3, x3, 12
    sub x4, x4, 48
    add x5, x3, 12
    add x6, x4, 120
    bl DrawSquare
    add x3, x3, 12
    add x5, x3, 12
    add x6, x4, 132
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3, 24
    add x6, x4, 120
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3, 24
    add x6, x4, 108
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3, 60
    add x6, x4, 96
    bl DrawSquare
    add x3, x3, 60
    sub x4, x4, 12
    add x5, x3, 12
    add x6, x4, 108
    bl DrawSquare
    add x3, x3, 12
    sub x4, x4, 12
    add x5, x3, 12
    add x6, x4, 120
    bl DrawSquare
    add x3, x3, 12
    sub x4, x4, 12
    add x5, x3, 12
    add x6, x4, 132
    bl DrawSquare
    add x3, x3, 12
    add x5, x3, 12
    add x6, x4, 120
    bl DrawSquare
    //Boca y ojos
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    //Primer ojo
    sub x21, x3, 108 //432
    add x22, x4, 60 // 240 direccion base de referencia
    bl DrawPixel
    add x3, x21, 0 //mov x3, 432
    add x4, x22, 0 //mov x4, 240
    add x5, x21, 24 //mov x5, 456
    add x6, x22, 24 //mov x6, 264
    bl DrawSquare
    movz x10, 0xFFFF, lsl 00 // Set color in white
    movk x10, 0x00FF, lsl 16
    bl DrawPixel
    //Segundo ojo
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    add x3, x21, 84
    add x4, x22, 0
    add x5, x21, 108
    add x6, x22, 24
    bl DrawSquare
    movz x10, 0xFFFF, lsl 00 // Set color in white
    movk x10, 0x00FF, lsl 16
    add x21, x21, 84
    bl DrawPixel
    //Boca
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    sub x21, x21, 72
    add x22, x22, 36
    bl DrawPixel
    add x21, x21, 36
    bl DrawPixel
    add x21, x21, 36
    bl DrawPixel
    sub x3, x21, 72
    add x4, x22, 12
    add x5, x21, 12
    add x6, x22, 24
    bl DrawSquare
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    //movz x10, 0x3327, lsl 00 // Set color in red BA3327
    //movk x10, 0x00BA, lsl 16
    sub x21, x21, 24 //mov x21, 492   //Nariz TODO: CONVERTIR A TRIANGULO POR COMPLETITUD
    sub x22, x22, 24 //mov x22, 252
    bl DrawPixel
    // MEJILLAS
    movz x10, 0x9896, lsl 00 // color mejillas #FD9896
    movk x10, 0x00fd, lsl 16
    mov x26, 10 // RADIO DEL CIRCULO
    add x24, x21, 58 //mov x24,90// coordenada x del centro del circulo teniendo en cuenta un eje cartesiano con el (0,0) en la esquina inferior derecha
    mov x13, SCREEN_WIDTH
    sub x24, x13, x24
    add x25, x22, 182 //mov x25,206 // coordenada y  "" ..
    sub x25, x13, x25
    bl DrawCircle
    mov x26, 10 // RADIO DEL CIRCULO
    add x24, x24, 140 //mov x24,230 //
    //mov x25,206 //
    bl DrawCircle
    mov x30, x23
    br lr
    // FIN CABEZA

DrawBody: // Dado dos puntos (x3,x4) y (x5,x6) dibuja el cuerpo con ese pixel como esquina superior izquierda
    // Bordes negros del cuerpo
    mov x23, x30
    mov w10,WZR
    //mov x5,478 // X
    //mov x6,324 // Y
    bl DrawSquare
    sub x3, x3, 12
    add x4, x4, 12
    add x5, x5, 12
    sub x6, x6, 12
    bl DrawSquare
    sub x3, x3, 12
    add x4, x4, 12
    add x5, x5, 12
    sub x6, x6, 12
    bl DrawSquare
    // END Bordes negros del cuerpo
    // Pan
    movz x10, 0xcb98, lsl 00 //Masa: 0xfecb98
    movk x10, 0x00fe, lsl 16
    add x3, x3, 24
    sub x4, x4, 12
    sub x5, x5, 24
    add x6, x6, 12
    bl DrawSquare
    sub x3, x3, 12
    add x4, x4, 12
    add x5, x5, 12
    sub x6, x6, 12
    bl DrawSquare
    // END Pan
    // Dibuja la crema rosa del cuerpo del gato
    movz x10, 0x99f7, lsl 00 //crema: 0xf399f7
    movk x10, 0x00f3, lsl 16
    add x3, x3, 12
    add x4,x4,24
    sub x5, x5,12
    sub x6, x6, 24
    bl DrawSquare
    add x3, x3, 12
    sub x4, x4, 12
    sub x5, x5, 12
    add x6, x6, 12
    bl DrawSquare
    add x3, x3, 12
    sub x4, x4, 12
    sub x5, x5, 12
    add x6, x6, 12
    bl DrawSquare
    // END Crema rosa
    Chispas: // Dibuja las chispas
    mov x21, x3
    add x22, x4, 36
    movz x10, 0x268c, lsl 00
    movk x10, 0x00fd, lsl 16
    bl DrawPixel
    add x21, x21, 12
    add x22, x22, 60
    bl DrawPixel
    add x21, x21, 36
    add x22, x22, 48
    bl DrawPixel
    sub x22,x22,72
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 48
    bl DrawPixel
    add x21, x21, 48
    bl DrawPixel
    add x21, x21, 48
    add x22, x22, 24
    bl DrawPixel
    // END CHISPAS
    mov x30, x23
    br lr
    // END BODY

DrawCola1:
    mov x23,x30
    // Borde negro cola
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    add x21,x3,12 // x21 y x22 se setean aca para la parte gris
    add x22,x4,12
    add x5, x3,48
    add x6, x4,36
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3,48
    add x6, x4,36
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3,48
    add x6, x4,36
    bl DrawSquare
    add x3, x3, 12
    add x4, x4, 12
    add x5, x3,48
    add x6, x4,36
    bl DrawSquare
    add x3,x3, 12
    add x4,x4, 12
    add x5, x3,36
    add x6, x4,36
    bl DrawSquare
    //Parte gris
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    bl DrawPixel // Este draw pixel lo ejecuto asi sin setear argumentos porque en realidad estan en la linea anterior
    add x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    ReturnDrawCola1:
    mov x30,x23
    br lr

DrawCola2:
    mov x23, x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    mov x21, 228
    mov x22, 252
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    add x22, x22, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    add x22, x22, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    ReturnDrawCola2:
    mov x30,x23
    br lr

DrawCola3:
    mov x23,x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    mov x21, 228
    mov x22, 264
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    sub x22, x22, 12
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    add x22, x22, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    ReturnDrawCola3:
    mov x30,x23
    br lr

DrawCola4:
    mov x23,x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    mov x21, 228
    mov x22, 264
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    add x22, x22, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    sub x3, x21, 12
    add x4, x22, 12
    add x5, x3, 24
    add x6, x4, 24
    bl DrawSquare
    sub x3, x3, 24
    add x4, x4, 12
    bl DrawSquare
    sub x3, x3, 12
    add x4, x4, 12
    sub x5, x5, 36
    add x6, x6, 24
    bl DrawSquare
    ReturnDrawCola4:
    mov x30,x23
    br lr

DrawPatas: // Toma un punto X,Y en x13
    mov x14, x30
    lsr w21, w13, 16
    mov w22, w13
    movk x22, 0x0000, lsl 16
    add x21, x21, 12
    bl pata1
    add x21,x21,36
    add x22,x22,24
    bl pata2
    add x21, x21, 84
    bl pata3
    add x21, x21, 24
    bl pata4
    mov x30, x14
    br lr

pata4: //4th leg
    mov x23,x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    bl DrawPixel
    add x21, x21, 12
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    add x22, x22, 12
    sub x21, x21, 12
    bl DrawPixel
    sub x21, x21, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    add x21,x21, 12
    bl DrawPixel
    ReturnPata4:
    mov x30,x23
    br lr

pata3:
    mov x23,x30
    //3rd leg
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    bl DrawPixel
    add x3, x21, 12
    add x4, x22, 12
    add x5, x21, 48
    add x6, x22, 24
    bl DrawSquare
    add x21, x21, 48
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    sub x3, x21, 36
    add x4, x22, 0
    add x5, x21, 0
    add x6, x22, 12
    bl DrawSquare
    mov x30, x23
    br lr

pata2:
    mov x23,x30
    //2nd leg
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    bl DrawPixel
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    add x21, x21, 12 // 336, x21 base parte gris
    sub x22, x22, 12 // 324, x22 base parte gris
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    sub x21, x21, 24 //mov x21, 312
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    mov x30,x23
    br lr
pata1:
    mov x23, x30
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    bl DrawPixel
    sub x21, x21, 12 // BASE X21 216
    add x22, x22, 12 // BASE X22 312
    bl DrawPixel
    mov x25, x21
    mov x26, x22 // copia de seguridad del primer pixel de referencia
    add x3, x21, 0
    add x4, x22, 12
    add x5, x21, 12
    add x6, x22, 36   //BASES
    bl DrawSquare
    add x4, x4, 12
    add x5, x5, 36
    bl DrawSquare
    add x21, x21, 36
    add x22, x22, 12
    bl DrawPixel
    add x21, x21, 12
    bl DrawPixel
    movz x10, 0xD5D6, lsl 00 // Set color in grey
    movk x10, 0x00D8, lsl 16
    sub x3, x21, 36
    sub x4, x22, 12
    sub x5, x21, 12
    add x6, x22, 12
    bl DrawSquare
    sub x21, x21, 12
    sub x22, x22, 12
    bl DrawPixel
    // me desvio del dibujo principal para dibujar unos pixeles extra
    movz x10, 0x0000, lsl 00 // Set color in black
    movk x10, 0x0000, lsl 16
    add x21, x25, 24
    sub x22, x26, 12
    bl DrawPixel
    sub x22, x22, 12
    bl DrawPixel
    add x22, x22, 12
    add x21, x21, 12
    bl DrawPixel
    mov x30,x23
    br lr

// ESTRELLAS
DrawEstrellas:
    mov x23, x30
    movz x10, 0xffff, lsl 00 // color BLANCO
    movk x10, 0xffff, lsl 16
    add x26, x14, 6 //mov x26, 6 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip00 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32 // (r>32) - 32
    mov x7, 32 // 32
    sub x26, x7, x16 // r = 32 - ((r>32) - 32)
    cmp x26, 0
    b.ge skip00 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip00:
    add x24, x15, 320 //mov x24,320 (x, )  centro desde esquina inferior derecha (0,0)
    mov x25,440 // ( ,y)
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip0 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip0:
    add x26, x14, 12 //mov x26, 12 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip01 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip01 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip01:
    add x24, x15, 380 //mov x24,380 // (x, )  centro desde esquina inferior derecha (0,0)
    mov x25,70 //  ( ,y)
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip1 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip1:
    add x26, x14, 8 //mov x26, 8 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip02 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip02 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip02:
    add x24, x15, 520 //mov x24,520// (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,35 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip2 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip2:
    add x26, x14, 28 //mov x26, 28 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip03 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip03 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip03:
    add x24, x15, 76 //mov x24,76 // (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,300 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip3 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip3:
    add x26, x14, 24 //mov x26, 24 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip04 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip04 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip04:
    add x24, x15, 580 //mov x24,580 // (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,128 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip4 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip4:
    add x26, x14, 32 //mov x26, 32 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip05 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip05 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip05:
    add x24, x15, 480 //mov x24,480 // (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,380 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip5 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip5:
    add x26, x14, 25 //mov x26, 25 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip06 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip06 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip06:
    add x24, x15, 59 //mov x24,59 // (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,460 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip6 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip6:
    add x26, x14, 18 //mov x26, 18 // RADIO DEL CIRCULO
    cmp x26, 32
    b.lt skip07 // if new radio > 32, reinicio crecimiento del r a decreciente
    sub x16, x26, 32
    mov x7, 32
    sub x26, x7, x16
    cmp x26, 0
    b.ge skip07 // if r < 0 then reinicio crecimiento a creciente de nuevo
    sub x26, XZR, x26
    skip07:
    add x24, x15, 100 //mov x24,100// (x,y) centro desde esquina inferior derecha (0,0)
    mov x25,16 //
    bl DrawCircle
    add x16, x24, x26 // x + radio
    cmp x16, SCREEN_WIDTH //
    b.lt skip7 // if x+r > 640 => reinicio el circulo a la parte der.
    sub x24, x24, SCREEN_WIDTH
    bl DrawCircle
    skip7:
    returnDrawEstrellas:
    mov x30, x23
    br lr
end:
    bl delay1
    b main

Draw_To_Screen:
    stp   x0, x1, [sp, #-16]!
    stp   x2, x3, [sp, #-16]!
    stp   x4, x5, [sp, #-16]!
    stp   x6, x7, [sp, #-16]!
    stp   x8, x9, [sp, #-16]!
    stp   x10, x11, [sp, #-16]!
    stp   x12, x13, [sp, #-16]!
    stp   x14, x15, [sp, #-16]!

    movz x0, 0x0012, lsl 16
    movk x0, 0xC000, lsl 00

    lsr x0, x0, 2 // X0 Limit
    mov x1, xzr // x1 Counter

    mov x5, xzr

    mov x6, xzr
    ldr x6, =SUB_FB
FSFB_LOOP:
    lsl x3, x1, 3
    add x4, x3, x6

    ldp w11, w12, [x4]

    add x4, x3, x27 // Frame Buffer
    stp w11, w12, [x4]
    add x1, x1, 1

    cmp x1, x0
    b.HS FSFB_END
    b FSFB_LOOP
FSFB_END:
    ldp   x14, x15, [sp, 0]
    ldp   x12, x13, [sp, #16]!
    ldp   x10, x11, [sp, #16]!
    ldp   x8, x9, [sp, #16]!
    ldp   x6, x7, [sp, #16]!
    ldp   x4, x5, [sp, #16]!
    ldp   x2, x3, [sp, #16]!
    ldp   x0, x1, [sp, #16]!
    add sp, sp, 16
    br lr

.data
SUB_FB: .skip 0x12C000 // 640 * 480 * 4
