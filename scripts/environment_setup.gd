extends Node3D

func _ready():
    # Create a basic environment
    var environment = Environment.new()
    
    # Enhanced lighting
    environment.ambient_light_color = Color(0.2, 0.2, 0.2)
    environment.ambient_light_energy = 1.0
    environment.ssao_enabled = true
    environment.ssr_enabled = true
    environment.glow_enabled = true
    
    # Add sky with time of day system
    var sky = ProceduralSky.new()
    sky.sun_angle_max = 30.0
    sky.sun_curve = 0.15
    environment.sky = sky
    environment.background_mode = Environment.BG_SKY
    
    # Add fog for depth
    environment.fog_enabled = true
    environment.fog_density = 0.01
    
    # Apply to WorldEnvironment node
    $WorldEnvironment.environment = environment
    
    # Create dynamic lighting
    _setup_dynamic_lighting()

func _setup_dynamic_lighting():
    var sun = DirectionalLight3D.new()
    sun.shadow_enabled = true
    sun.light_energy = 1.2
    add_child(sun)