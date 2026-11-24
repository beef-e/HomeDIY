extends Node

const SAVE_PATH: String = "user://savegame.json"

var game_data: Dictionary = {
	"settings": {
		"master_volume": 1.0,
		"colorblind_mode": false
	},
	"progress": {
		#"unlocked_rooms": ["cucina", "sgabuzzino"],
		#"completed_missions": []
	}
}

func _ready() -> void:
	load_game()

func save_game() -> bool:
	var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Errore apertura file di salvataggio: " + str(FileAccess.get_open_error()))
		return false
	
	var json_string: String = JSON.stringify(game_data, "\t")
	file.store_string(json_string)
	file.close()
	return true

func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		save_game() # Crea il file di default al primo avvio
		return
	
	var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return
		
	var content: String = file.get_as_text()
	file.close()
	
	var parsed: Variant = JSON.parse_string(content)
	if parsed is Dictionary:
		game_data = parsed
	else:
		push_warning("File savegame.json corrotto, ripristino valori di default.")
