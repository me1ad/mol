extends Button

@onready var number_label: Label = $VBoxContainer/AtomicNumber
@onready var symbol_label: Label = $VBoxContainer/Symbol
@onready var name_label: Label = $VBoxContainer/ElementName

var element_data: Dictionary

func setup(data: Dictionary) -> void:
	element_data = data
	var number = data["atomic_number"]
	if typeof(number) != typeof(""):
		number = int(number)
	number_label.text = " " + str(number)
	symbol_label.text = data["symbol"]
	name_label.text = data["name"]
