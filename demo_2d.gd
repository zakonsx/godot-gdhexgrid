# Script to attach to a node which represents a hex grid
extends Node2D

var HexGrid = preload("./HexGrid.gd").new()

onready var baseHexPack = preload("res://tiles/base_hex_50.tscn")

onready var highlight = get_node("Highlight")
onready var area_coords = get_node("Highlight/AreaCoords")
onready var hex_coords = get_node("Highlight/HexCoords")

func _ready():
	HexGrid.hex_scale = Vector2(50, 50)
	gridDrawMap()

func _unhandled_input(event):
	if event.position:
		var relative_pos = self.transform.affine_inverse() * event.position
		# Display the coords used
		if area_coords != null:
			area_coords.text = str(relative_pos)
		if hex_coords != null:
			hex_coords.text = str(HexGrid.get_hex_at(relative_pos).axial_coords)
		
		# Snap the highlight to the nearest grid cell
		if highlight != null:
			highlight.position = HexGrid.get_hex_center(HexGrid.get_hex_at(relative_pos))


func gridDrawMap():
	# Grid zero cell
	var zero_cell = HexGrid.HexCell.new(Vector2(0, 0))
	var zero_cell_poly = baseHexPack.instance()
	zero_cell_poly.transform = Transform2D(0, HexGrid.get_hex_center(zero_cell))
	self.add_child(zero_cell_poly)
	# Get ring from zero cell with radius 1
	var ring_cells = zero_cell.get_ring(1)
	for _cell in ring_cells:
		var _poly = baseHexPack.instance()
		_poly.transform = Transform2D(0, HexGrid.get_hex_center(_cell))
		self.add_child(_poly)
		
	