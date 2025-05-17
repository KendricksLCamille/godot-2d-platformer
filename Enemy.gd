extends Area2D

@export var move_speed: float = 2.0;
@export var move_dir: Vector2

var start_pos: Vector2
var target_pos: Vector2

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir

func _physics_process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta* 20)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else:
			target_pos = start_pos;
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over();
	pass # Replace with function body.
