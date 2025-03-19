extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var pigSprite = $PigSprite
@onready var leftCollisionShape = $LeftCol
@onready var rightCollisionShape = $RightCol



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("power"):
		Global.curPowerUp = ""
		SignalBus.updateHUD.emit()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("walk-left", "walk-right")
	if direction:
		velocity.x = direction * SPEED
	else: #?
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("walk-left"):
		pigSprite.play("left")
		# Toggle collision shapes
		leftCollisionShape.disabled = false
		rightCollisionShape.disabled = true
	elif Input.is_action_pressed("walk-right"):
		pigSprite.play("right")
		# Toggle collision shapes
		leftCollisionShape.disabled = true
		rightCollisionShape.disabled = false
	else:
		pigSprite.stop()

	move_and_slide()
