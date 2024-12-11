; #######################################################
; # moduloD: MODULO DE LA SOLUCION CONCRETA             #
; #######################################################

(defmodule moduloD (import MAIN defclass ?ALL) (import moduloC ?ALL) (export ?ALL))

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

(defrule moduloD::regla_inicial
    (not (obras_por_dia_a_rellenar $?))
    (not (obras_por_dia $?))
    (not (obras_recorrido $?))
    (obrashora ?v)
    (object (is-a Visita) (dias ?dias) (horas ?horas))
    =>
    (bind ?obras_por_dia (create$))
    (loop-for-count (?i 1 ?dias) do
        (switch ?v
            (case muy_lento ; 2 obras/hora aprox
                then (bind ?obras_por_dia ?obras_por_dia (* ?horas 2))
            )
            (case lento ; 3 obras/hora aprox
                then (bind ?obras_por_dia ?obras_por_dia (* ?horas 3))
            )
            (case medio ; 5 obras/hora aprox
                then (bind ?obras_por_dia ?obras_por_dia (* ?horas 5))
            )
            (case rapido ; 10 obras/hora aprox
                then (bind ?obras_por_dia ?obras_por_dia (* ?horas 10))
            )
            (case muy_rapido ; 20 obras/hora aprox
                then (bind ?obras_por_dia ?obras_por_dia (* ?horas 20))
            )
        )
    )
    (assert (obras_por_dia_a_rellenar ?obras_por_dia))
    (assert (obras_por_dia ?obras_por_dia))
    (assert (obras_recorrido))
)

(defrule moduloD::regla_rellenar_autores_turistica
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_autor $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)
    ?instancia_obra <- (object (is-a Obra) (autor ?pintor) (popularidad ?popularidad))
    ?instancia_pintor <- (object (is-a Pintor) (name ?pintor) (nombre ?preferencia_por_autor))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    =>
    ;(printout t ?pintor " || " ?preferencia_por_autor " || " ?instancia_pintor crlf)
    (printout t "Se inserta la obra " ?instancia_obra " de " ?pintor " por la regla_rellenar_autores_turistica" crlf)
)

(defrule moduloD::regla_rellenar_resto
    (declare (salience -10))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)
    ?instancia_obra <- (object (is-a Obra))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    =>
    (printout t "Se inserta la obra " ?instancia_obra " por la regla_rellenar_resto" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)
