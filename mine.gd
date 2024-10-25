extends StaticBody2D

@export var entrada: Portal = null 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if entrada:
		entrada.body_entered.connect(_on_entrada_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_entrada_body_entered(body: Node2D) -> void:
	if body is Player:
		print("jogador entrou na mina")
