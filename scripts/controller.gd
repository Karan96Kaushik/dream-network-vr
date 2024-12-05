extends XRController3D

signal grab_started
signal grab_ended
signal teleport_requested(position: Vector3)

var is_grabbing := false
var grabbed_object: Node3D = null
var highlight_material: StandardMaterial3D

func _ready():
    button_pressed.connect(_on_button_pressed)
    button_released.connect(_on_button_released)
    
    # Create highlight material
    highlight_material = StandardMaterial3D.new()
    highlight_material.albedo_color = Color(1.0, 0.8, 0.0, 0.6)
    highlight_material.emission_enabled = true
    highlight_material.emission = Color(1.0, 0.8, 0.0)

func _on_button_pressed(button_name: String):
    match button_name:
        "trigger_click":
            _handle_grab()
        "primary_click":
            _handle_teleport()
        "grip_click":
            _handle_menu()

func _handle_grab():
    if not is_grabbing:
        var grabbable = _find_grabbable_object()
        if grabbable:
            grabbed_object = grabbable
            is_grabbing = true
            emit_signal("grab_started")
            
func _handle_teleport():
    var ray_cast = $RayCast3D
    if ray_cast.is_colliding():
        var point = ray_cast.get_collision_point()
        emit_signal("teleport_requested", point)

func _find_grabbable_object() -> Node3D:
    var grab_area = $GrabArea
    var bodies = grab_area.get_overlapping_bodies()
    for body in bodies:
        if body.is_in_group("grabbable"):
            return body
    return null 