extends Node2D

onready var BaseHexNode = get_node("InitialHex")
onready var ObstacleHexNode = get_node("ObstacleHex")

enum HexTypes {BASIC, OBSTACLE, EMPTY = -1}

var _currentPos = Vector2(0, 0)
var _currentType = -1

func pos_to(_pos):
	_currentPos = _pos
	
func set_type(_type):
	_currentType = _type

func _ready():
	if _currentType == HexTypes.BASIC:
		BaseHexNode.transform = Transform2D(0, _currentPos)
	if _currentType == HexTypes.OBSTACLE:
		ObstacleHexNode.transform = Transform2D(0, _currentPos)
	pass

func _process(delta):
#	var spriteNode =  get_node("ObstacleHex/Sprite")
#	var currentScale = spriteNode.get_scale()
#	currentScale.x += .025 * delta
#	currentScale.y += .025 * delta
#	spriteNode.set_scale(currentScale)
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
