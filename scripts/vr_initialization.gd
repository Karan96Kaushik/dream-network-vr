#extends Node3D
#
#func _ready():
	## Initialize XR interface
	#if not XRServer.primary_interface:
		## Find OpenXR interface
		#var xr_interface = XRServer.find_interface("OpenXR")
		#if xr_interface and xr_interface.is_initialized():
			## Configure interface
			#get_viewport().use_xr = true 
