extends Node3D

const GRAB_DISTANCE = 0.3
const THROW_FORCE_MULTIPLIER = 1.5

var physics_objects = []
var grabbed_object = null
var previous_pos = Vector3.ZERO
var velocity = Vector3.ZERO

func _ready():
    # Register physics objects
    for object in get_tree().get_nodes_in_group("physics_objects"):
        physics_objects.append(object)

func _physics_process(delta):
    if grabbed_object:
        _update_grabbed_object(delta)
        _calculate_velocity(delta)

func _update_grabbed_object(delta):
    var target_pos = global_transform.origin
    var current_pos = grabbed_object.global_transform.origin
    grabbed_object.global_transform.origin = current_pos.lerp(target_pos, 25.0 * delta)

func _calculate_velocity(delta):
    var current_pos = global_transform.origin
    velocity = (current_pos - previous_pos) / delta
    previous_pos = current_pos 