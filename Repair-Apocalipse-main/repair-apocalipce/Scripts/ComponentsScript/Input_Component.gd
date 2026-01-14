extends Node
class_name InputCollector

@export var Active = true
var Up : bool = false
var Down : bool = false
var Left : bool = false
var Right : bool = false
var Interact : bool = false
var PlayerDirection : Vector2 = Vector2.ZERO
var OpenInventory : bool = false


func _physics_process(_delta):
    if Active:
        UpdateInput()
    else: 
        pass

func UpdateInput():
    Interact = Input.is_action_pressed("Interact")
    OpenInventory = Input.is_action_just_pressed("OpenInventory")
    #print(OpenInventory)

    PlayerDirection.y = Input.get_action_strength("Down") - Input.get_action_strength("Up") 
    PlayerDirection.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
    PlayerDirection.normalized()

func Activity(Estado : int = 1):
    match Estado:
        0:
            Active = false
        1:
            Active = true
