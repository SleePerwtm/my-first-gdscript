extends Sprite2D

var speed: float = 400.0
var angular_speed: float = PI # 角度默认为弧度

# 实现了使用方向键操控 Sprite 移动的函数
func _process(delta: float) -> void:
	var direction: int = 0
	if Input.is_action_pressed("ui_right"):
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		direction = -1
	rotation += angular_speed * delta * direction # 根据方向键旋转 Sprite
	
	var velocity: Vector2 = Vector2.ZERO # 新建速度二维向量
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed # 根据方向键计算速度向量
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN.rotated(rotation) * speed # 根据方向键计算速度向量
	position += velocity * delta
