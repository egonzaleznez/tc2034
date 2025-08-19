; ***********************
; * CÓDIGO EN CLIPS
; * EJEMPLO SELECCIONAR BEBIDA
; 
; compilar: (load "/Users/enriquegon/programas/CLIPS/tc2033_ejem1.clp")
; limpiar ambiente: (clear)
; correr: (run)
;
; ***********************


(defrule inicio "bienvenida"
	=>
	(println crlf)
	(println "Hola Bienvenido!")
	(println "Vamos a seleccionar tu bebida")
	(println crlf)
	(assert (preferencia)))

(defrule preferencia "selecciona según preferencia"
	=>
	(println "Quieres una bebida? (fr)fría o (ca)caliente")
	(assert (tipo (read))))

(defrule tipo-F "selecciona bebida fría"
	(tipo fr)
	=>
	(println "Quieres una (li)limonada o (na)naranjada?")
	(bind ?tipo_bebida (read)) ; se guarda el tipo de bebida
	(println "Pediste " ?tipo_bebida )
	(assert (estado final)))

(defrule tipo-C "selecciona bebida caliente"
	(tipo ca)
	=>
	(println "Quieres un (caf)café o (cho)chocolate?")
	(bind ?tipo_bebida (read)) ; se guarda el tipo de bebida
	(println "Pediste " ?tipo_bebida )
	(assert (estado final)))


(defrule final "pregunta terminar"
	(estado final)
	=>		
	(println crlf "Repetir? (S)i o (N)o")
	(assert (startover (read))))

(defrule startover-S "reiniciar"
	(startover S)
	=>
	(reset)
	(run))

(defrule startover-N "fin"
	(startover N)
	=>
	(clear))   ; Limpiar el entorno
;	(exit))    ; Salir de CLIPS