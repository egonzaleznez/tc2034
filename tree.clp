(defrule weather "Pregunta al usuario clima"
	=>
	(println "Weather? (S)un/(C)loudy/(R)ain")
	(assert (weather (read))))

(defrule weather-s "Soleado"
	(weather S)
	=>
	(println "Time? (mins)")
	(assert (time (read))))

(defrule time-l30 "Menos de 30"
	(time ?t&:(< ?t 30))
	=>
	(println "Bus")
	(assert (finish)))

(defrule time-m30 "Mas de 30"
	(time ?t&:(> ?t 30))
	=>
	(println "Walk")
	(assert (finish)))

(defrule weather-c "Cloudy"
	(weather C)
	=>
	(println "Hungry? (Y)es/(N)o")
	(assert (hungry (read))))

(defrule hungry-y
	(hungry Y)
	=>
	(println "Walk")
	(assert (finish)))

(defrule hungry-n
	(hungry N)
	=>
	(println "Bus")
	(assert (finish)))

(defrule rain "Rainy"
	(weather R)
	=>
	(println "Bus")
	(assert (finish)))

(defrule finish "Terminar"
	(finish)
	=>
	(println "Repeat?")
	(assert (startover (read))))

(defrule start-over
	(startover Y)
	=>
	(reset)
	(run))