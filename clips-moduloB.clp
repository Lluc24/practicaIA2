; #######################################################
; # moduloB: MODULO DEL PROBLEMA ABSTRACTO              #
; #######################################################

(defmodule moduloB (import MAIN defclass ?ALL))

(defrule moduloB::no_hay_visita
     (not (object (is-a Visita)))
     =>
     (printout t "Creando la instancia visita" crlf)
     (bind ?visita (make-instance visita of Visita))
     (send ?visita put-dias 1)
     (send ?visita put-horas 1)
     (send ?visita put-conocimiento 0)
     (send ?visita put-num_obras 1)
     (send ?visita put-preferencias "Biblico" "Leonardo da Vinci" "Siglo de Oro Espanol" "Neoclasicismo")
     (send ?visita put-grupo 1)
)

(defrule moduloB::regla_hay_preferencias_pintor
     (not (interes $? ?var&:(eq ?var pintor) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Pintor) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (printout t "Existe una con preferencia de pintor (" ?p ")" crlf)
     (assert (interes pintor))
)

(defrule moduloB::regla_hay_preferencias_movimiento
     (not (interes $? ?var&:(eq ?var movimiento) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Movimiento) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (printout t "Existe una con preferencia de movimiento (" ?p ")" crlf)
     (assert (interes movimiento))
)

(defrule moduloB::regla_hay_preferencias_epoca
     (not (interes $? ?var&:(eq ?var epoca) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Epoca) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (printout t "Existe una con preferencia de epoca (" ?p ")" crlf)
     (assert (interes epoca))
)

(defrule moduloB::regla_hay_preferencias_tematica
     (not (interes $? ?var&:(eq ?var tematica) $?))
     (object (is-a Visita) (preferencias $? ?p $?))
     (object (is-a Tematica) (nombre ?nombre))
     (test (eq (str-compare ?nombre ?p) 0))
     =>
     (printout t "Existe una con preferencia de tematica (" ?p ")" crlf)
     (assert (interes tematica))
)

(defrule moduloB::regla_num_obras
     (not (obras ?))
     (object (is-a Visita) (num_obras ?num))
     =>
     (if (<= ?num 20)
          then (assert (obras pocas))
          else (if (<= ?num 40)
               then (assert (obras normal))
               else (assert (obras muchas))
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
     (if (> (length$ crios_o_jubilados) 0)
          then (assert (descansos si))
          else (assert (descansos no))
     )
)