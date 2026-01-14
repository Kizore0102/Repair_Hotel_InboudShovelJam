extends Node
class_name PlayerMoveComponent

@export var Active = true
var MoveSpeed : float
var PlayerDirection : Vector2
var PlayerFinalDirection : Vector2

enum MoveState{
	Idle,
	Move
}
@export var CurrentState = MoveState.Idle

func _physics_process(_delta):
	if Active:
		match CurrentState:
			MoveState.Idle:
				IdlePlayer()
			MoveState.Move:
				MovePlayer()

func IdlePlayer():
	PlayerFinalDirection = Vector2.ZERO

func MovePlayer():
	PlayerFinalDirection = PlayerDirection * MoveSpeed

func Activity(Estado : int = 1):
	match Estado:
		0:
			Active = false
		1:
			Active = true

func ChangeState(Estado : String = ""):
	match Estado:
		"Idle":
			CurrentState = MoveState.Idle
		"Move":
			CurrentState = MoveState.Move
