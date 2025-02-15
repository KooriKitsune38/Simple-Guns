advancement revoke @s only sg:used.gun

execute unless data entity @s SelectedItem.components{"minecraft:damage":0} run return fail

# check if ammo or not
execute if predicate sg:no_ammo run return run function sg:reload.gun with entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun"

# Shoot
execute if predicate sg:no_ammo run return fail

#> Start Cooldown
function sg:activate.cooldown with entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun"

#> Instantiate Raycast
execute store result score .max k.Values run data get entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun".rayDistance
data modify storage k.temp:temp gunInfo set from entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun"
function sg:recoil with entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun"

tag @s add .temp
execute anchored eyes positioned ^ ^ ^.5 run function sg:raycast
tag @s remove .temp

#> Remove Bullet
execute store result score .temp k.Values run data get entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun".loadedAmmo
execute store result score .usage k.Values run data get entity @s SelectedItem.components."minecraft:custom_data"."sg.Gun".ammoUsage
scoreboard players operation .temp k.Values -= .usage k.Values
execute store result storage k.temp:temp value byte 1 run scoreboard players get .temp k.Values
function sg:set.ammo.amount with storage k.temp:temp

# Sounds
playsound block.stone.break player @a ~ ~ ~ 2 1.3
playsound minecraft:block.end_gateway.spawn player @a ~ ~ ~ 1 2