extends Node
class_name CharInventoryComponent

@export var NodeRefereces : Dictionary = {}
@export var DicResouce : Resource
@export var Inv : Resource

func Collect(Item : InventoryItem):
	Inv.AddItem(Item)
