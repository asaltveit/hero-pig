extends Area2D

var type = "star"

func _on_body_entered(body):
	if body.name == "Pig":
		Global.curPowerUp = type
		SignalBus.updateHUD.emit()
		self.queue_free()
	
