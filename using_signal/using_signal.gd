extends Sprite2D

var speed: float = 400.0
var angular_speed: float = PI # 角度默认为弧度

func _process(delta: float) -> void:
	rotation += angular_speed * delta
	var velocity: Vector2 = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_button_pressed() -> void:
	set_process(not is_processing())

func _ready() -> void:
	var timer: Timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	visible = not visible
