extends Area2D

@export var SpawnableItens : Array[InventoryItem]
@export var NodeRefs : Dictionary = {}
@export var DicResouce : Resource
@export var DropItem : PackedScene 
var ActiveChildNode : Dictionary = {}

var ChosenItem : int
var ChosenObject : Resource 

func _ready():
	DicResouce.InicializeNodeDocs("Fill",NodeRefs, ActiveChildNode, self)
	connect("body_entered", Callable(self, "SpawnItens"))
	#print(ActiveChildNode)

func SpawnItens(_body):
	ChosenItem = int(randf_range(0,SpawnableItens.size()))
	var ItemDrop = DropItem.instantiate()
	ChosenObject = SpawnableItens.get(ChosenItem)
	print(ChosenObject.Name)
	ItemDrop.SetTexture(ChosenObject)
	ItemDrop.WhatIten = ChosenObject
	ActiveChildNode["Pivot"].call_deferred("add_child",ItemDrop)
