; ###########################################################################
; # moduloImprimir: MODULO DE IMPRESION DE LA SOLUCION CONCRETA             #
; ###########################################################################

(defmodule moduloImprimir (import MAIN defclass ?ALL) (import moduloD ?ALL))

(deffunction moduloImprimir::imprimir_solucion
    (?obras_por_dia ?cjt_obras)
    (bind ?i 0)
    (bind ?num_dias (length$ ?obras_por_dia))
    (printout t "#####################################################" crlf)
    (printout t "El recorrido de una visita diaria esta compuesto por salas. Para cada sala, se indica los cuadros a ver" crlf)
    (loop-for-count (?x 1 ?num_dias)
        (printout t "Dia " ?x crlf)
        (bind ?obras_por_dia_objetivo (nth$ ?x ?obras_por_dia))
        (loop-for-count (?y 1 ?obras_por_dia_objetivo) do
            (bind ?i (+ ?i 1))
            (bind ?obra (nth$ ?i ?cjt_obras))
            (bind ?sala (send ?obra get-esta_en))
            (if (or (eq ?y 1) (not (eq ?sala (send (nth$ (- ?i 1) ?cjt_obras) get-esta_en))))
                then (printout t "En la " ?sala " ver:" crlf)
            )
            (printout t "La obra [" (send ?obra get-nombre) "] de " (send ?obra get-autor) crlf)
        )
    )
    (printout t "#####################################################" crlf)
)

(defrule moduloImprimir::regla_imprimir
    (obras_por_dia $?obras_por_dia)
    (obras_recorrido $?cjt_obras)
    =>
    (imprimir_solucion ?obras_por_dia ?cjt_obras)
)
