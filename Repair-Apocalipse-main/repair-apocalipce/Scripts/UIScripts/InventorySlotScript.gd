extends Panel

@export var ItemVisual : Sprite2D
@export var ItemNun : Label


func UpdateSlot(Slot : InventorySlot):
	if !Slot.Item:
		ItemVisual.visible = false
		ItemNun.visible = false
	else:
		ItemVisual.texture = Slot.Item.Textura
		ItemVisual.visible = true
		if Slot.Amount > 1:
			ItemNun.visible = true
			ItemNun.text = str(Slot.Amount)
	#print(Slot)
