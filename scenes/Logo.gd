extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,200)
	pos = Vector2(300,200)
	position = pos
	print('ready') # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta
	
