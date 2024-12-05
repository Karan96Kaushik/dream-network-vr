extends Node3D

func _ready():
    # Create a basic environment
    var environment = Environment.new()
    environment.ambient_light_color = Color(0.2, 0.2, 0.2)
    environment.ambient_light_energy = 1.0
    
    # Add sky
    var sky = Sky.new()
    environment.sky = sky
    environment.background_mode = Environment.BG_SKY
    
    # Apply to WorldEnvironment node
    $WorldEnvironment.environment = environment 