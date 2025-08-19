; ***********************
; * CÓDIGO EN CLIPS
; * EJEMPLO PEDIR ORDEN
; 
; compilar: (load "/Users/enriquegon/programas/CLIPS/tc2033_ejem3.clp")
; limpiar ambiente: (reset)
; correr: (run)
;
; ***********************


(defrule inicio "dar bienvenida"
	=>
	(println crlf)
	(println "Hola Bienvenido!")
	(println "Vamos a revisar a donde quieres ir")
	(println crlf)
	(println "Prefieres un lugar de (ca)calor o (fr)frío?")
	(assert (clima (read))))

(defrule clima-ca "preferencia clima caliente"
	(clima ca)
	=>
	(println "¿Prefieres un logar (co)colonial o una (pl)playa?")
	(assert (lugar (read))))

(defrule lugar-co "preferencia lugar colonial"
	(lugar co)
	=>
	(println "Prefieres visitar (sa)San Miguel de Allende o (pu)Puebla?")
	(bind ?lugar_colonial (read)) 

	(if (eq ?lugar_colonial sa) then
			(println "Seleccionaste que prefieres ir a San Miguel de Allende")
		else
			(println "Seleccionaste que prefieres ir a Puebla"))

	(assert (estado final)))

(defrule lugar-pl "preferencia playa"
	(lugar pl)
	=>
	(println "Prefieres visitar (ca)Cancún o (pu)Puerto Vallarta?")
	(bind ?playa (read)) 

	(if (eq ?playa ca) then
			(println "Seleccionaste que prefieres ir a Cancún")
		else
			(println "Seleccionaste que prefieres ir a Puerto Vallarta"))

	(assert (estado final)))

(defrule clima-fr "preferencia clima frío"
	(clima fr)
	=>
	(println "Prefieres visitar una cabaña en el (bo)bosque o ir a (es)esquiar?")
	(bind ?frio (read)) 

	(if (eq ?frio bo) then
			(println "Seleccionaste que prefieres ir a una cabaña")
		else
			(println "Seleccionaste que prefieres ir a esquiar"))

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




