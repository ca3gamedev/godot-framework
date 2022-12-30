extends Node

var centers = []
var paths = []
var tiles = []
var myrand = RandomNumberGenerator.new()

func GenerateMap(MapSize, MaxRoomSize, NumberRooms):
	tiles = []
	
	for i in NumberRooms:
		var x = rand_range(0, MapSize.x)
		var y = rand_range(0, MapSize.y)
		var w = rand_range(0, MaxRoomSize.x)
		var h = rand_range(0, MaxRoomSize.y)
		centers.append(Vector2(x+(w/2), y+(h/2)))
		tiles.append(GenerateRoom(Vector2(x, y), Vector2(w, h)))
	
	paths = []
	
	for i in len(centers)-1:
		RandomWalk(centers[i+1], centers[i], 0)
	
	return tiles


func GenerateRoom(MapPos, MaxRoomSize):
	var mytiles = []
	
	for x in MaxRoomSize.x:
		for y in MaxRoomSize.y:
			mytiles.append(Vector2(x+MapPos.x, y+MapPos.y))
	
	return mytiles

func RandomWalk(goal, current, i):
	if goal == current or i > 30:
		return 
	paths.append(current)
	
	var choice = rand_range(1, 6)
	if choice > 4.5:
		var dir = myrand.randi_range(1, 4)
		match (dir):
			1 : RandomWalk(goal, Vector2(current.x - 1, current.y), i+1)
			2 : RandomWalk(goal, Vector2(current.x + 1, current.y), i+1)
			3 : RandomWalk(goal, Vector2(current.x, current.y - 1), i+1)
			4 : RandomWalk(goal, Vector2(current.x, current.y + 1), i+1)
	else:
		var angle = goal - current
		var choice2 = myrand.randi_range(1, 4)
		var x =  sign(angle.x)
		var y = sign(angle.y)
		if choice2 >= 3:
			RandomWalk(goal, Vector2(current.x + x, current.y), i+1)
		else:
			RandomWalk(goal, Vector2(current.x, current.y + y), i+1)

func GetPaths():
	return paths
