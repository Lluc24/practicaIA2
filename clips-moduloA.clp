; #######################################################
; # moduloA: MODULO DEL PROBLEMA CONCRETO               #
; #######################################################

(defmodule MAIN (export ?ALL))

(defmodule moduloA (import MAIN ?ALL) (export ?ALL))

(deffunction moduloA::entrar_entero
     (?pregunta ?valor_min ?valor_max)
     (printout t ?pregunta " El valor debe estar entre " ?valor_min " y " ?valor_max " (ambos incluidos)" crlf)
     (bind ?respuesta (read))
     (if (or (< ?respuesta ?valor_min) (> ?respuesta ?valor_max))
     then (entrar_entero ?pregunta ?valor_min ?valor_max)
     else ?respuesta
     )
)

(deffunction moduloA::entrar_pregunta_binaria
     (?str)
     (printout t ?str " [Si/No]" crlf)
     (bind ?respuesta (read))
     (if (eq ?respuesta Si)
     then TRUE
     else (if (eq ?respuesta No)
          then FALSE
          else (entrar_pregunta_binaria ?str)
     )
     )
)

(deffunction moduloA::entrar_tipo_de_grupo
     ()
     (bind ?ret (entrar_entero "¿Cuantas personas sois?" 1 100))
     (if (entrar_pregunta_binaria "¿Hay niños?")
     then (bind ?ret ?ret crios)
     )
     (if (entrar_pregunta_binaria "¿Hay jubilados?")
     then (bind ?ret ?ret jubilados)
     )
     ?ret
)
;no se usa
(deffunction moduloA::que_clase_es
     (?nombre_desconocido)
     (printout t ?nombre_desconocido crlf)
     (bind ?trobat FALSE)

     ;mira si es pintor
     (bind ?instancias (find-all-instances ((?instance Pintor)) TRUE))
     (bind ?i 1)
     (while (and (eq ?trobat FALSE) (<= ?i (length$ ?instancias)))
          do
          (bind ?instancia (nth$ ?i ?instancias))
          (printout t (nth$ 1 (send ?instancia get-nombre)) crlf)
          (if (eq ?nombre_desconocido (nth$ 1 (send ?instancia get-nombre)))
               then (bind ?trobat TRUE)
          )
          (bind ?i (+ ?i 1))
     )
     (printout t ?i (length$ ?instancias)) 
     (if (eq ?trobat TRUE)
     
          then Pintor
     )
     
     ;mira si es obra
     (bind ?instancias (find-all-instances ((?instance Tematica)) TRUE))
     (bind ?i 1)
     (while (and (eq ?trobat FALSE) (<= ?i (length$ ?instancias)))
          do
          ;(printout t (send ?instancias get-nombre) clrf)
          (bind ?instancia (nth$ ?i ?instancias))
          (printout t (nth$ 1 (send ?instancia get-nombre)) crlf)
          (if (eq ?nombre_desconocido (nth$ 1 (send ?instancia get-nombre)))
               then (bind ?trobat TRUE)
          )
          (bind ?i (+ ?i 1))
     )
     (printout t ?i (length$ ?instancias))
     (if (eq ?trobat TRUE)
          then Tematica
     )
     
     ;mira si es obra
     (bind ?instancias (find-all-instances ((?instance Movimiento)) TRUE))
     (bind ?i 1)
     (while (and (eq ?trobat FALSE) (<= ?i (length$ ?instancias)))
          do
          ;(printout t (send ?instancias get-nombre) clrf)
          (bind ?instancia (nth$ ?i ?instancias))
          (printout t (nth$ 1 (send ?instancia get-nombre)) crlf)
          (if (eq ?nombre_desconocido (nth$ 1 (send ?instancia get-nombre)))
               then (bind ?trobat TRUE)
          )  
          (bind ?i (+ ?i 1))
     )
     (printout t ?i (length$ ?instancias))
     (if (eq ?trobat TRUE)
          then Movimiento
     )

     Epoca
)

(deffunction moduloA::entrar_preferencia
     (?clase)
     (bind ?instancias (find-all-instances ((?instance ?clase)) TRUE))
     (bind ?i 1)
     (progn$ (?v $?instancias)
     (printout t "[" ?i "] " (nth$ 1(send ?v get-nombre)) crlf)
     (bind ?i (+ ?i 1))
     )
     (printout t "[" ?i "] No añadir la preferencia" crlf)
     (bind ?elegido (read))
     (if(neq ?i ?elegido) then 
     (bind ?ret (nth$ ?elegido ?instancias))
     (bind ?ret (nth$ 1 (send ?ret get-nombre)))
     ?ret   
     )
)

(deffunction moduloA::entrar_todas_las_preferencias
     ()
     (bind ?preferencias (create$ ))
     (printout t "¿Que tipo de preferencia quiere añadir?" crlf)
     (printout t "[1] Preferencia por algun autor" crlf)
     (printout t "[2] Preferencia por alguna tematica" crlf)
     (printout t "[3] Preferencia por algun movimiento" crlf)
     (printout t "[4] Preferencia por alguna epoca" crlf)
     ;(printout t "[5] Preferencia por obras de paises concretos" crlf)
     (printout t "[5] No hay mas preferencias" crlf)
     (bind ?num (read))
     (switch ?num
     (case 1 then 
          (bind ?preferencias (create$ ?preferencias (entrar_preferencia Pintor)))
          (bind ?preferencias (create$ ?preferencias (entrar_todas_las_preferencias)))    
          )
     (case 2 then
          (bind ?preferencias (create$ ?preferencias (entrar_preferencia Tematica)))
          (bind ?preferencias (create$ ?preferencias (entrar_todas_las_preferencias)))    
          )
     (case 3 then
          (bind ?preferencias (create$ ?preferencias (entrar_preferencia Movimiento)))
          (bind ?preferencias (create$ ?preferencias (entrar_todas_las_preferencias)))    
     )
     (case 4 then 
          (bind ?preferencias (create$ ?preferencias (entrar_preferencia Epoca)))
          (bind ?preferencias (create$ ?preferencias (entrar_todas_las_preferencias)))    
     )
     ;(case 5 then
     ;    (bind ?preferencias ?preferencias (entrar_preferencia ?paises) (entrar_todas_las_preferencias))
     ;)
     (case 5 then ?preferencias)
     (default (entrar_todas_las_preferencias))
     )
)

(defrule moduloA::Solucion
     (conocimiento_filtrado ?c)
     (tiempoObras ?t)
     =>
     (if (or (eq ?t BAJO) (eq ?c BAJO))
     then 
     (assert (solucion_profundidad BAJA))
     else 
     (if (or (eq ?t MEDIO) (eq ?c MEDIO))
          then 
          (assert (solucion_profundidad MEDIA))
     else 
          (assert (solucion_profundidad ALTA))
     )
     )
)


(defrule moduloA::AbstraerConocimiento
     (conocimiento ?conocimiento)
     => 
     (if (< ?conocimiento 4)
     then (assert (conocimiento_filtrado BAJO))
     else (if (< ?conocimiento 7)
          then (assert (conocimiento_filtrado MEDIO))
          else (assert (conocimiento_filtrado ALTO))
          ) 
     
     )
)

(defrule moduloA::AbstraerTiempoObras
     (numero_obras ?numero_obras)
     (horas ?horas)
     =>
     (if (< (/ ?numero_obras ?horas) 66) 
     then 
     (assert (tiempoObras ALTO))
     else 
     (if (< (/ ?numero_obras ?horas) 133)
          then (assert (tiempoObras MEDIO))
     else (assert (tiempoObras BAJO))     
     )
     )
)

(defrule moduloA::entrar_preferencias
     (not (preferencia ?))
     =>
     (assert (preferencia (entrar_todas_las_preferencias)))
)

(defrule moduloA::entrar_dias
     (not (dias ?))
     =>
     (assert (dias (entrar_entero "¿En cuantos dias desea visitar el museo?" 1 5)))
)

(defrule moduloA::entrar_horas
     (not (horas ?))
     =>
     (assert (horas (entrar_entero "¿Cuantas horas quiere que dure una visita de un dia?" 1 12)))
)

(defrule moduloA::entrar_grupo
     (not (grupo ?))
     =>
     (assert (grupo (entrar_tipo_de_grupo)))
)

(defrule moduloA::entrar_conocimiento
     (not (conocimiento ?))
     =>
     (assert (conocimiento (entrar_entero "¿Que grado de conocimiento en arte tiene?" 0 10)))
)

(defrule moduloA::entrar_numero_obras
     (not (numero_obras ?))
     =>
     (assert (numero_obras (entrar_entero "¿Cuantas obras quieres ver por dia?" 1 200)))
)


(defrule moduloA::asignar_a_visita
     (conocimiento ?conocimiento)
     (dias ?dias)
     (horas ?horas)
     (numero_obras ?num_obras)
     (preferencia $?preferencia)
     (grupo $?grupo)
     =>
     (bind ?v (make-instance VISITA of Visita))
     (send ?v put-conocimiento ?conocimiento)
     (send ?v put-dias ?dias)
     (send ?v put-horas ?horas)
     (send ?v put-num_obras ?num_obras)
     (send ?v put-preferencias ?preferencia)
     (send ?v put-grupo ?grupo)
)