extends Node

class_name Walk_Behavior

var parent_node : KinematicBody2D
var speed = 0.0
var direction = 0.0

func _init(_parent_node, _speed):
	self.parent_node = parent_node
	self.speed = speed
	

func _to_string():
	return "Parente node: "+parent_node.name+"\nSpeed: "+str(speed)+"\n"
