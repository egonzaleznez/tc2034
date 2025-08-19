; ***********************
; * CÓDIGO EN CLIPS
; * EJEMPLO PEDIR ORDEN
; 
; compilar: (load "/Users/enriquegon/programas/CLIPS/tc2033_ejem2.clp")
; limpiar ambiente: (reset)
; correr: (run)
;
; ***********************


(defrule inicio "pedir bebida"
	=>
	(println crlf)
	(println "Hola Bienvenido!")
	(println "Vamos a tomar tu orden")
	(println crlf)
	(println "Quieres una bebida? (S)i o (N)o")
	(assert (bebida (read))))

(defrule bebida-S "con bebidas"
	(bebida S)
	=>
	(println "¿Quieres beber (H)orchata, (J)amaica o (T)amarindo?")
	(bind ?tipo_bebida (read)) ; se guarda el tipo de bebida
	(assert (hubo_bebida ?tipo_bebida))  ; se guarda el valor en un hecho
	(assert (pedir alimentos)))	; usamos pedir como control de flujo para que no se brinque al final ya que hay 2 hechos

(defrule bebida-N "sin bebidas"
	(bebida N)
	=>
	(println "Sin bebidas")
	(assert (pedir alimentos)))

(defrule alimentos "pedir alimentos"
	(pedir alimentos)
	=>
	(println "Quieres algún alimento? (S)i o (N)o")
	(assert (comida (read))))

(defrule comida-S "con alimentos"
	(comida S)
	=>
	(println "¿Quieres comer (Ta)cos, (S)opes o (To)stadas?")
	(bind ?tipo_comida (read))  ; Lee el tipo de comida
	(assert (hubo_comida ?tipo_comida))
	(assert (final)))

(defrule comida-N "sin alimentos"
	(comida N)
	=>
	(println "Sin alimentos")
	(assert (final)))

(defrule final "pregunta terminar"
	(hubo_bebida ?bebida)
	(hubo_comida ?comida)
	=>
	
	;Indica que se pidió
   	(if (and (eq ?bebida H) (eq ?comida Ta)) then
      		(println "Pediste agua de horchata y tacos")
	else
      		(if (and (eq ?bebida H) (eq ?comida S)) then
      			(println "Pediste agua de horchata y sopes")
		else
      			(if (and (eq ?bebida H) (eq ?comida To)) then
      				(println "Pediste agua de horchata y tostadas")
			else
				(println "Pediste otra cosa"))))
			
	(println crlf "Repetir? (S)i o (N)o")
	(assert (startover (read))))

(defrule final-otro "pregunta terminar"
	(hubo_bebida ?bebida)
	=>
	
	; Indica que se pidió
   	(if (eq ?bebida H) then
      		(println "Pediste agua de horchata")
	else
      		(if (eq ?bebida J) then
      			(println "Pediste agua de jamaica")
		else
      			(println "Pediste agua de tamarindo")))
			
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