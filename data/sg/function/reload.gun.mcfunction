execute store result score .temp k.Values run clear @s iron_nugget[custom_data~{sg.Bullet:true}] 0
execute store result score .max k.Values run data get entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun".maxAmmo

scoreboard players operation .max k.Values -= .current k.Values

execute if score .temp k.Values matches 0 run return run tellraw @s [{"text":"♡ You ain't got ammo girl ♡","color":"red"}]
execute if score .temp k.Values <= .max k.Values store result storage k.temp:temp value byte 1 run scoreboard players operation .temp k.Values += .current k.Values
execute if score .temp k.Values > .max k.Values store result storage k.temp:temp value byte 1 run scoreboard players operation .max k.Values += .current k.Values
function sg:set.ammo.amount with storage k.temp:temp
function sg:clear.bullets with storage k.temp:temp

function sg:activate.cooldown with entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun"

# Visuals
playsound minecraft:entity.player.burp player @a ~ ~ ~ 1 2
playsound minecraft:item.shield.block player @a ~ ~ ~ 1 2
playsound minecraft:ui.stonecutter.take_result player @a ~ ~ ~ 2 2