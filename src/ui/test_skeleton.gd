extends Node2D

func _ready() -> void:
	# Collega questo script all'EventBus globale
	EventBus.interactable_clicked.connect(_on_item_clicked)

func _on_button_pressed() -> void:
	# Quando premi il bottone, lancia un segnale sull'EventBus
	EventBus.interactable_clicked.emit("interruttore_test")

func _on_item_clicked(item_id: String) -> void:
	print("Evento ricevuto correttamente per: ", item_id)
	
	# Aggiorna i dati in memoria e salva su file JSON
	var missions: Array = SaveManager.game_data["progress"]["completed_missions"]
	if not missions.has(item_id):
		missions.append(item_id)
	
	var saved: bool = SaveManager.save_game()
	if saved:
		print("Salvataggio JSON completato con successo!")
