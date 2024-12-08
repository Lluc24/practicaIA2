; #######################################################
; # moduloC: MODULO DEL SOLUCION ABSTRACTA              #
; #######################################################

(defmodule moduloC (import MAIN defclass ?ALL) (import moduloB ?ALL) (export ?ALL))

(defrule moduloC::AbstraerTiempoObras
    (obras ?obras)
    (tiempo ?tiempo)
    =>
    (if (eq ?obras ?tiempo)
        then (assert (obrashora medio))
        else
        (if (eq ?obras bajo)
            then
            (if (eq ?tiempo medio)
                then (assert (obrashora lento))
                else (assert (obrashora muy_lento)))
            else
            (if (eq ?obras medio)
                then
                (if (eq ?tiempo bajo)
                    then (assert (obrashora rapido))
                    else (assert (obrashora lento)))
                else
                (if (eq ?tiempo bajo)
                    then (assert (obrashora muy_rapido))
                    else (assert (obrashora rapido)))))))

(defrule moduloC::es_turistica
    (conocimiento ?c)
    =>
    (if (eq ?c alto)
        then (assert (tipo_visita intelectual))
    else (assert (tipo_visita turistica))
    )
)

(defrule moduloC::preferencia
    (not (pref ?))
    (interes ?)
    =>
    (bind ?lista_intereses (find-all-facts ((?v interes)) TRUE))
    (bind ?trobat_epoca FALSE)
    (bind ?trobat_autor FALSE)
    (bind ?trobat_movimiento FALSE)
    (bind ?trobat_tematica FALSE)
    ; Iterate over the list of interests
    (foreach ?interes ?lista_intereses
        (bind ?interesvalue (fact-slot-value (fact-index ?interes) implied))
        ;(printout t ?interesvalue crlf)
        (if (eq (nth$ 1 ?interesvalue) epoca) then (bind ?trobat_epoca TRUE))
        (if (eq (nth$ 1 ?interesvalue) pintor) then (bind ?trobat_autor TRUE))
        (if (eq (nth$ 1 ?interesvalue) movimiento) then (bind ?trobat_movimiento TRUE))
        (if (eq (nth$ 1 ?interesvalue) tematica) then (bind ?trobat_tematica TRUE)))
    ; Build preferences list
    (bind ?preferencias (create$))
    (if (eq ?trobat_epoca TRUE) then (bind ?preferencias (create$ ?preferencias epoca)))
    (if (eq ?trobat_autor TRUE) then (bind ?preferencias (create$ ?preferencias pintor)))
    (if (eq ?trobat_movimiento TRUE) then (bind ?preferencias (create$ ?preferencias movimiento)))
    (if (eq ?trobat_tematica TRUE) then (bind ?preferencias (create$ ?preferencias tematica)))
    ; Assert the preferences as a fact
    (assert (pref ?preferencias))
    (facts)
)

(defrule moduloC::cambiar_moduloD
     (declare (salience -10))
     =>
     ;(printout t "AAAAAAAAA3" crlf)
     (focus moduloD)
)
