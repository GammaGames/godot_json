extends Node

var LabelledIcon = load("res://scenes/LabelledIcon.tscn")
var Creep = load("res://scenes/Creep.tscn")

func _ready():
	# This is just for the creeps
	randomize()

	# Create a new file to load the icons and open it
	var icons = File.new()
	icons.open("res://icons.json", icons.READ)
	# Parse the json and store it
	var iconJson = parse_json(icons.get_as_text())

	# Loop through the json
	for icon in iconJson:
		# Instance a new scene for each item
		var item = LabelledIcon.instance()
		# Set the newly instanced scene texture and label to the json data
		item.get_node("TextureRect").texture = load(icon.icon)
		item.get_node("Label").text = icon.label
		# Add to the grid
		$UI/Margin/Grid.add_child(item)

	# Create a new file to load the creeps and open it
	var creeps = File.new()
	creeps.open("res://creeps.json", icons.READ)
	# Parse and store the json
	var creepJson = parse_json(creeps.get_as_text())

	# Loop through the creeps
	for object in creepJson:
		# Create a new instance of a creep
		var creep = Creep.instance()
		# Set the position and texture of the scene
		creep.global_position = Vector2(object.x, object.y)
		creep.texture = load(object.sprite)
		# Add the creep to the tree
		add_child(creep)

	# Close the files
	icons.close()
	creeps.close()
