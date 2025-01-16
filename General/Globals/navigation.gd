extends Node

var map : AStar2D
var map_size : Vector2i

func init_level(tilemap : TileMapLayer, units: Array[Unit]) -> void:
	map_size = tilemap.get_used_rect().size
	var collision = tilemap.get_used_cells()
	
	map = AStar2D.new()
	
	map.reserve_space(map_size.x * map_size.y)
	
	for x in map_size.x:
		for y in map_size.y:
			var id = get_map_cell_id(Vector2(x,y))
			map.add_point(id, tilemap.map_to_local(Vector2(x,y)))
	
	print('i cooka da map ', map)

# Convert tilemap location to astar index, apparently it counts up on the y axis, so we mutliply the cell's x by the map's height...
func get_map_cell_id(cell : Vector2) -> int:
	return int(cell.y + cell.x * map_size.y)
