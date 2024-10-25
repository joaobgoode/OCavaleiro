extends StaticBody2D
class_name DecorationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var maxHits = 3
var hits = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func getHit():
	if hits == maxHits:
		return
	hits += 1
	if hits == maxHits:
		animation_player.play("chopped")
	else:
		animation_player.play("hit")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if hits == maxHits:
		return
	animation_player.play("idle")
