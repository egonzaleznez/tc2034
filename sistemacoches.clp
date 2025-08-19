; ***********************
; * CÓDIGO EN CLIPS
; * Elección de coches
; 
; compilar: (load "")
; limpiar ambiente: (reset)
; correr: (run)
;
; ***********************


;Empieza el programa, damos la bienvenida y preguntamos si te gustan los coches
(defrule inicio "dar bienvenida"
	=>
	(println crlf)
	(println "Hola, bienvenido")
	(println crlf)
	(println "¿Te gustan los coches? (s/n)")
	(assert (gusta (read))))
(defrule no-gusta "no te gustan los coches"
; Si no te gustan los coches preguntamos si queremos repetir y si no quiere repetir terminamos el programa
	(gusta n)
	=>
	(println "¿Quieres repetir? (s/n)")
	(assert (repetir (read))))

(defrule repetir-si "volver al inicio"
	(repetir s)
	=>
	(reset)
	(run))

(defrule repetir-no "fin si no desea repetir"
	(repetir n)
	=>
	(println "Fin")
	(clear))
; Si es que si te gustan los coches preguntamos si te gustan los europeos o asiáticos 
(defrule gusta "si le gustan los coches"
	(gusta s)
	=>
	(println "¿Prefieres coches (eu)europeos o (as)asiáticos?")
	(assert (origen (read))))
;Si son europeos preguntamos si se prefieren los italianos o europeos y mostramos la preferencia
(defrule origeneuropeo "preferencia coches europeos"
	(origen eu)
	=>
	(println "¿Prefieres coches (it)italianos o (al)alemanes?")
	(bind ?tipoEuropeo (read))

	(if (eq ?tipoEuropeo it) then
		(println "Se sugiere un coche Italiano")
	else
		(println "Se sugiere un coche Alemán"))

	(assert (estado final)))
; Hacemos lo mismo con los asiaticos, preguntamos y monstramos la preferencia
(defrule origenasiatico "preferencia coches asiáticos"
	(origen as)
	=>
	(println "¿Prefieres coches (ma)Mazda o (ki)Kia?")
	(bind ?tipoAsiatico (read))

	(if (eq ?tipoAsiatico ma) then
		(println "Marca sugerida: Mazda")
	else
		(println " Marca sugerida: Kia"))

	(assert (estado final)))

;Terminamos y preguntamos si queremos repetir
(defrule final "pregunta terminar"
	(estado final)
	=>			
	(println crlf "¿Quieres repetir? (s)si o (n)no")
	(assert (startover (read))))
;Reiniciamos el programa
(defrule startover-s "reiniciar"
	(startover s)
	=>
	(reset)
	(run))

(defrule startover-n "fin"
	(startover n)
	=>
	(clear))   ; 
