extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/Item_display

func update(slot: InvSlot):
	if !slot:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
