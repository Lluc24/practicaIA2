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

(defrule moduloD::regla_rellenar_autores_turistica_misma_sala
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_autor $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Pintor) (name ?pintor) (nombre ?preferencia_por_autor))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (popularidad ?popularidad) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (autor ?pintor) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_autores_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_turistica_sala_contigua
    (declare (salience -10))
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_autor $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Pintor) (name ?pintor) (nombre ?preferencia_por_autor))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (popularidad ?popularidad) (esta_en ?sala1))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (autor ?pintor) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_autores_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_intelectual_misma_sala
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_autor $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Pintor) (name ?pintor) (nombre ?preferencia_por_autor))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (complejidad ?complejidad) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (autor ?pintor) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_autores_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_intelectual_sala_contigua
    (declare (salience -10))
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_autor $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Pintor) (name ?pintor) (nombre ?preferencia_por_autor))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (complejidad ?complejidad) (esta_en ?sala1))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (autor ?pintor) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_autores_intelectual_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_turistica_misma_sala
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_tematica $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Tematica) (name ?tematica) (nombre ?preferencia_por_tematica))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (popularidad ?popularidad) (tiene_tematica ?tematica) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (tiene_tematica ?tematica) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_tematicas_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_turistica_sala_contigua
    (declare (salience -10))
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_tematica $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Tematica) (name ?tematica) (nombre ?preferencia_por_tematica))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (popularidad ?popularidad) (esta_en ?sala1) (tiene_tematica ?tematica))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad)) (tiene_tematica ?tematica)))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_tematicas_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_intelectual_misma_sala
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_tematica $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Tematica) (name ?tematica) (nombre ?preferencia_por_tematica))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (complejidad ?complejidad) (esta_en ?sala) (tiene_tematica ?tematica))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (tiene_tematica ?tematica) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_tematicas_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_intelectual_sala_contigua
    (declare (salience -10))
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_tematica $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Tematica) (name ?tematica) (nombre ?preferencia_por_tematica))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (complejidad ?complejidad) (esta_en ?sala1) (tiene_tematica ?tematica))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (tiene_tematica ?tematica) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_tematicas_intelectual_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_resto_misma_sala
    (declare (salience -20))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_resto_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_resto_sala_contigua
    (declare (salience -100))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (esta_en ?sala1))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    (printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_resto_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::cambiar_a_moduloImprimir
    (not (obras_por_dia_a_rellenar $? ?o&:(> ?o 0) $?))
    =>
    (printout t "Facts: " crlf)
    (facts)
    (printout t "Cambio a moduloImprimir" crlf)
    (focus moduloImprimir)
)
