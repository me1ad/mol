extends Control

const ELEMENT_BUTTON = preload("res://scenes/gui/element_button.tscn")

@onready var grid: GridContainer = $MarginContainer/GridContainer

const TABLE_ROWS = [
	["H", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "He"],
	["Li", "Be", "", "", "", "", "", "", "", "", "", "", "B", "C", "N", "O", "F", "Ne"],
	["Na", "Mg", "", "", "", "", "", "", "", "", "", "", "Al", "Si", "P", "S", "Cl", "Ar"],
	["K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge", "As", "Se", "Br", "Kr"],
	["Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn", "Sb", "Te", "I", "Xe"],
	["Cs", "Ba", "*", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", "At", "Rn"],
	["Fr", "Ra", "**", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Cn", "Nh", "Fl", "Mc", "Lv", "Ts", "Og"]
]

const CONDENSED_TABLE_ROWS = [
	["H", "", "", "", "", "", "", "", "He"],
	["Li", "Be", "", "B", "C", "N", "O", "F", "Ne"],
	["Na", "Mg", "", "Al", "Si", "P", "S", "Cl", "Ar"],
	["K", "Ca", "", "Ga", "Ge", "As", "Se", "Br", "Kr"],
	["Rb", "Sr", "", "In", "Sn", "Sb", "Te", "I", "Xe"],
	["Cs", "Ba", "", "Tl", "Pb", "Bi", "Po", "At", "Rn"],
	["Fr", "Ra", "", "Nh", "Fl", "Mc", "Lv", "Ts", "Og"]
]



func _ready() -> void:
	for row in CONDENSED_TABLE_ROWS:
		for symbol in row:
			var element_data = Chem.elementSymbolList()[symbol]
			var button = ELEMENT_BUTTON.instantiate()
			grid.add_child(button)
			button.setup(element_data)
