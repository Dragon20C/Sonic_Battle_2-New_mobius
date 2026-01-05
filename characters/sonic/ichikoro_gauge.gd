extends ProgressBar

# making  this export means we can find our player e.g sonic!
@export var parent : Node3D
var max_value_amount
var min_value_amount
# Called when the node enters the scene tree for the first time.
func _ready():
	max_value_amount = parent.Maxichikoro
	min_value_amount = 0
 # Replace with function body.
	self.max_value = max_value_amount
	self.min_value = min_value_amount

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.value = parent.ichikoro
	if self.value == self.max_value and not parent.health < 30:
		$"../../filter effects".play("full_ichikoro")
