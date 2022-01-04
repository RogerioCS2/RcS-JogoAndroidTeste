/// @description Variaveis e Funções
 function MovimentoTiro(){	
	direction = point_direction(x, y, objMira.x, objMira.y);	
	image_angle = point_direction(x, y, objMira.x, objMira.y);
	speed = 10;
}

function DestruindoMunicao(){
	if(x > room_width + 30 || x < -20){
		instance_destroy();
	}
	if(y > room_height + 30 || y < -20){
		instance_destroy();
	}
}

 function ColisaoInimigo(){
	if(place_meeting(x,y, objInimigoPrincipal)){
		//show_debug_message("Acertei o Maledito");
		//instance_create_layer(x,y, "Mira", objSangueJorrando);
		instance_destroy();		
	}
}

MovimentoTiro();
