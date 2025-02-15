execute if data storage k.temp:temp gunInfo.explosion{active:true,can_damage_ground:true} run summon creeper ~ ~ ~ {Fuse:0}
execute if data storage k.temp:temp gunInfo.explosion{active:true,can_damage_ground:false} run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:0}
execute if data storage k.temp:temp gunInfo.function run function sg:run.function with storage k.temp:temp gunInfo