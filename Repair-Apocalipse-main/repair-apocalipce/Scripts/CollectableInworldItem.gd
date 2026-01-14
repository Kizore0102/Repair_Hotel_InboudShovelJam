extends Area2D
@export var Sprite : Sprite2D
@export var Collision : CollisionShape2D

var WhatIten : Resource
var Textura : Texture2D

func _ready():
	connect("body_entered", Callable(self, "BeCollected"))

func SetTexture(Thing : InventoryItem):
	Textura = Thing.Textura
	#print("Thing.Textura: ", Thing.Textura)
	Sprite.texture = Textura
	visible = true

func BeCollected(body):
	#print(body, typeof(body))
	var PlayerInventoryComp : Dictionary = {
		"Inventory" : body.ActiveChildNode["InventoryComponent"]
	}
	if PlayerInventoryComp["Inventory"].has_method("Collect"):
		PlayerInventoryComp["Inventory"].Collect(WhatIten)
	else:
		print("no inventory func achado")
	self.queue_free()
