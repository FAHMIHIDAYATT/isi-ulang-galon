.model small
.code
org 100h
start:
	jmp mulai
nama	db 13,10,'Nama Pembeli     : $'
nomor	db 13,10,'Nomor HP         : $'
alamat	db 13,10,'Alamat Domisili  : $'
lanjut		db 13,10,'LANJUT Tekan Y untuk lanjut>>>>>>>>>>>>>>>>>>> $'
tampung_nama	db 30,?,30 dup(?)
tampung_nomor	db 13,?,13 dup(?)
tampung_alamat	db 13,?,13 dup(?)


a db 01
b db 02
c db 03
j db 15

daftar: db 13,10,'|--------------------------------------------------------------|'
	db 13,10,'|                             DEPOT                            |'
	db 13,10,'|--------------------------------------------------------------|'
	db 13,10,'+---+-------------------------+----------+----------+----------|'
	db 13,10,'|No |      Ukuran Galon       | Harga (1)| Harga (2)| Harga (3)|'
	db 13,10,'+---+-------------------------+----------+----------+----------|'
	db 13,10,'|01 | Kecil                   | 06.000   | 12.000   | 15.000   |'
	db 13,10,'+---+-------------------------+----------+----------+----------|'
	db 13,10,'|02 | Sedang                  | 08.000   | 16.000   | 20.000   |'
	db 13,10,'+---+-------------------------+----------+----------+----------|'
	db 13,10,'|03 | Besar                   | 10.000   | 20.000   | 25.000   |'
	db 13,10,'+---+-------------------------+----------+----------+----------|','$'
	

error		db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_ntr	db 13,10,'Silahkan Memiih ukuran galon Yang Anda Ingin isi ulang (nomor) : $'
jumlah      	db 13,10,'Berapa jumlah yang anda butuhkan? : $'
succes		db 13,10,'Selamat Anda Berhasil $'

 	mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nomor
	int 21h
	mov ah,0ah
	lea dx,tampung_nomor
	int 21h
	push dx
	
	mov ah,09h
	lea dx,alamat
	int 21h
	mov ah,0ah
	lea dx,tampung_alamat
	int 21h
	push dx

	

	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	jmp proses
	jne error_nsg

error_nsg:
	mov ah,09h
	mov dx,offset pilih_ntr
	int 21h
	int 20h

proses:
	mov ah,09h
	mov dx,offset pilih_ntr
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bh,'1'
	je hasil1

	cmp bh,'0'
	cmp bh,'2'
	je hasil2

	cmp bh,'0'
	cmp bh,'3'
	je hasil3

	jne error_nsg
;-----------------------------------------------------------------'

hasil1:
	mov ah,09h
	lea dx,jumlah
	int 21h
	
	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bh,'1'
	je  h1
	
	cmp bh,'0'
	cmp bh,'2'
	je  h2
	
	cmp bh,'0'
	cmp bh,'3'
	je  h3

hasil2:
	mov ah,09h
	lea dx,jumlah
	int 21h
	
	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bh,'1'
	je  h4
	
	cmp bh,'0'
	cmp bh,'2'
	je  h5
	
	cmp bh,'0'
	cmp bh,'3'
	je  h6

hasil3:
	mov ah,09h
	lea dx,jumlah
	int 21h
	
	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bh,'1'
	je  h7
	
	cmp bh,'0'
	cmp bh,'2'
	je  h8
	
	cmp bh,'0'
	cmp bh,'3'
	je  h9
	
;-------------------------------------------------------------------
                                                                    
h1:
    mov ah,09h
    lea dx,kecil1
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h2:
    mov ah,09h
    lea dx,kecil2
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h3:
    mov ah,09h
    lea dx,kecil3
    int 21h 
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h4:
    mov ah,09h
    lea dx,sedang1
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h5:
    mov ah,09h
    lea dx,sedang2
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h6:
    mov ah,09h
    lea dx,sedang3
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h7:
    mov ah,09h
    lea dx,besar1
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h8:
    mov ah,09h
    lea dx,besar2
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h
    
h9:
    mov ah,09h
    lea dx,besar3
    int 21h
    mov ah,09h
    lea dx,me
    int 21h
    int 20h                                                                    
                                                                    
;------------------------------------------------------------------- 

kecil1: db 13,10,'Anda telah mengorder 1 galon kecil dengan membayar RP.6.000$'
        
me:	db 13,10,'Terimakasih Telah Berlangganan di Depot Kami>>>>>>>>>>>>>> $'
	    
kecil2: db 13,10,'Anda telah mengorder 2 galon kecil dengan membayar RP.12.000$'
        

kecil3: db 13,10,'Anda telah mengorder 3 galon kecil dengan membayar RP.15.000$'
    
;-------------------------------------------------------------------  

sedang1: db 13,10,'Anda telah mengorder 1 galon sedang dengan membayar RP.8.000$'
        
sedang2: db 13,10,'Anda telah mengorder 2 galon sedang dengan membayar RP.16.000$'
        
sedang3: db 13,10,'Anda telah mengorder 3 galon sedang dengan membayar RP.20.000$'
        
    
;------------------------------------------------------------------- 

besar1: db 13,10,'Anda telah mengorder 1 galon besar dengan membayar RP.10.000$'
       
besar2: db 13,10,'Anda telah mengorder 2 galon besar dengan membayar RP.20.000$'
        
besar3: db 13,10,'Anda telah mengorder 3 galon besar dengan membayar RP.25.000$'
    
;-------------------------------------------------------------------


end start