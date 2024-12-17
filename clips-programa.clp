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

; #######################################################
; # moduloA: MODULO DEL PROBLEMA CONCRETO               #
; #######################################################

(defmodule MAIN (export ?ALL))

(defmodule moduloA (import MAIN defclass ?ALL))

(defrule MAIN::regla_inicial
     (test (eq TRUE TRUE))
     =>
     ;(printout t "Facts:" crlf)
     ;(facts)
     ;(printout t "Cambio a moduloA" crlf)
     (focus moduloA)
)

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
     (bind ?ret (entrar_entero "Cuantas personas sois?" 1 100))
     (if (entrar_pregunta_binaria "Hay ninos?")
     then (bind ?ret ?ret crios)
     )
     (if (entrar_pregunta_binaria "Hay jubilados?")
     then (bind ?ret ?ret jubilados)
     )
     ?ret
)

(deffunction moduloA::entrar_preferencia
     (?clase)
     (bind ?instancias (find-all-instances ((?instance ?clase)) TRUE))
     (bind ?i 1)
     (progn$ (?v $?instancias)
     (printout t "[" ?i "] " (nth$ 1(send ?v get-nombre)) crlf)
     (bind ?i (+ ?i 1))
     )
     (printout t "[" ?i "] No anadir la preferencia" crlf)
     (bind ?elegido (read))
     (if (and (> ?elegido 0) (< ?elegido ?i)) 
          then 
               (bind ?ret (nth$ ?elegido ?instancias))
               (bind ?ret (nth$ 1 (send ?ret get-nombre)))
               ?ret
          else 
               (entrar_preferencia ?clase)
     )
)

(deffunction moduloA::entrar_todas_las_preferencias
     ()
     (bind ?preferencias (create$ ))
     (printout t "Que tipo de preferencia quiere anadir?" crlf)
     (printout t "[1] Preferencia por algun autor" crlf)
     (printout t "[2] Preferencia por alguna tematica" crlf)
     (printout t "[3] Preferencia por algun movimiento" crlf)
     (printout t "[4] Preferencia por alguna epoca" crlf)
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
     (case 5 then ?preferencias)
     (default (entrar_todas_las_preferencias))
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
     (assert (dias (entrar_entero "En cuantos dias desea visitar el museo?" 1 3)))
)

(defrule moduloA::entrar_horas
     (not (horas ?))
     =>
     (assert (horas (entrar_entero "Cuantas horas quiere que dure una visita de un dia?" 1 8)))
)

(defrule moduloA::entrar_grupo
     (not (grupo ?))
     =>
     (assert (grupo (entrar_tipo_de_grupo)))
)

(defrule moduloA::entrar_conocimiento
     (not (conocimiento ?))
     =>
     (assert (conocimiento (entrar_entero "Que grado de conocimiento en arte tiene?" 0 10)))
)


(defrule moduloA::asignar_a_visita
     (conocimiento ?conocimiento)
     (dias ?dias)
     (horas ?horas)
     (preferencia $?preferencia)
     (grupo $?grupo)
     =>
     (bind ?v (make-instance VISITA of Visita))
     (send ?v put-conocimiento ?conocimiento)
     (send ?v put-dias ?dias)
     (send ?v put-horas ?horas)
     (send ?v put-preferencias ?preferencia)
     (send ?v put-grupo ?grupo)
)

(defrule moduloA::cambiar_a_moduloB
     (object (is-a Visita) (conocimiento ?) (dias ?) (horas ?) (preferencias $?) (grupo $?))
     =>
     ;(printout t "Facts: " crlf)
     ;(facts)
     ;(printout t "Cambio a moduloB" crlf)
     (focus moduloB)
)

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

; #######################################################
; # moduloC: MODULO DE LA SOLUCION ABSTRACTA            #
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
)

(defrule moduloC::cambiar_moduloD
     (declare (salience -10))
     =>
     ;(printout t "Facts: " crlf)
     ;(facts)
     ;(printout t "Cambio a moduloD" crlf)
     (focus moduloD)
)

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
    (pref $? ?p&:(eq ?p pintor) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_autores_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_turistica_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p pintor) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_autores_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_intelectual_misma_sala
    (pref $? ?p&:(eq ?p pintor) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_autores_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_autores_intelectual_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p pintor) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_autores_intelectual_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_turistica_misma_sala
    (pref $? ?p&:(eq ?p tematica) $?)
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_tematica $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Tematica) (name ?tematica) (nombre ?preferencia_por_tematica))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (popularidad ?popularidad) (tiene_tematica ?tematica) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (tiene_tematica ?tematica) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?tematica " ubicada en " ?sala " por la regla_rellenar_tematicas_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_turistica_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p tematica) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?tematica " ubicada en " ?sala1 " por la regla_rellenar_tematicas_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_intelectual_misma_sala
    (pref $? ?p&:(eq ?p tematica) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?tematica " ubicada en " ?sala " por la regla_rellenar_tematicas_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_tematicas_intelectual_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p tematica) $?)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?tematica " ubicada en " ?sala1 " por la regla_rellenar_tematicas_intelectual_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_movimientos_turistica_misma_sala
    (pref $? ?p&:(eq ?p movimiento) $?)
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_movimiento $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Movimiento) (name ?movimiento) (nombre ?preferencia_por_movimiento))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (popularidad ?popularidad) (pertenece_al_movimiento ?movimiento) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_al_movimiento ?movimiento) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?movimento " ubicada en " ?sala " por la regla_rellenar_movimientos_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_movimientos_turistica_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p movimiento) $?)
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_movimiento $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Movimiento) (name ?movimiento) (nombre ?preferencia_por_movimiento))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (popularidad ?popularidad) (esta_en ?sala1) (pertenece_al_movimiento ?movimiento))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad)) (pertenece_al_movimiento ?movimiento)))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?movimiento " ubicada en " ?sala1 " por la regla_rellenar_movimientos_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_movimientos_intelectual_misma_sala
    (pref $? ?p&:(eq ?p movimiento) $?)
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_movimiento $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Movimiento) (name ?movimiento) (nombre ?preferencia_por_movimiento))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (complejidad ?complejidad) (esta_en ?sala) (pertenece_al_movimiento ?movimiento))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_al_movimiento ?movimiento) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?movimiento " ubicada en " ?sala " por la regla_rellenar_movimientos_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_movimientos_intelectual_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p movimiento) $?)
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_movimiento $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Movimiento) (name ?movimiento) (nombre ?preferencia_por_movimiento))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (complejidad ?complejidad) (esta_en ?sala1) (pertenece_al_movimiento ?movimiento))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_al_movimiento ?movimiento) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?movimiento " ubicada en " ?sala1 " por la regla_rellenar_movimientos_intelectual_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_epocas_turistica_misma_sala
    (pref $? ?p&:(eq ?p epoca) $?)
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_epoca $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Epoca) (name ?epoca) (nombre ?preferencia_por_epoca))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (popularidad ?popularidad) (pertenece_a_la_epoca ?epoca) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_a_la_epoca ?epoca) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?epoca " ubicada en " ?sala " por la regla_rellenar_epocas_turistica_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_epocas_turistica_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p epoca) $?)
    (tipo_visita ?tipo&:(eq ?tipo turistica))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_epoca $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Epoca) (name ?epoca) (nombre ?preferencia_por_epoca))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (popularidad ?popularidad) (esta_en ?sala1) (pertenece_a_la_epoca ?epoca))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (popularidad ?popularidad2&:(> ?popularidad2 ?popularidad)) (pertenece_a_la_epoca ?epoca)))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?epoca " ubicada en " ?sala1 " por la regla_rellenar_epocas_turistica_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_epocas_intelectual_misma_sala
    (pref $? ?p&:(eq ?p epoca) $?)
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_epoca $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Epoca) (name ?epoca) (nombre ?preferencia_por_epoca))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (complejidad ?complejidad) (esta_en ?sala) (pertenece_a_la_epoca ?epoca))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_a_la_epoca ?epoca) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?epoca " ubicada en " ?sala " por la regla_rellenar_epocas_intelectual_misma_sala" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_epocas_intelectual_sala_contigua
    (declare (salience -10))
    (pref $? ?p&:(eq ?p epoca) $?)
    (tipo_visita ?tipo&:(eq ?tipo intelectual))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    (object (is-a Visita) (preferencias $? ?preferencia_por_epoca $?))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    (object (is-a Sala) (name ?sala1) (contigua_a $?contiguas1))
    (object (is-a Sala) (name ?sala2&:(not (eq ?sala1 ?sala2))) (contigua_a $?contiguas2))
    (test (or (member$ ?sala1 ?contiguas2) (member$ ?sala2 ?contiguas1)))

    (object (is-a Epoca) (name ?epoca) (nombre ?preferencia_por_epoca))
    ?instancia_obra <- (object (is-a Obra) (name ?obra) (complejidad ?complejidad) (esta_en ?sala1) (pertenece_a_la_epoca ?epoca))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    
    (not (object (is-a Obra) (pertenece_a_la_epoca ?epoca) (complejidad ?complejidad2&:(> ?complejidad2 ?complejidad))))

    ?obra_previa <- (object (is-a Obra) (esta_en ?sala2))
    (test (or (eq (length$ ?cjt_obras) 0) (eq ?obra_previa (nth$ (length$ ?cjt_obras) ?cjt_obras))))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?epoca " ubicada en " ?sala1 " por la regla_rellenar_epocas_intelectual_sala_contigua" crlf)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_resto_misma_sala" crlf)
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
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala1 " por la regla_rellenar_resto_sala_contigua" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::regla_rellenar_random
    (declare (salience -200))
    ?obras_por_dia_a_rellenar <- (obras_por_dia_a_rellenar $?slice1 ?dia_objetivo&:(> ?dia_objetivo 0) $?slice2)
    (test (or (eq (length$ ?slice1) 0) (eq (nth$ (length$ ?slice1) ?slice1) 0)))
    ?obras_recorrido <- (obras_recorrido $?cjt_obras)

    ?instancia_obra <- (object (is-a Obra) (name ?obra) (autor ?pintor) (esta_en ?sala))
    (test (eq (length$ (find-all-instances ((?v Obra)) (< (frecuencia ?v ?cjt_obras) (frecuencia ?instancia_obra ?cjt_obras)))) 0))
    =>
    ;(printout t "Se inserta la obra " ?obra " de " ?pintor " ubicada en " ?sala " por la regla_rellenar_random" crlf)
    (retract ?obras_recorrido)
    (assert (obras_recorrido ?cjt_obras ?instancia_obra))
    (retract ?obras_por_dia_a_rellenar)
    (assert (obras_por_dia_a_rellenar ?slice1 (- ?dia_objetivo 1) ?slice2))
)

(defrule moduloD::cambiar_a_moduloImprimir
    (not (obras_por_dia_a_rellenar $? ?o&:(> ?o 0) $?))
    =>
    ;(printout t "Facts: " crlf)
    ;(facts)
    ;(printout t "Cambio a moduloImprimir" crlf)
    (focus moduloImprimir)
)

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

