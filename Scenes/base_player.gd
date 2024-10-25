extends CharacterBody2D
class_name Player

var action_tree: DecorationTree

@export_category("Stats")
@export var speed:float = 200.0

@export_category("Objects")
@export var animation: AnimationPlayer
@export var texture: Sprite2D
@export var action_shape: CollisionShape2D

enum states {idle, run, chop, mine, talk, none}
var state = states.idle

func _physics_process(_delta: float) -> void:
	if state == states.run or state == states.idle:
		_move()
		_action()
	_animate()
	
func _move():
	var _direction:Vector2 = Input.get_vector("left","right","up","down")
	velocity = _direction * speed
	move_and_slide()
	if velocity.x < 0:
		texture.flip_h = true
		if action_shape: 
			action_shape.position.x = -35
	elif velocity:
		texture.flip_h = false
		if action_shape:
			action_shape.position.x = 35

func _animate():
	if state == states.run or state == states.idle:
		if velocity:
			animation.play("run")
			state = states.run
			return
		animation.play("idle")
		state = states.idle
	if state == states.chop:
		animation.play("cortar arvore")


func _on_action_area_body_entered(body: Node2D) -> void:
	print(body)
	if body is DecorationTree:
		action_tree = body

func _action():
	if !Input.is_action_just_pressed("action"):
		return
	print("ACTION")
	if action_tree:
		if action_tree.hits < action_tree.maxHits:
			state = states.chop
			action_tree.getHit()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "cortar arvore":
		state = states.idle


func _on_action_area_body_exited(body: Node2D) -> void:
	if body is DecorationTree:
		action_tree = null
