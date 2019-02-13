extends Node2D

onready var HexPoly = get_node("HexPoly")

var _currentPos = Vector2(0, 0)

func pos_to(_pos):
	_currentPos = _pos

func _ready():
	HexPoly.transform = Transform2D(0, _currentPos)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
