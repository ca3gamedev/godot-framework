extends Node

export (Vector2) var MapSize
export (Vector2) var MaxRoomSize
export(int) var NumberRooms

var Map

func _ready():
	Map = $DungeonGenerator.GenerateMap(MapSize, MaxRoomSize, NumberRooms)
	$TileMap.InitializeMap(Map)
	$TileMap.InitializePaths($DungeonGenerator.GetPaths())
