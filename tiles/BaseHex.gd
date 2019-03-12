extends Node2D

onready var BaseHexNode = get_node("InitialHex")
onready var ObstacleHexNode = get_node("ObstacleHex")
onready var EnergyHexNode = get_node("EnergyFlowHex")
onready var EnergyFlowAnimation = get_node("EnergyFlowHex/EnergyFlowSprites")

enum HexTypes {BASIC, OBSTACLE, ENERGY, EMPTY = -1}

var _currentPos = Vector2(0, 0)
var _currentType = -1


#
# ENERGY type processing
#
var energyPercentage = floor(rand_range(75, 100))

func decrease_energy(_val):
	energyPercentage -= _val
	if energyPercentage < 0:
		energyPercentage = 0
		EnergyFlowAnimation.playing = false
	pass
#
# End of ENERGY type processing
#


func pos_to(_pos):
	_currentPos = _pos
	
func set_type(_type):
	_currentType = _type

func _ready():
	var scaleSeed
	if _currentType == HexTypes.BASIC:
		BaseHexNode.transform = Transform2D(0, _currentPos)
	if _currentType == HexTypes.OBSTACLE:
		ObstacleHexNode.transform = Transform2D(0, _currentPos)
	if _currentType == HexTypes.ENERGY:
		EnergyHexNode.transform = Transform2D(0, _currentPos)
		EnergyFlowAnimation.frame = floor(rand_range(1, 30))
		EnergyFlowAnimation.playing = true
	pass

func _process(delta):
	if _currentType == HexTypes.ENERGY:
		var scaleFactor = energyPercentage / 100;
		EnergyFlowAnimation.set_scale(Vector2(scaleFactor, scaleFactor))

#	var currentScale = EnergyFlowAnimation.get_scale()
#	if currentScale.x > 1.1:
#		energyGrowDirection = false
#	if currentScale.x < 0.75:
#		energyGrowDirection = true
#	if energyGrowDirection:
#		currentScale.x += .05 * delta
#		currentScale.y += .05 * delta
#	else:
#		currentScale.x -= .05 * delta
#		currentScale.y -= .05 * delta
#	EnergyFlowAnimation.set_scale(currentScale)
	pass
