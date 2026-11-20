# 🛠️ HomeDIY — Serious Game per la Manutenzione Domestica

![Godot Engine](https://img.shields.io/badge/Godot-4.3+-478CBF?style=for-the-badge&logo=godot-engine&logoColor=white)
![Language](https://img.shields.io/badge/Language-GDScript_(Typed)-blue?style=for-the-badge)
![Persistence](https://img.shields.io/badge/Data-JSON-lightgrey?style=for-the-badge)
![Course](https://img.shields.io/badge/Corso-Ingegneria_del_Software-success?style=for-the-badge)

**HomeDIY** è un serious game 2D in stile pixel art progettato per insegnare in modo sicuro, interattivo e rigoroso le basi della manutenzione domestica e la gestione delle emergenze impiantistiche.

---

## 🎯 Motivazioni e Obiettivi del Progetto

Nella vita quotidiana, la gestione degli impianti domestici (elettrico, idraulico, termico) rappresenta spesso un ostacolo pratico ed economico per studenti fuorisede e neolavoratori. Dall'analisi dello stato dell'arte è emerso un chiaro divario nelle soluzioni esistenti:
* **Guide e video tutorial** offrono una fruizione passiva e non forniscono alcun feedback immediato sugli errori che compromettono la sicurezza.
* **Simulatori commerciali** privilegiano l'intrattenimento arcade semplificando le reali sequenze operative e le norme di prevenzione.

**HomeDIY** colma questo divario adottando un approccio *learning-by-doing*: l'utente affronta guasti domestici realistici all'interno di un ambiente simulato in cui ogni impianto segue precise regole fisiche e topologiche. Sbagliare l'ordine di messa in sicurezza (ad esempio intervenire su una presa senza aver abbassato l'interruttore magnetotermico) genera un *Critical Failure* immediato con spiegazione tecnica della norma violata.

---

## ✨ Caratteristiche Principali e Task Didattiche

* **Impianti Simulati a Grafo:** Gli impianti della casa sono modellati come reti orientate in cui tensione elettrica e pressione idrica si propagano dinamicamente in base allo stato di interruttori e valvole.
* **Scenari Modulari:**
  1. **Impianto Elettrico:** Identificazione di un guasto, verifica della tensione con tester/multimetro, apertura del salvavita e sostituzione sicura di una presa.
  2. **Emergenza Idraulica:** Individuazione di una perdita, chiusura selettiva della valvola d'arresto generale per evitare allagamenti e sostituzione della guarnizione.
  3. **Manutenzione Ordinaria & Termica:** Sfiatamento dei termosifoni e scelta corretta di punta e tasselli in base al carico e alla tipologia di parete (forato, cartongesso, cemento).
* **Funzione Undo & Report Errori:** Possibilità di annullare le azioni non distruttive durante la sperimentazione e analisi dettagliata degli errori commessi al termine di ogni livello.
* **Manuale Tecnico Integrato:** Schede consultabili in-game con simbologia degli impianti, utilizzo degli attrezzi e regole fondamentali di sicurezza.
* **Salvataggi ed Impostazioni Esportabili in JSON:** Totale portabilità dei progressi e delle configurazioni utente senza dipendenze da database esterni.

---
<!--
## 🏗️ Architettura Software e Design Pattern

Il progetto applica una netta separazione tra **Domain Layer** (logica di simulazione pura in GDScript tipizzato su classi `RefCounted`, completamente indipendente dalla grafica e testabile in isolamento) e **Presentation Layer** (scene e nodi Godot).

I principali Design Pattern implementati nel sistema includono:
* **Graph / Composite Pattern (`ImpiantoGraph`):** Rappresentazione topologica dei componenti domestici e propagazione degli stati tramite visita BFS.
* **State Pattern (`ComponentState` & `GameStateMachine`):** Gestione formale del comportamento dei componenti (`Attivo`, `Isolato`, `Guasto`, `Riparato`) e degli stati della partita.
* **Command Pattern (`CommandHistory`):** Incapsulamento delle interazioni del giocatore (`execute()` / `undo()`) per il supporto all'annullamento delle mosse e al logging didattico.
* **Strategy Pattern (`ToolStrategy` & `ScoringStrategy`):** Regole di validazione intercambiabili per ciascun attrezzo e calcolo parametrico del punteggio finale.
* **Observer Pattern (`EventBus` Autoload):** Comunicazione disaccoppiata tra motore di simulazione, interfaccia utente ed effetti sonori tramite *Signals* tipizzati.
* **Factory Pattern (`ScenarioFactory`):** Istanziazione dinamica degli scenari a partire da file dichiarativi `.json` senza ricompilazione del codice.

---

<!-- ## 📂 Struttura della Repository

```text
HomeDIY/
├── .github/workflows/   # Pipeline CI per l'esecuzione automatica dei test
├── assets/
│   ├── audio/           # Effetti sonori
│   ├── fonts/           # Font pixel art
│   ├── scenarios/       # Definizioni JSON degli scenari di gioco
│   └── sprites/         # Grafica 2D in pixel art
├── src/
│   ├── autoload/        # Singleton globali (EventBus, SaveManager)
│   ├── domain/          # Logica pura (Grafo, State, Command, Strategy, Factory)
│   ├── ui/              # Scene Godot (.tscn) e controller di interfaccia
│   └── utils/           # Costanti, enum e validatori
├── tests/               # Suite di Unit Test (GdUnit4)
├── docker/              # Dockerfile per build headless e verifica test
├── docs/                # Documentazione di progetto (Stato dell'Arte, SRS, UML)
└── project.godot      # File di configurazione Godot 4 -->
