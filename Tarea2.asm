#init registers
.register $s0 0		#direccion de memoria
.register $s1 0		#n1
.register $s2 0		#n2
.register $s3 0		#i
.register $t0 0		#mayor o menor
.register $t1 1		#1 cte
.register $t2 49	#total de numeros que ordenar 
.register $t3 48	#total de veces a ordenar

main:	beq $s3, $t2, forex		#for interno

		lw $s1, 0($s0)			#Contenido de direccion $s0 lo guarda en n1($s1)
		lw $s2, 4($s0)			#Contenido de direccion $s0+4 lo guarda en n2 ($s2)

		slt $t0, $s1, $s2		#si n1<n2 --> $t0=1; si n1>n2 --> $t0=0
		beq $t0, $t1, menor		#si $t0=1 se va a menor:
		sw $s2, 0($s0) 			#si $t0=0 swap(n1,n2)
		sw $s1, 4($s0)
		addi $s0, $s0, 4		#Siguiente direccion de memoria

		addi $s3, $s3, 1     	#i++
	    j main

menor:	addi $s0, $s0, 4		#Siguiente direccion de memoria
		j main

forex:	beq $t3, $zero, exit	#for externo
		sub $t3, $t3, $t1		#$t3-1
		sub $s0, $s0, $s0		#$s0=0
		sub $s3, $s3, $s3		#i=0
		sub $t2, $t2, $t1		#$t2-1
		j main

exit:
