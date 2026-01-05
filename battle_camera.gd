extends Camera3D

@export var character_target : Node3D
@export var camera_smoothing : float = 2.0

func _ready() -> void:
	top_level = true

func _physics_process(delta: float) -> void:
	
	var current_quat : Quaternion = global_transform.basis.get_rotation_quaternion()
	
	var target_pos : Vector3 = character_target.global_position
	var from_pos : Vector3 = global_position
	
	var target_basis : Basis = Basis.looking_at(
	target_pos - from_pos,
	Vector3.UP
	)
	
	#var target_quat: Quaternion = character_target.global_transform.basis.get_rotation_quaternion()
	var target_quat : Quaternion = target_basis.get_rotation_quaternion()
	var new_quat: Basis = current_quat.slerp(target_quat, camera_smoothing * delta)
	global_transform.basis = Basis(new_quat)
