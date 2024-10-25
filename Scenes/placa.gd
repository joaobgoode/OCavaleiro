@tool
extends StaticBody2D
@export var mirror = false : set = set_mirror

func set_mirror(new_mirror):
	mirror = new_mirror
	var sprite = $Sprite2D
	sprite.flip_h = mirror

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
