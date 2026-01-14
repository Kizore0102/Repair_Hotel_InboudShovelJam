extends Control

var Active : bool = true
var OpenInventory : bool = false

@export var InvenSize : int
var InvenSizeMod : float

@onready var Inven : Inventory = preload("res://Scenes/ResoucesScenes/InventroyResouce.tres")
var Slots : Array
@export var Dicresouce : Resource
@export var NodeRefs : Dictionary = {}
var ActiveChildNode : Dictionary = {}

func _ready():
	Inven.UpdateInventory.connect(UpdateSlots)
	# FillUiInvenSlot func deu mt trabalho so ingnora ela
	ShowUi(false)
	Dicresouce.InicializeNodeDocs("Fill",NodeRefs,ActiveChildNode,self)
	Slots = ActiveChildNode["GridConteiner"].get_children()
	UpdateSlots()

func FillUiInvenSlot():
	ActiveChildNode["9Patch"].size.x = ActiveChildNode["9Patch"].size.x * (InvenSizeMod * 0.18)
	ActiveChildNode["9Patch"].size.y = ActiveChildNode["9Patch"].size.y * (InvenSizeMod * 0.14)
	ActiveChildNode["GridConteiner"].columns = (InvenSizeMod / 3)
	for i in InvenSize:
		ActiveChildNode["GridConteiner"].add_child(ActiveChildNode["InvenSlot"].duplicate())
		#print(ActiveChildNode["GridConteiner"].get_children())

	#InvenSizeMod = InvenSize
	#InvenSize = InvenSize - 1
	#FillUiInvenSlot()

func ShowUi(Uiactive : bool):
	if Uiactive and OpenInventory:
		#print("Deactivate ui")
		visible = false
		OpenInventory = false
	elif Uiactive:
		#print("activate ui")
		OpenInventory = true
		visible = true
	elif !Uiactive:
		visible = false
		OpenInventory = false

func UpdateSlots():
	for i in range(min(Inven.Slots.size(), Slots.size())):
		Slots[i].UpdateSlot(Inven.Slots[i])
