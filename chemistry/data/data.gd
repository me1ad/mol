extends Node

var json_path = "res://chemistry/data/elements.json"

var elements: Dictionary = {}
var stp = {
	"Pressure": 101.325, #kPascals
	"Temperature": 273.15 #Kelvin
}

func _ready():
	load_json()

func load_json():
	var file = FileAccess.open(json_path, FileAccess.READ)
	assert(file.file_exists(json_path),"File path does not exist")

	var json = file.get_as_text()

	var json_object = JSON.new()
	
	
	json_object.parse(json)

	elements = json_object.data

	return elements

var atomsPerMol = 6.022 * 10 ** 23

func convFromMolesToAtoms(mols: float):
	return mols * atomsPerMol

func convFromAtomsToMols(atoms: int):
	return atoms / atomsPerMol

func convFromMolsToElementMass(element: String,mols: float):
	if len(element) < 3:
		return mols * elements["by_symbol"][element]
	return mols * elements["by_name"][element]

func convFromElementMassToMols(element: String,mass: float):
	if len(element) < 3:
		return mass / elements["by_symbol"][element]
	return mass / elements["by_name"][element]

func convFromElementMassToAtoms(element: String,mass: float):
	return atomsPerMol * convFromElementMassToMols(element,mass)

func convFromAtomsToElementMass(element: String,atoms: int):
	return convFromMolsToElementMass(element,atoms / atomsPerMol)

func elementSymbolList():
	return elements["by_symbol"]

func elementNameList():
	return elements["by_name"]

func convMolsToSTPGasVol(mols: float):
	return mols * 22.4

func convMolsToGasVol(mols: float, p: float = stp["Pressure"],t: float = stp["Temperature"]):
	return gasVolFromSTP(convMolsToSTPGasVol(mols),p,t)

func gasVolFromSTP(v: float,p: float,t: float):
	return convertGasVol(v,stp["Pressure"],stp["Temperature"],p,t)

func convertGasVol(v1: float, p1: float,t1: float,p2: float,t2: float):
	var v2: float = p1*v1/t1/p2*t2
	return v2
