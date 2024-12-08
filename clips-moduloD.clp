; #######################################################
; # moduloD: MODULO DE LA SOLUCION CONCRETA             #
; #######################################################

(defmodule moduloD (import MAIN defclass ?ALL) (export ?ALL))

(deffunction moduloD::frecuencia
    (?obra ?cjt_obras)
    (bind ?contador 0)
    (progn$ (?v ?cjt_obras)
        (if (eq ?v ?obra)
            then (bind ?contador (+ ?contador 1))
        )    
    )
    ?contador
)

(defrule moduloD::no_hay_visita
     (not (object (is-a Visita)))
     =>
     (printout t "Creando la instancia visita" crlf)
     (bind ?visita (make-instance visita of Visita))
     (send ?visita put-dias 2)
     (send ?visita put-horas 1)
     (send ?visita put-conocimiento 0)
     (send ?visita put-num_obras 1)
     (send ?visita put-preferencias "Biblico" "Leonardo da Vinci" "Siglo de Oro Espanol" "Neoclasicismo")
     (send ?visita put-grupo 1 crios)
)

(defrule moduloD::regla_inicial
    (not (obras_dia $?))
    (not (num_obras_dia $?))
    (not (obras_recorrido $?))
    (obrashora ?v)
    (object (is-a Visita) (dias ?dias) (horas ?horas))
    =>
    (bind ?obras_dia (create$))
    (loop-for-count (?i 1 ?dias) do
        (switch ?v
            (case muy_lento ; 2 obras/hora aprox
                then (bind ?obras_dia ?obras_dia (* ?horas 2))
            )
            (case lento ; 3 obras/hora aprox
                then (bind ?obras_dia ?obras_dia (* ?horas 3))
            )
            (case medio ; 5 obras/hora aprox
                then (bind ?obras_dia ?obras_dia (* ?horas 5))
            )
            (case rapido ; 10 obras/hora aprox
                then (bind ?obras_dia ?obras_dia (* ?horas 10))
            )
            (case muy_rapido ; 20 obras/hora aprox
                then (bind ?obras_dia ?obras_dia (* ?horas 20))
            )
        )
    )
    (assert (obras_dia ?obras_dia))
    (assert (num_obras_dia ?obras_dia))
    (assert (obras_recorrido))
)

(defrule moduloD::regla_rellenar_dias
    ;(tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_dia <- (obras_dia $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (dias ?dias))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)
    ?instancia_obra <- (object (is-a Obra) (nombre ?nombre) (popularidad ?popularidad))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    =>
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_dia)
    (assert (obras_dia ?slice1 (- ?dia_objetivo 1) ?slice2))
)
