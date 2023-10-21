extends TileMap
class_name InteractiveTilemap
"""
func spawn(cell: Vector2i) -> void:
	var tile_data = map.get_cell_tile_data(MapLayer.ITEMS, cell)
"""
func _ready():
	pass


func _on_area_2d_body_entered(_body):
	self.set_layer_enabled(3, false) # Replace with function body.


func _on_area_2d_body_exited(_body):
	self.set_layer_enabled(3, true) # Replace with function body.
