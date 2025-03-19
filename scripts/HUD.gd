extends CanvasLayer

@onready var pULabel = $PULabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.updateHUD.connect(updateHUD)

func updateHUD():
	if Global.curPowerUp:
		pULabel.text = "Power Up: " + Global.curPowerUp
	else:
		pULabel.text = ""
		
func _process(_delta):
	pass

