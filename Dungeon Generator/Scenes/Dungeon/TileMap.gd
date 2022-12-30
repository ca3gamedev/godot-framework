extends TileMap

func InitializeMap(mapita):
	
	for a in mapita:
		for b in a:
			var pos = Vector2(int(b.x), int(b.y))
			set_cell(pos.x, pos.y, 0)

func InitializePaths(mapita):
	for a in mapita:
		var pos = Vector2(int(a.x), int(a.y))
		set_cell(pos.x, pos.y, 1)
