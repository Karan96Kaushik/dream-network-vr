extends XRController3D

func _ready():
    # Connect button press signals
    button_pressed.connect(_on_button_pressed)
    button_released.connect(_on_button_released)

func _on_button_pressed(button_name: String):
    print("Button pressed: ", button_name)

func _on_button_released(button_name: String):
    print("Button released: ", button_name) 