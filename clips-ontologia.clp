;;; ---------------------------------------------------------
;;; ProtegeCambios.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology Ontologia.ttl
;;; :Date 08/12/2024 18:46:32

(defclass Movimiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Corriente
    (is-a Movimiento)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Escuela
    (is-a Movimiento)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Estilo
    (is-a Movimiento)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Periodo_Pictorico
    (is-a Movimiento)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Epoca
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
    (multislot siglo
        (type STRING)
        (create-accessor read-write))
)

(defclass Obra
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot autor
        (type INSTANCE)
        (create-accessor read-write))
    (slot esta_en
        (type INSTANCE)
        (create-accessor read-write))
    (slot pertenece_a_la_epoca
        (type INSTANCE)
        (create-accessor read-write))
    (slot pertenece_al_movimiento
        (type INSTANCE)
        (create-accessor read-write))
    (slot tiene_tematica
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Complejidad es un valor del 0 al 10 (ambos incluidos)
    (slot complejidad
        (type INTEGER)
        (create-accessor read-write))
    ;;; Dimensiones de la obra en metros cuadrados
    (slot dimensiones
        (type FLOAT)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Popularidad es un valor natural entre 0 y 10 (ambos incluidos)
    (slot popularidad
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Pais
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Pintor
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nacionalidad
        (type INSTANCE)
        (create-accessor read-write))
    (multislot pertenece_a_la_epoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot pertenece_al_movimiento
        (type INSTANCE)
        (create-accessor read-write))
    (multislot geografia
        (type STRING)
        (create-accessor read-write))
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Popularidad es un valor natural entre 0 y 10 (ambos incluidos)
    (multislot popularidad
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Sala
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot contigua_a
        (type INSTANCE)
        (create-accessor read-write))
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Tematica
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot preferencia
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Conocimiento es un valor natural del 0 al 10 (ambos incluidos)
    (multislot conocimiento
        (type INTEGER)
        (create-accessor read-write))
    (multislot dias
        (type INTEGER)
        (create-accessor read-write))
    (multislot grupo
        (type SYMBOL)
        (create-accessor read-write))
    (multislot horas
        (type INTEGER)
        (create-accessor read-write))
    (multislot preferencias
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
    ([Gotico_Internacional] of Estilo
         (nombre  "Gotico Internacional")
    )

    ([Retrato] of Tematica
         (nombre  "Retrato")
    )

    ([Costumbrista] of Tematica
         (nombre  "Costumbrista")
    )

    ([Historico] of Tematica
         (nombre  "Historico")
    )

    ([Renacimiento_Temprano] of Epoca
         (nombre  "Renacimiento Temprano")
    )

    ([Romanticismo] of Corriente
         (nombre  "Romanticismo")
    )

    ([Alegorico] of Tematica
         (nombre  "Alegorico")
    )

    ([Gotico_Flamenco] of Escuela
         (nombre  "Gotico Flamenco")
    )

    ([Siglo_XIX] of Epoca
         (nombre  "Siglo XIX")
    )

    ([Siglo_XVII] of Epoca
         (nombre  "Siglo XVII")
    )

    ([Mitologico] of Tematica
         (nombre  "Mitologico")
    )

    ([Neoclasicismo] of Estilo
         (nombre  "Neoclasicismo")
    )

    ([Naturaleza_muerta] of Tematica
         (nombre  "Naturaleza muerta")
    )

    ([Siglo_XVIII-XIX] of Epoca
         (nombre  "Siglo XVIII-XIX")
    )

    ([Renacimiento] of Periodo_Pictorico
         (nombre  "Renacimiento")
    )

    ([Paisaje] of Tematica
         (nombre  "Paisaje")
    )

    ([Siglo_de_Oro_Espanol] of Epoca
         (nombre  "Siglo de Oro Espanol")
    )

    ([Barroco] of Estilo
         (nombre  "Barroco")
    )

    ([Religiosa] of Tematica
         (nombre  "Religiosa")
    )

    ([Biblico] of Tematica
         (nombre  "Biblico")
    )

    ([Adoracion_de_los_Reyes_Magos] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.96)
         (nombre  "Adoracion de los Reyes Magos")
         (popularidad  8)
    )

    ([Alemania] of Pais
         (nombre  "Alemania")
    )

    ([Antonello] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Antonello")
         (popularidad  6)
    )

    ([Antonio_Gisbert] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Siglo_XIX])
         (nombre  "Antonio Gisbert")
         (popularidad  7)
    )

    ([Apolo_en_la_Fragua_de_Vulcano] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  2.22)
         (nombre  "Apolo en la Fragua de Vulcano")
         (popularidad  8)
    )

    ([Autorretrato] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  0.50)
         (nombre  "Autorretrato")
         (popularidad  8)
    )

    ([Bartolome_Esteban_Murillo] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Bartolome Esteban Murillo")
         (popularidad  7)
    )

    ([Belgica] of Pais
         (nombre  "Belgica")
    )

    ([Bodegon_con_Cacharros] of Obra
         (autor  [Francisco_de_Zurbaran])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Siglo_XVII])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Naturaleza_muerta])
         (complejidad  7)
         (dimensiones  1.00)
         (nombre  "Bodegon con Cacharros")
         (popularidad  7)
    )

    ([Bodegon_con_cesto_de_frutas] of Obra
         (autor  [Caravaggio])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Naturaleza_muerta])
         (complejidad  6)
         (dimensiones  0.5)
         (nombre  "Bodegon con cesto de frutas")
         (popularidad  7)
    )

    ([Caravaggio] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Caravaggio")
         (popularidad  8)
    )

    ([Carlos_V_en_la_batalla_de_Muhlberg] of Obra
         (autor  [Tiziano])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Retrato])
         (complejidad  9)
         (dimensiones  3.32)
         (nombre  "Carlos V en la batalla de Muhlberg")
         (popularidad  9)
    )

    ([Claudio_Coello] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Siglo_XVII])
         (nombre  "Claudio Coello")
         (popularidad  7)
    )

    ([Claudio_de_Lorena] of Pintor
         (nacionalidad  [Francia])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Claudio de Lorena")
         (popularidad  7)
    )

    ([Conde-Duque_de_Olivares_a_Caballo] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Siglo_XVII])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  8)
         (dimensiones  2.64)
         (nombre  "Conde Duque de Olivares a Caballo")
         (popularidad  8)
    )

    ([Cristo_Cruzificado] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  2.10)
         (nombre  "Cristo Cruzificado")
         (popularidad  9)
    )

    ([Cristo_Muerto_Sostenido_por_un_Angel] of Obra
         (autor  [Antonello])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Siglo_XVII])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  1.3)
         (nombre  "Cristo Muerto Sostenido por un Angel")
         (popularidad  8)
    )

    ([Cristo_abrazado_a_la_cruz] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala5])
         (pertenece_a_la_epoca  [Siglo_XVII])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  1.1)
         (nombre  "Cristo abrazando a la cruz")
         (popularidad  7)
    )

    ([Cristo_recogiendo_sus_vestiduras] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XVIII-XIX])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.88)
         (nombre  "Cristo recogiendo sus vestiduras")
         (popularidad  8)
    )

    ([David_Vencedor_de_Goliat] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Biblico])
         (complejidad  8)
         (dimensiones  1.40)
         (nombre  "David Vencedor de Goliat")
         (popularidad  8)
    )

    ([Diana_y_Calisto] of Obra
         (autor  [Tiziano])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  1.3)
         (nombre  "Diana y Calisto")
         (popularidad  8)
    )

    ([Diego_Velazquez] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Siglo_de_Oro_Espanol])
         (nombre  "Diego Velazquez")
         (popularidad  10)
    )

    ([El_3_de_mayo_de_1808] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XVIII-XIX])
         (pertenece_al_movimiento  [Romanticismo])
         (tiene_tematica  [Historico])
         (complejidad  8)
         (dimensiones  2.68)
         (nombre  "El 3 de mayo de 1808")
         (popularidad  9)
    )

    ([El_Bosco] of Pintor
         (nacionalidad  [Paises_Bajos])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "El Bosco")
         (popularidad  10)
    )

    ([El_Caballero_Calavera] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  0.75)
         (nombre  "El Caballero Calavera")
         (popularidad  7)
    )

    ([El_Caballero_de_la_Mano_en_el_Pecho] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Retrato])
         (complejidad  6)
         (dimensiones  0.57)
         (nombre  "El Caballero de la Mano en el Pecho")
         (popularidad  8)
    )

    ([El_Cardenal] of Obra
         (autor  [Rafael_Sanzio])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  0.55)
         (nombre  "El Cardenal")
         (popularidad  8)
    )

    ([El_Cardenal_Infante_Don_Fernando] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  8)
         (dimensiones  1.96)
         (nombre  "El Cardenal Infante Don Fernando")
         (popularidad  8)
    )

    ([El_Descendimiento] of Obra
         (autor  [Rogier_van_der_Weyden])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Gotico_Flamenco])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  1.8)
         (nombre  "El Descendimiento")
         (popularidad  8)
    )

    ([El_Embarco_de_Santa_Paula_Romana] of Obra
         (autor  [Claudio_de_Lorena])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  2.8)
         (nombre  "El Embarco de Santa Paula Romana")
         (popularidad  7)
    )

    ([El_Expolio] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.60)
         (nombre  "El Expolio")
         (popularidad  9)
    )

    ([El_Greco] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "El Greco")
         (popularidad  8)
    )

    ([El_Jardin_de_la_Villa_Medici] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Paisaje])
         (complejidad  6)
         (dimensiones  0.81)
         (nombre  "El Jardin de la Villa Medici")
         (popularidad  7)
    )

    ([El_Jardin_de_la_Villa_Medici_en_Roma] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Paisaje])
         (complejidad  6)
         (dimensiones  0.81)
         (nombre  "El Jardin de la Villa Medici en Roma")
         (popularidad  7)
    )

    ([El_Jardin_de_las_Delicias] of Obra
         (autor  [El_Bosco])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  10)
         (dimensiones  3.9)
         (nombre  "El Jardin de las Delicias")
         (popularidad  10)
    )

    ([El_Jardin_de_las_Delicias_panel_derecho] of Obra
         (autor  [El_Bosco])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  1.3)
         (nombre  "El Jardin de las Delicias panel derecho")
         (popularidad  8)
    )

    ([El_Jardin_de_las_Delicias_panel_izquierdo] of Obra
         (autor  [El_Bosco])
         (esta_en  [Sala1])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  1.3)
         (nombre  "El Jardin de las Delicias panel izquierdo")
         (popularidad  8)
    )

    ([El_Juicio_de_Paris] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  3.6)
         (nombre  "El Juicio de Paris")
         (popularidad  8)
    )

    ([El_Lavatorio] of Obra
         (autor  [Tintoretto])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.8)
         (nombre  "El Lavatorio")
         (popularidad  7)
    )

    ([El_Pasmo_de_Sicilia] of Obra
         (autor  [Rafael_Sanzio])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  2.45)
         (nombre  "El Pasmo de Sicilia")
         (popularidad  8)
    )

    ([El_Perro] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XIX])
         (pertenece_al_movimiento  [Romanticismo])
         (tiene_tematica  [Alegorico])
         (complejidad  7)
         (dimensiones  0.6)
         (nombre  "El Perro")
         (popularidad  9)
    )

    ([El_Sueno_de_Jacob] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala6])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  2.8)
         (nombre  "El Sueno de Jacob")
         (popularidad  7)
    )

    ([El_Triunfo_de_Baco] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  2.26)
         (nombre  "El Triunfo de Baco")
         (popularidad  9)
    )

    ([El_triunfo_de_la_muerte] of Obra
         (autor  [Pieter_Bruegel_el_Viejo])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Alegorico])
         (complejidad  9)
         (dimensiones  2)
         (nombre  "El triunfo de la muerte")
         (popularidad  9)
    )

    ([Espana] of Pais
         (nombre  "Espana")
    )

    ([Fra_Angelico] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento_temprano])
         (nombre  "Fra Angelico")
         (popularidad  7)
    )

    ([Francia] of Pais
         (nombre  "Francia")
    )

    ([Francisco_Bayeu_y_Subias] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Siglo_XVIII-XIX])
         (nombre  "Francisco Bayeu y Subias")
         (popularidad  4)
    )

    ([Francisco_de_Goya] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Siglo_XVIII-XIX])
         (nombre  "Francisco de Goya")
         (popularidad  9)
    )

    ([Francisco_de_Zurbaran] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Francisco de Zurbaran")
         (popularidad  7)
    )

    ([Holanda] of Pais
         (nombre  "Holanda")
    )

    ([Italia] of Pais
         (nombre  "Italia")
    )

    ([Jose_de_Ribera] of Pintor
         (nacionalidad  [Espana])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Jose de Ribera")
         (popularidad  7)
    )

    ([Judith_en_el_Banquete_de_Holofernes] of Obra
         (autor  [Lucas_Cranach_el_Viejo])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Biblico])
         (complejidad  8)
         (dimensiones  1.52)
         (nombre  "Judith en el Banquete de Holofernes")
         (popularidad  8)
    )

    ([La_Adoracion_de_los_Magos] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.8)
         (nombre  "La Adoracion de los Magos")
         (popularidad  7)
    )

    ([La_Anunciacion] of Obra
         (autor  [Fra_Angelico])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Gotico_Internacional])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  3.11)
         (nombre  "La Anunciacion")
         (popularidad  8)
    )

    ([La_Bacanal_de_los_Andrios] of Obra
         (autor  [Tiziano])
         (esta_en  [Sala2])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  3.52)
         (nombre  "El Bacanal de los Andrios")
         (popularidad  8)
    )

    ([La_Fragua_de_Vulcano] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  2.22)
         (nombre  "La Fragua de Vulcano")
         (popularidad  9)
    )

    ([La_Immaculada_Concepcion] of Obra
         (autor  [Bartolome_Esteban_Murillo])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.8)
         (nombre  "La Immaculada Concepcion")
         (popularidad  7)
    )

    ([La_Magdalena_penitente] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (nombre  "La Magdalena penitente")
         (popularidad  7)
    )

    ([La_Maja_Desnuda] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Neoclasicismo])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  1.68)
         (nombre  "La Maja Desnuda")
         (popularidad  9)
    )

    ([La_Maja_Vestida] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Neoclasicismo])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  1.68)
         (nombre  "La Maja Vestida")
         (popularidad  9)
    )

    ([La_Natividad] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.2)
         (nombre  "La Natividad")
         (popularidad  8)
    )

    ([La_Primavera] of Obra
         (autor  [Sandro_Botticelli])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Mitologico])
         (complejidad  9)
         (dimensiones  2.07)
         (nombre  "La Primavera")
         (popularidad  8)
    )

    ([La_Rendicion_de_Breda] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala7])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Historico])
         (complejidad  9)
         (dimensiones  11.41)
         (nombre  "La Rendicion de Breda")
         (popularidad  9)
    )

    ([La_Sagrada_Familia] of Obra
         (autor  [Francisco_Bayeu_y_Subias])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  2.8)
         (nombre  "La Sagrada Familia")
         (popularidad  8)
    )

    ([La_Sagrada_Familia_del_Pajarito] of Obra
         (autor  [Bartolome_Esteban_Murillo])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  1.2)
         (nombre  "La Sagrada Familia del Pajarito")
         (popularidad  7)
    )

    ([La_Trinidad] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  4.8)
         (nombre  "La Trinidad")
         (popularidad  7)
    )

    ([La_Venus_del_Espejo] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  1.40)
         (nombre  "La Venus del Espejo")
         (popularidad  9)
    )

    ([La_Virgen_con_el_Nino_y_los_Santos] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  1.8)
         (nombre  "La Virgen con el Nino y los Santos")
         (popularidad  8)
    )

    ([La_Virgen_de_las_Rocas] of Obra
         (autor  [Leonardo_da_Vinci])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  1.8)
         (nombre  "La Virgen de las Rocas")
         (popularidad  9)
    )

    ([Las_Hilanderas] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  9)
         (dimensiones  4.0)
         (nombre  "Las Hilanderas")
         (popularidad  9)
    )

    ([Las_Meninas] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  10)
         (dimensiones  8.94)
         (nombre  "Las Meninas")
         (popularidad  10)
    )

    ([Las_Tres_Gracias] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  2.21)
         (nombre  "Las Tres Gracias")
         (popularidad  8)
    )

    ([Leonardo_da_Vinci] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Leonardo da Vinci")
         (popularidad  10)
    )

    ([Los_Desposorios_de_la_Virgen] of Obra
         (autor  [Rafael_Sanzio])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Religiosa])
         (complejidad  9)
         (dimensiones  2.3)
         (nombre  "Los Desposorios de la Virgen")
         (popularidad  9)
    )

    ([Los_Fusilamientos_de_Torrijos] of Obra
         (autor  [Antonio_Gisbert])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XIX])
         (pertenece_al_movimiento  [Romanticismo])
         (tiene_tematica  [Historico])
         (complejidad  8)
         (dimensiones  2.66)
         (nombre  "Los Fusilamientos de Torrijos")
         (popularidad  8)
    )

    ([Los_Musicos] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Costumbrista])
         (complejidad  6)
         (dimensiones  1.10)
         (nombre  "Los Musicos")
         (popularidad  7)
    )

    ([Lucas_Cranach_el_Viejo] of Pintor
         (nacionalidad  [Alemania])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Lucas Cranach el Viejo")
         (popularidad  8)
    )

    ([Paises_Bajos] of Pais
         (nombre  "Paises Bajos")
    )

    ([Peter_Paul_Rubens] of Pintor
         (nacionalidad  [Belgica])
         (pertenece_a_la_epoca  [Barroco])
         (nombre  "Peter Paul Rubens")
         (popularidad  8)
    )

    ([Pieter_Bruegel_el_Viejo] of Pintor
         (nacionalidad  [Paises_Bajos])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Pieter Brugel el Viejo")
         (popularidad  9)
    )

    ([Rafael_Sanzio] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Rafael Sanzio")
         (popularidad  9)
    )

    ([Retrato_de_Carlos_III_cazador] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XVIII-XIX])
         (pertenece_al_movimiento  [Neoclasicismo])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  2.7)
         (nombre  "Retrato de Carlos III cazador")
         (popularidad  7)
    )

    ([Retrato_de_Felipe_III_a_caballo] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala8])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  9)
         (dimensiones  3.2)
         (nombre  "Retrato de Felipe III a caballo")
         (popularidad  8)
    )

    ([Retrato_de_Felipe_IV] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  8)
         (dimensiones  2.56)
         (nombre  "Retrato de Felipe IV")
         (popularidad  8)
    )

    ([Retrato_de_Inocencio_X] of Obra
         (autor  [Diego_Velazquez])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  9)
         (dimensiones  1.40)
         (nombre  "Retrato de Inocencio X")
         (popularidad  9)
    )

    ([Retrato_de_Isabel_Clara_Eugenia] of Obra
         (autor  [Peter_Paul_Rubens])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  8)
         (dimensiones  1.8)
         (nombre  "Retrato de Isabel Clara Eugenia")
         (popularidad  7)
    )

    ([Retrato_de_Isabel_de_Borbon] of Obra
         (autor  [Claudio_Coello])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  2.08)
         (nombre  "Retrato de Isabel de Borbon")
         (popularidad  8)
    )

    ([Retrato_de_Maria_Luisa] of Obra
         (autor  [Claudio_Coello])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  2.3)
         (nombre  "Retrato de Maria Luisa")
         (popularidad  7)
    )

    ([Retrato_de_un_hombre_joven] of Obra
         (autor  [Rafael_Sanzio])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Retrato])
         (complejidad  7)
         (dimensiones  0.70)
         (nombre  "Retrato de un hombre joven")
         (popularidad  7)
    )

    ([Retrato_encuestre_del_Duque_de_Lerma] of Obra
         (autor  [Tiziano])
         (esta_en  [Sala3])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Retrato])
         (complejidad  9)
         (dimensiones  4.1)
         (nombre  "Retrato encuestre del Duque de Lerma")
         (popularidad  8)
    )

    ([Rogier_van_der_Weyden] of Pintor
         (nacionalidad  [Paises_Bajos])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Rogier van der Weyden")
         (popularidad  8)
    )

    ([Sala1] of Sala
         (contigua_a  [Sala2] [Sala3] [Sala4] [Sala5])
         (nombre  "Sala1")
    )

    ([Sala10] of Sala
         (nombre  "Sala10")
    )

    ([Sala2] of Sala
         (nombre  "Sala2")
    )

    ([Sala3] of Sala
         (contigua_a  [Sala6] [Sala8])
         (nombre  "Sala3")
    )

    ([Sala4] of Sala
         (contigua_a  [Sala8])
         (nombre  "Sala4")
    )

    ([Sala5] of Sala
         (contigua_a  [Sala8] [Sala9])
         (nombre  "Sala5")
    )

    ([Sala6] of Sala
         (contigua_a  [Sala7])
         (nombre  "Sala6")
    )

    ([Sala7] of Sala
         (contigua_a  [Sala10] [Sala8])
         (nombre  "Sala7")
    )

    ([Sala8] of Sala
         (contigua_a  [Sala9])
         (nombre  "Sala8")
    )

    ([Sala9] of Sala
         (contigua_a  [Sala10])
         (nombre  "Sala9")
    )

    ([San_Andres] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  6)
         (dimensiones  1.58)
         (nombre  "San Andres")
         (popularidad  7)
    )

    ([San_Jeronimo] of Obra
         (autor  [Jose_de_Ribera])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  2.10)
         (nombre  "San Jeronimo")
         (popularidad  8)
    )

    ([San_Juan_Bautista_en_el_desierto] of Obra
         (autor  [Caravaggio])
         (esta_en  [Sala9])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  7)
         (dimensiones  2)
         (nombre  "San Juan Bautista en el desierto")
         (popularidad  7)
    )

    ([Sandro_Botticelli] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Sandro Botticelli")
         (popularidad  8)
    )

    ([Santa_Isabel_de_Portugal] of Obra
         (autor  [Francisco_de_Zurbaran])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Barroco])
         (pertenece_al_movimiento  [Barroco])
         (tiene_tematica  [Religiosa])
         (complejidad  8)
         (dimensiones  1.72)
         (nombre  "Santa Isabel de Portugal")
         (popularidad  8)
    )

    ([Saturno_devorando_a_su_hijo] of Obra
         (autor  [Francisco_de_Goya])
         (esta_en  [Sala10])
         (pertenece_a_la_epoca  [Siglo_XIX])
         (pertenece_al_movimiento  [Romanticismo])
         (tiene_tematica  [Mitologico])
         (complejidad  7)
         (dimensiones  1.46)
         (nombre  "Saturno devorando a su hijo")
         (popularidad  9)
    )

    ([Tintoretto] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Tintoretto")
         (popularidad  8)
    )

    ([Tiziano] of Pintor
         (nacionalidad  [Italia])
         (pertenece_a_la_epoca  [Renacimiento])
         (nombre  "Tiziano")
         (popularidad  8)
    )

    ([Venus_y_Adonis] of Obra
         (autor  [Tiziano])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Mitologico])
         (complejidad  8)
         (dimensiones  1.8)
         (nombre  "Venus y Adonis")
         (popularidad  8)
    )

    ([Vista_de_Toledo] of Obra
         (autor  [El_Greco])
         (esta_en  [Sala4])
         (pertenece_a_la_epoca  [Renacimiento])
         (pertenece_al_movimiento  [Renacimiento])
         (tiene_tematica  [Paisaje])
         (complejidad  8)
         (dimensiones  1.30)
         (nombre  "Vista de Toledo")
         (popularidad  8)
    )

)