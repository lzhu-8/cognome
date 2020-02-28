extends Node2D

var _transitioning:bool = true

func _ready() -> void:
	ScreenTransitioner.instantOut()
	yield(ScreenTransitioner.transitionIn(1.0, ScreenTransitioner.DIAMONDS), "completed")
	_transitioning = false

func _input(event: InputEvent) -> void:
	if _transitioning:
		return
	var mouse:InputEventMouseButton = event as InputEventMouseButton
	if mouse != null && mouse.pressed:
		get_tree().set_input_as_handled()
		_transitioning = true
		yield(ScreenTransitioner.transitionOut(1.0, ScreenTransitioner.DIAMONDS), "completed")
		get_tree().change_scene("res://scenes/puzzle-select-scene.tscn")
	