extends Node

# --- Segnali di Interazione Mondo ---
signal interactable_clicked(node_id: String)
# signal open_detail_view(impianto_id: String, component_id: String)
# signal close_detail_view()

# --- Segnali Inventario ---
# signal tool_picked_up(tool_id: String)
# signal tool_dropped(tool_id: String)
# signal inventory_updated(slots: Array[String])

# --- Segnali Impianti e Missioni ---
# signal graph_state_changed(impianto_id: String)
signal critical_failure(reason: String, safety_rule: String)
# signal mission_completed(mission_id: String)
