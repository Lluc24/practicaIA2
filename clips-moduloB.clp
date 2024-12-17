; #######################################################
; # moduloB: MODULO DEL PROBLEMA ABSTRACTO              #
; #######################################################

(defmodule moduloB (import MAIN defclass ?ALL) (export ?ALL))

(defrule moduloB::regla_hay_preferencias_pintor
     (not (interes $? ?var&:(eq ?var pintor) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Pintor) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (assert (interes pintor))
)

(defrule moduloB::regla_hay_preferencias_movimiento
     (not (interes $? ?var&:(eq ?var movimiento) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Movimiento) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (assert (interes movimiento))
)

(defrule moduloB::regla_hay_preferencias_epoca
     (not (interes $? ?var&:(eq ?var epoca) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Epoca) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (assert (interes epoca))
)

(defrule moduloB::regla_hay_preferencias_tematica
     (not (interes $? ?var&:(eq ?var tematica) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Tematica) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (assert (interes tematica))
)

(defrule moduloB::regla_num_obras
     (not (obras ?))
     (object (is-a Visita) (dias ?dias) (horas ?horas) (grupo ?tam_grupo $?crios_o_jubilados) (preferencias $?prefs))
     =>
     (bind ?puntuacion 0)
     (if (>= ?dias 4)
          then (bind ?puntuacion (+ ?puntuacion 2))
          else (if (>= ?dias 2)
               then (bind ?puntuacion (+ ?puntuacion 1))
          )
     )
     (if (>= ?horas 9)
          then (bind ?puntuacion (+ ?puntuacion 2))
          else (if (>= ?horas 5)
               then (bind ?puntuacion (+ ?puntuacion 1))
          )
     )
     (if (< (string-to-field (str-cat ?tam_grupo)) 4)
          then (bind ?puntuacion (+ ?puntuacion 2))
          else (if (< (string-to-field (str-cat ?tam_grupo)) 10)
               then (bind ?puntuacion (+ ?puntuacion 1))
          )
     )
     (bind ?puntuacion (- 2 (length$ ?crios_o_jubilados)))
     (if (>= (length$ ?prefs) 10)
          then (bind ?puntuacion (+ ?puntuacion 2))
          else (if (>= (length$ ?prefs) 5)
               then (bind ?puntuacion (+ ?puntuacion 1))
          )
     )
     (if (>= ?puntuacion 7)
          then (assert (obras alto))
          else (if (>= ?puntuacion 4)
               then (assert (obras medio))
               else (assert (obras bajo))
          )
     )
)


(defrule moduloB::regla_conocimiento
     (not (conocimiento ?))
     (object (is-a Visita) (conocimiento ?conocimiento))
     => 
     (if (<= ?conocimiento 3)
          then (assert (conocimiento bajo))
          else (if (<= ?conocimiento 7)
               then (assert (conocimiento medio))
               else (assert (conocimiento alto))
          ) 
     
     )
)

(defrule moduloB::regla_tiempo
     (not (tiempo ?))
     (object (is-a Visita) (horas ?horas))
     =>
     (if (<= ?horas 3)
          then (assert (tiempo bajo))
          else (if (<= ?horas 6)
               then (assert (tiempo medio))
               else (assert (tiempo alto))
          )
     )
)

(defrule moduloB::regla_descansos
     (not (descansos ?))
     (object (is-a Visita) (grupo ? $?crios_o_jubilados))
     =>
     (if (> (length$ ?crios_o_jubilados) 0)
          then (assert (descansos si))
          else (assert (descansos no))
     )
)

(defrule moduloB::cambiar_a_moduloC
     (declare (salience -10))
     (tiempo ?)
     (descansos ?)
     (conocimiento ?)
     (obras ?)
     =>
     ;(printout t "Facts: " crlf)
     ;(facts)
     ;(printout t "Cambio a moduloC" crlf)
     (focus moduloC)
)