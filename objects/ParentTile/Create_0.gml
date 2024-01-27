/// @description Initialization for tiles

position = [0, 0];
adj_tiles = [];
change_to = event_object;
recreate = false;
beingAttacked = false;
damageTaken = 0;

maxHP = 10;
tileHP = maxHP;

pathCourse = [];
path = emptyPath;

interactionTileTop = instance_create_layer(x, y, "TileTops", Obj_TileTop);
interactionTileTop.relatedTile = id;

tileTower = pointer_null;

startSpawning = false;