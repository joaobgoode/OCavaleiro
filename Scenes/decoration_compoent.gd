@tool
extends Node2D
class_name DecorationComponent
@export_category("image")
enum Decorations {cogumeloP, cogumeloM, cogumeloG, pedraP, pedraM, pedraG, moitaP, moitaM, moitaG, plantaP, plantaM, abobora1, abobora2}
@export var decoration: Decorations = Decorations.cogumeloP : set = set_decoration
@export var _texture: String = "res://Assets/sprites/objects/Deco/1.png" : set = set_textures
@export_category("Collision")
@export var enable = true : set = enable_collision
@export var collision_size = 3 : set = set_collision_size
@export var collision_position: Vector2 = Vector2.ZERO : set = set_collision_position
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func set_textures(_new_texture):
	_texture = _new_texture
	for _child in get_children():
		if _child is Sprite2D:
			_child.texture = load(_texture)

func set_decoration(_new_decoration):
	decoration = _new_decoration
	var texture_string = "res://Assets/sprites/objects/Deco/%d.png" % (decoration + 1)
	$Textura1.texture = load(texture_string)

func enable_collision(new_enable):
	enable = new_enable
	var collision = $CollisionShape2D
	collision.disabled = !enable
	$CollisionShape2D.visible = enable
	
func set_collision_size(new_size):
	collision_size = new_size
	$CollisionShape2D.shape.radius = collision_size

func set_collision_position(new_position):
	collision_position = new_position
	$CollisionShape2D.position = collision_position


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
