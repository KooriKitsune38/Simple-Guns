scoreboard players reset .temp
$damage @s $(damage) $(damage_type) by @p[tag=.temp]
tag @s add .target
function sg:ray.end
tag @s remove .target