@tool
extends Node2D

enum PlanetType { 
	RANDOM,
	GREEN_BLUE, 
	EARTH, 
	GREEN_PURPLE, 
	RED_ORANGE, 
	DARK_BLUE, 
	DESERT, 
	DARK_DESERT, 
	WATER, 
	FIRE, 
	PURPLE 
}

enum Faction {
	NONE,
	PIRATE,
	MACHINIST,
	HIVE_MIND,
	CULTIST
}

@export var planet_name: String
@export var planet_faction: Faction = Faction.NONE
@export var strategic_owner: Faction = Faction.NONE

@export var planet_texture: PlanetType:
	set(value):
		planet_texture = value
		update_texture()

@export var population: int = 10
@export var resource_production: StrategicResources = StrategicResources.new()

@onready var sprite: Sprite2D = $Sprite2D

var planet_textures = {
	PlanetType.EARTH: preload("res://assets/sprites/planets/planet03.png"),
	PlanetType.GREEN_BLUE: preload("res://assets/sprites/planets/planet00.png"),
	PlanetType.GREEN_PURPLE: preload("res://assets/sprites/planets/planet01.png"),
	PlanetType.RED_ORANGE: preload("res://assets/sprites/planets/planet02.png"),
	PlanetType.DARK_BLUE: preload("res://assets/sprites/planets/planet04.png"),
	PlanetType.DESERT: preload("res://assets/sprites/planets/planet05.png"),
	PlanetType.DARK_DESERT: preload("res://assets/sprites/planets/planet06.png"),
	PlanetType.WATER: preload("res://assets/sprites/planets/planet07.png"),
	PlanetType.FIRE: preload("res://assets/sprites/planets/planet08.png"),
	PlanetType.PURPLE: preload("res://assets/sprites/planets/planet09.png"),
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_texture()

func update_texture():
	if not sprite:
		sprite = get_node_or_null("Sprite2D")
	
	if sprite and planet_texture:
		sprite.texture = planet_textures.get(planet_texture)
