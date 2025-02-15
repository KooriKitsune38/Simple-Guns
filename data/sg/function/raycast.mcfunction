scoreboard players add .temp k.Values 1
execute if entity @n[dx=0,tag=!.temp,nbt={Brain:{}},type=!armor_stand] as @n[dx=0,tag=!.temp,nbt={Brain:{}},type=!armor_stand] run return run function sg:damage with storage k.temp:temp gunInfo
particle ash ^ ^ ^ .05 .05 .05 1 1 normal
execute unless score .temp k.Values >= .max k.Values positioned ^ ^ ^.5 if block ^ ^ ^ #sg:ray.passable run function sg:raycast
execute unless block ^ ^ ^.5 #sg:ray.passable run function sg:ray.end