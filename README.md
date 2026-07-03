# Museum Visit Planner — A Knowledge-Based System in CLIPS

![CLIPS](https://img.shields.io/badge/CLIPS-6.30-blue)
![Ontology](https://img.shields.io/badge/Ontology-OWL%2FTurtle-orange)
![Editor](https://img.shields.io/badge/Editor-Prot%C3%A9g%C3%A9-9cf)
![Paradigm](https://img.shields.io/badge/Paradigm-Rule--Based%20Expert%20System-green)
![Domain](https://img.shields.io/badge/Domain-Museo%20del%20Prado-b8860b)

A rule-based **Knowledge-Based System (KBS)** that plans a personalized, multi-day museum itinerary through the **Museo del Prado**, given a visitor's time budget, group composition, art knowledge, and preferences (favorite painters, themes, movements, or eras).

Built with **CLIPS** (rule engine) and an **OWL ontology** (authored in **Protégé**) that models 75 artworks, their painters, movements, eras, themes, and the museum's 10 rooms.

---

## Table of contents

- [The problem](#the-problem)
- [Why a Knowledge-Based System?](#why-a-knowledge-based-system)
- [Why is this problem hard? (NP-hardness)](#why-is-this-problem-hard-np-hardness)
- [Why CLIPS and rule-based programming?](#why-clips-and-rule-based-programming)
- [What is an ontology, and why build one?](#what-is-an-ontology-and-why-build-one)
- [System architecture](#system-architecture)
- [The reasoning pipeline](#the-reasoning-pipeline)
- [Repository structure](#repository-structure)
- [How to run it](#how-to-run-it)
- [Example run](#example-run)
- [Sources](#sources)

---

## The problem

Museums are a major cultural attraction, but planning an efficient visit is hard: large collections spanning multiple centuries, styles and themes have to be reduced to a route that fits a visitor's available time. A good itinerary must:

- Select and prioritize artworks that match the visitor's interests.
- Fit exactly the time available (neither too little content, causing boredom, nor too much, causing fatigue or a rushed visit).
- Minimize unnecessary walking between rooms, keeping the route physically coherent.
- Adapt to group composition — families with children, retirees, solo art enthusiasts, school groups, tourists on a tight schedule, etc.

The system asks the visitor a short series of questions (days available, hours per day, group size/composition, art knowledge, and any preferences for painters, themes, movements, or eras) and outputs a day-by-day itinerary: which rooms to visit, in what order, and which specific paintings to see in each.

## Why a Knowledge-Based System?

A generic search/optimization technique (e.g. heuristic search like Hill Climbing) is not enough here, because the difficulty isn't just about search — it's about **domain expertise**: knowing what makes a Baroque room "religious and mythological," which painters define a movement, or why a family with children needs shorter, less dense routes. That expertise needs to be captured explicitly, not learned or guessed.

A **Knowledge-Based System (KBS)** is the natural fit:

- **Ontology** — unifies the vocabulary and structure of the domain (artworks, painters, movements, eras, themes, rooms) so the system reasons over well-defined concepts, not free text.
- **Production rules** — encode expert heuristics ("a Baroque enthusiast is shown Caravaggio and Rubens," "if there are children or retirees, plan rest breaks") as declarative `IF ... THEN ...` statements that a rule engine can chain automatically.

This separation — declarative knowledge (ontology) + inference rules (CLIPS) — is exactly what a KBS provides, and it scales far better than hardcoding an ad-hoc planning algorithm.

## Why is this problem hard? (NP-hardness)

Building an optimal museum itinerary is structurally a **constrained assignment / routing problem**: choosing *which* subset of artworks to include, *in what order*, and *through which rooms*, while respecting a time budget and maximizing a personalized satisfaction score, is a variant of the **[Orienteering Problem](https://en.wikipedia.org/wiki/Orienteering_problem)** (a generalization of the Traveling Salesman Problem where you select a profitable subset of nodes under a budget constraint, rather than visiting all of them).

Both TSP and the Orienteering Problem are **NP-hard**: the number of possible room orderings and artwork subsets grows combinatorially with the size of the collection, so no known algorithm finds the *exact* optimum in polynomial time for realistic input sizes.

Since an exhaustive or exact search is infeasible, this project instead uses **heuristic classification** (see [The reasoning pipeline](#the-reasoning-pipeline)): abstract the concrete problem into a small set of known *problem archetypes*, associate each archetype with a *solution archetype* via expert rules, and then refine that abstract solution into a concrete, good-enough itinerary. This trades global optimality for a fast, explainable, expert-driven approximation — the classic approach for NP-hard problems in classical AI when a full search is not viable.

## Why CLIPS and rule-based programming?

[CLIPS](https://www.clipsrules.net/) (C Language Integrated Production System) is a mature, forward-chaining rule engine purpose-built for expert systems, and was chosen for four reasons:

1. **Native production rules** — the domain knowledge here *is* a set of `IF condition THEN action` heuristics (e.g. "if the visit is intellectual and there's a painter preference, prioritize the most complex works by that painter"). CLIPS lets these be expressed directly and legibly.
2. **Forward-chaining inference engine** — CLIPS' Rete-based engine automatically determines which rules apply to the current facts and fires them in the right order, without the program needing to hand-write control flow for every case.
3. **COOL (CLIPS Object-Oriented Language)** — the ontology's classes (`Obra`, `Pintor`, `Sala`, `Visita`...) map directly onto CLIPS `defclass`/`definstances`, so the same knowledge model drives both the static domain data and the dynamic reasoning.
4. **Modularity via `defmodule`** — the system is split into five focused modules (see below) that hand off control to one another, keeping each rule set small and independently understandable — instead of one monolithic ruleset.

## What is an ontology, and why build one?

An **ontology** is a formal, explicit specification of the concepts in a domain, their attributes, and the relationships between them — a shared vocabulary that both humans and machines can reason over unambiguously. Here, the ontology defines classes such as `Obra` (artwork), `Pintor` (painter), `Sala` (room), `Epoca` (era), `Tematica` (theme), and `Movimiento` (movement, specialized into `Corriente`/`Escuela`/`Estilo`/`Periodo_Pictorico`), along with relations like `pertenece_al_movimiento`, `esta_en`, `contigua_a` (room adjacency), and `tiene_tematica`.

Using an ontology instead of ad-hoc data structures gives the reasoning rules a **stable, typed vocabulary** to pattern-match against ("find all `Obra` instances where `pertenece_al_movimiento` is `Barroco`"), which is what lets CLIPS' rule engine do meaningful inference instead of string-matching.

The ontology was designed visually in **[Protégé](https://protege.stanford.edu/)**, exported in **OWL/Turtle** format (`Ontologia.ttl`), and then translated into CLIPS object definitions (`clips-ontologia.clp`) using the `owl2clips` converter, so the exact same knowledge model is used at design time and at run time.

It was populated with the **75 most representative works of the Museo del Prado**, their painters, movements, eras and themes, distributed realistically across **10 rooms** with an explicit adjacency graph (which room connects to which), so the system can reason about walking distance, not just content relevance.

### Opening the ontology

The ontology (`codigo-fuente/Ontologia.ttl`) is a standard OWL/Turtle file and requires **[Protégé](https://protege.stanford.edu/)** (free, cross-platform) to open and inspect visually:

1. Install Protégé from https://protege.stanford.edu/
2. `File → Open` and select `codigo-fuente/Ontologia.ttl`
3. Use the *Classes*, *Object Properties*, and *Individuals* tabs to explore the class hierarchy, relations, and the 75 instantiated artworks.

## System architecture

```
   ┌──────────────────────────┐        ┌──────────────────────────┐
   │  User requirements        │        │  Museum knowledge         │
   │  (days, hours, group,     │        │  (ontology: artworks,     │
   │   knowledge, preferences) │        │   painters, rooms, ...)   │
   └─────────────┬─────────────┘        └─────────────┬─────────────┘
                 │                                    │
                 └───────────────┬────────────────────┘
                                 ▼
                      Optimal visit itinerary
```

The full domain + rules are combined into a single ready-to-run file, `clips-programa.clp`, assembled from:

| File | Role |
|---|---|
| `Ontologia.ttl` | Ontology authored in Protégé (OWL/Turtle). Source of truth for the domain model. |
| `clips-ontologia.clp` | The same ontology translated into CLIPS `defclass` / `definstances` (via `owl2clips`). |
| `clips-moduloA.clp` | **Module A** — collects the concrete problem: asks the user for days, hours, group, knowledge and preferences. |
| `clips-moduloB.clp` | **Module B** — abstracts the concrete data into a discretized problem archetype (interest categories, rough pace, knowledge level, whether breaks are needed). |
| `clips-moduloC.clp` | **Module C** — maps the abstract problem to an abstract solution archetype (touristic vs. intellectual visit, artworks-per-hour pace). |
| `clips-moduloD.clp` | **Module D** — refines the abstract solution into a concrete day-by-day list of rooms and artworks (26 production rules covering preference/no-preference × touristic/intellectual × same-room/adjacent-room combinations). |
| `clips-moduloImprimir.clp` | **Printing module** — renders the final itinerary to the console, grouped by day and room. |
| `clips-programa.clp` | All of the above, concatenated and ready to be pasted into the CLIPS interpreter. |

## The reasoning pipeline

The system follows the **heuristic classification** methodology (concrete problem → abstract problem → abstract solution → concrete solution → output), a classical AI strategy for problems whose exact solution space is too large to search exhaustively:

```
 Problem                         Solution
 Concrete  ──abstraction──▶  Abstract  ──heuristic──▶  Abstract
  (Module A)                 (Module B)  association     (Module C)
                                                              │
                                                        refinement /
                                                        adaptation
                                                              │
                                                              ▼
                                                        Concrete Solution
                                                          (Module D)
                                                              │
                                                              ▼
                                                     Printed itinerary
                                                     (Module Imprimir)
```

1. **Problem concreto (Module A):** interactively collects raw facts from the user — number of days, hours/day, group size and composition (children/retirees), art knowledge level (0–10), and an open-ended list of preferences (painter / theme / movement / era) picked from the ontology's actual instances.
2. **Problema abstracto (Module B):** discretizes that raw input into qualitative categories — e.g. how many artworks can realistically be seen (low/medium/high), whether rest breaks are needed, an abstracted knowledge level, and which *types* of interest exist (without yet resolving to specific instances).
3. **Solución abstracta (Module C):** applies heuristic association to decide the *shape* of the solution — is this a "touristic" or "intellectual" visit, and at what pace (artworks/hour, from very slow to very fast)?
4. **Solución concreta (Module D):** refines the abstract solution back into concrete facts — walks room by room (respecting the adjacency graph), filling each with artworks that satisfy the visitor's stated preferences first (prioritizing popularity for touristic visits, complexity for intellectual ones, with no immediate repeats), then fills any remaining capacity with the most relevant nearby works.
5. **Impresión de la solución (Module Imprimir):** renders the final plan legibly, day by day, indicating each room change and the title/author of every recommended artwork.

## Repository structure

```
codigo-fuente/
├── Ontologia.ttl                 # Ontology source (Protégé, OWL/Turtle)
├── clips-ontologia.clp           # Ontology translated to CLIPS (owl2clips)
├── clips-moduloA.clp             # Module A — data collection
├── clips-moduloB.clp             # Module B — data abstraction
├── clips-moduloC.clp             # Module C — abstract solution
├── clips-moduloD.clp             # Module D — concrete solution
├── clips-moduloImprimir.clp      # Output formatting
├── clips-programa.clp            # Full program (ontology + all modules), ready to run
└── juegos-de-prueba/             # 8 test scenarios (input + full recorded output)
    ├── juego1-input.txt / juego1.txt   # Family tourist visit
    ├── juego2-input.txt / juego2.txt   # Intellectual couple's visit
    ├── juego3-input.txt / juego3.txt   # School visit
    ├── juego4-input.txt / juego4.txt   # Organized tourist group
    ├── juego5-input.txt / juego5.txt   # Half-day visit
    ├── juego6-input.txt / juego6.txt   # Art historian's visit
    ├── juego7-input.txt / juego7.txt   # Express visit
    └── juego8-input.txt / juego8.txt   # Extreme / stress-test case
```

Each `juegoN-input.txt` is the literal sequence of answers fed to the interpreter's `(read)` calls; each `juegoN.txt` is the full recorded console transcript (questions + itinerary) for that scenario — together they double as reproducible regression tests for the rule base.

## How to run it

Requires the [CLIPS](https://www.clipsrules.net/) interpreter (`clips` CLI, or the CLIPS IDE).

**Debian/Ubuntu:**
```bash
sudo apt install clips
```

**Run the program:**
```bash
clips
```
Inside the CLIPS prompt:
```lisp
(load "codigo-fuente/clips-programa.clp")
(reset)
(run)
```
Then answer the interactive prompts (days, hours, group, knowledge, preferences) as they appear.

**Replay a pre-recorded test scenario non-interactively:** each `juegoN-input.txt` holds the exact sequence of answers the program expects via `(read)`. Prepend the load/reset/run commands and pipe it in:
```bash
(echo '(load "codigo-fuente/clips-programa.clp")'; echo '(reset)'; echo '(run)'; cat codigo-fuente/juegos-de-prueba/juego1-input.txt) | clips
```
Compare the resulting itinerary against `juego1.txt` to verify the rule base behaves as expected.

## Example run

Input: a family of 4 (with children and retirees), 1 day, 6 hours, moderate art knowledge (6/10), no specific preferences (`codigo-fuente/juegos-de-prueba/juego1-input.txt`).

```
Que tipo de preferencia quiere anadir?
[1] Preferencia por algun autor
[2] Preferencia por alguna tematica
[3] Preferencia por algun movimiento
[4] Preferencia por alguna epoca
[5] No hay mas preferencias
5
En cuantos dias desea visitar el museo? El valor debe estar entre 1 y 3 (ambos incluidos)
1
Cuantas horas quiere que dure una visita de un dia? El valor debe estar entre 1 y 8 (ambos incluidos)
6
Cuantas personas sois? El valor debe estar entre 1 y 100 (ambos incluidos)
4
Hay ninos? [Si/No]
Si
Hay jubilados? [Si/No]
Si
Que grado de conocimiento en arte tiene? El valor debe estar entre 0 y 10 (ambos incluidos)
6
#####################################################
The daily visit route is made up of rooms. For each room, the paintings to see are listed:
Day 1
In [Sala4] see:
The artwork [Vista de Toledo] by [El_Greco]
The artwork [Venus y Adonis] by [Tiziano]
The artwork [Retrato de Isabel Clara Eugenia] by [Peter_Paul_Rubens]
The artwork [La Sagrada Familia] by [Francisco_Bayeu_y_Subias]
The artwork [La Natividad] by [El_Greco]
The artwork [Judith en el Banquete de Holofernes] by [Lucas_Cranach_el_Viejo]
In [Sala8] see:
The artwork [Retrato de Felipe III a caballo] by [Diego_Velazquez]
The artwork [Los Musicos] by [Diego_Velazquez]
The artwork [Las Tres Gracias] by [Peter_Paul_Rubens]
The artwork [Las Meninas] by [Diego_Velazquez]
The artwork [Las Hilanderas] by [Diego_Velazquez]
The artwork [La Venus del Espejo] by [Diego_Velazquez]
The artwork [La Sagrada Familia del Pajarito] by [Bartolome_Esteban_Murillo]
In [Sala9] see:
The artwork [San Juan Bautista en el desierto] by [Caravaggio]
The artwork [San Jeronimo] by [Jose_de_Ribera]
The artwork [San Andres] by [Jose_de_Ribera]
The artwork [Retrato de Maria Luisa] by [Claudio_Coello]
The artwork [Retrato de Isabel de Borbon] by [Claudio_Coello]
#####################################################
```

18 artworks for a 1-day, 6-hour family visit with children and retirees — a moderate, popularity-weighted pace across 3 adjacent rooms, with no repeated works. See `codigo-fuente/juegos-de-prueba/` for the remaining 7 scenarios (an intellectual couple's 2-day deep dive with painter/theme preferences, a school visit, an express visit, a stress-test extreme case, and more), each with its full input and recorded output for reference.

## Sources

- [Museo Nacional del Prado — official website](https://www.museodelprado.es/)
- [Museo del Prado — virtual visit](https://www.museodelprado.es/visitas-virtuales)
- [Museo del Prado — Wikipedia](https://es.wikipedia.org/wiki/Museo_del_Prado)

---

*Authors: Lluc Santamaria Riba, Adrià Cebrián, Verenisse Cáceres — Facultat d'Informàtica de Barcelona (UPC), Artificial Intelligence course, 2024–2025.*
