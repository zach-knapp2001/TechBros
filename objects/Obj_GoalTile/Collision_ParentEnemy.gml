/// @description Loses health when colliding with enemy


tileHP -= other.damage;
show_debug_message(tileHP);
instance_destroy(other);
