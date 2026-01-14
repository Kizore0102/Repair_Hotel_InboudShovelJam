extends CharacterBody2D

@export var Atributo : Resource
@export var DicResouce : Resource
@export var NodeRefs : Dictionary = {}
var ActiveChildNode : Dictionary = {}


func _ready():  
	DicResouce.InicializeNodeDocs("Fill",NodeRefs,ActiveChildNode,self)
	SetUps()
	#print(ActiveChildNode)

func _physics_process(_delta):
	MoveManager()
	UiManager()
	move_and_slide()

func SetUps():
	ActiveChildNode["MoveComponent"].MoveSpeed = Atributo["GeneralStats"].MoveSpeed

func UiManager():
	if ActiveChildNode["InputComponent"].OpenInventory:
		ActiveChildNode["InventoryUi"].ShowUi(true)

func MoveManager():
	if ActiveChildNode["InputComponent"].PlayerDirection != Vector2.ZERO:
		ActiveChildNode["MoveComponent"].ChangeState("Move")
	else:
		ActiveChildNode["MoveComponent"].ChangeState("Idle")
		
	ActiveChildNode["MoveComponent"].PlayerDirection = ActiveChildNode["InputComponent"].PlayerDirection
	self.velocity = ActiveChildNode["MoveComponent"].PlayerFinalDirection
