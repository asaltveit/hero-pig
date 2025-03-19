extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animatedSprite = $AnimatedSprite2D
@onready var notAttackCollision = $NotAttackCollision
@onready var attackCollision = $AttackCollision

func _ready():
	animatedSprite.play("walk")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# not moving
	velocity.x = SPEED * delta
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#var collisions = get_slide_collision_count()
	#for i in collisions:
		#var collision = get_slide_collision(i)
		#print("I collided with ", collision.get_collider().name)
		#if collision.get_collider().name == "Pig":
			#notAttackCollision.disabled = true
			#attackCollision.disabled = false
			#animatedSprite.play("attack")
		#else:
			#notAttackCollision.disabled = false
			#attackCollision.disabled = true
			#animatedSprite.play("walk")
	#if !collisions:
		#notAttackCollision.disabled = false
		#attackCollision.disabled = true
		#animatedSprite.play("walk")
