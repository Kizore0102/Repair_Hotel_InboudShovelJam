extends Resource
class_name Inventory

@export var Slots: Array[InventorySlot]
var HasChanged: bool = false

signal UpdateInventory

func AddItem(Item: InventoryItem):

	var ItemSlots = Slots.filter(func(Slots): return Slots.Item == Item)
	if !ItemSlots.is_empty():
		ItemSlots[0].Amount += 1 
	else:
		var EmptySlots = Slots.filter(func(Slots): return Slots.Item == null)
		if !EmptySlots.is_empty():
			EmptySlots[0].Item = Item
			EmptySlots[0].Amount = 1
	
	UpdateInventory.emit()
	
#func bacjup(_Item):
	#this dont work
	#for i in range(Slots.size()):
		#if not Slots[i] == null and Slots[i].Item == Item:
			#Slots[i].Amount += 1
			#HasChanged = true
			#return
		#elif Slots[i] == null:
			#var SlotItem: InventorySlot = InventorySlot.new()
			#HasChanged = true
			#SlotItem.Item = Item
			#SlotItem.Amount = 1
			#Slots[i] = SlotItem
			#return
		#else:
			#print("Inventory full, can't add: ", Item)
			#return