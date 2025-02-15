execute store result score .temp k.Values run data get entity @s SelectedItem.components."minecraft:damage"
execute store result storage k.temp:temp value int 1 run scoreboard players operation .temp k.Values -= .1 k.Values
function sg:update.cooldown with storage k.temp:temp