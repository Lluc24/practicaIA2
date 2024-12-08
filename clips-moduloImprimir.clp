; ###########################################################################
; # moduloImprimir: MODULO DE IMPRESION DE LA SOLUCION CONCRETA             #
; ###########################################################################

(defmodule moduloImprimir (import MAIN defclass ?ALL) (import moduloD ?ALL))

(deffunction moduloImprimir::imprimir_solucion
    (?num_obras_dia ?cjt_obras)
    (bind ?i 0)
    (bind ?num_dias (length$ ?num_obras_dia))
    (printout t "El recorrido de una visita diaria esta compuesto por salas. Para cada sala, se indica los cuadros a ver" crlf)
    (loop-for-count (?x 1 ?num_dias)
        (printout t "Dia " ?x crlf)
        (bind ?dia_objetivo (nth$ ?x ?num_obras_dia))
        (loop-for-count (?y 1 ?dia_objetivo) do
            (if (or (eq ?y 1) (eq (mod ?i 7) 0))
                then (printout t "Sala " (integer (/ ?i 7)) crlf)
            )
            (bind ?i (+ ?i 1))
            (bind ?obra (nth$ ?i ?cjt_obras))
            (printout t "La obra " (nth$ 1 (send ?obra get-nombre)) " de " (send ?obra get-autor) crlf)
        )
    )
)

(defrule moduloImprimir::regla_imprimir
    (num_obras_dia $?num_obras_dia)
    (obras_recorrido $?cjt_obras)
    =>
    (imprimir_solucion ?num_obras_dia ?cjt_obras)
)
