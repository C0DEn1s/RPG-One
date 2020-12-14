extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

onready var col = $HurtBox

func create_grass_effect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_HurtBox_area_entered(area):
	if area.get_parent().is_in_group("grass"):
		return
	#if area.get("damage"):
	#	return
	create_grass_effect()
	queue_free()

func _ready():
  $HurtBox.collision_layer = 8
