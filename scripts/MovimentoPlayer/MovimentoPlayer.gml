// Script Movimento do Protagonista 

function MovimentoP(){
	image_angle = point_direction(x,y, objMira.x, objMira.y);
	var velocidadeHorizontal, velocidadeVertical;
	velocidadeHorizontal = lengthdir_x(objControleE.vel, objControleE.dir);
	velocidadeVertical = lengthdir_y(objControleE.vel, objControleE.dir);	
	if(place_meeting(x + velocidadeHorizontal, y, objParede)){
		while !place_meeting(x + sign(velocidadeHorizontal), y, objParede){
			x += sign(velocidadeHorizontal);			
		}
		velocidadeHorizontal = 0;	
	}	
	if(place_meeting(x , y + velocidadeVertical, objParede)){
		while !place_meeting(x, y + sign(velocidadeVertical), objParede){
			y += sign(velocidadeVertical);			
		}
		velocidadeVertical = 0;	
	}
	var velocidadeH = (velocidadeHorizontal / sprite_width * 2) * objControleE.velocidadeMaxima;
	var velocidadeV = (velocidadeVertical / sprite_height * 2) * objControleE.velocidadeMaxima;	
	objControleE.alvo.x += velocidadeH;
	objControleE.alvo.y += velocidadeV;
}

function MovimentoM(){	
	var velocidadeHorizontal, velocidadeVertical;
	velocidadeHorizontal = lengthdir_x(objControleD.vel, objControleD.dir);
	velocidadeVertical = lengthdir_y(objControleD.vel, objControleD.dir);	
	if(place_meeting(x + velocidadeHorizontal, y, objParede)){
		while !place_meeting(x + sign(velocidadeHorizontal), y, objParede){
			x += sign(velocidadeHorizontal);			
		}
		velocidadeHorizontal = 0;	
	}	
	if(place_meeting(x , y + velocidadeVertical, objParede)){
		while !place_meeting(x, y + sign(velocidadeVertical), objParede){
			y += sign(velocidadeVertical);			
		}
		velocidadeVertical = 0;	
	}		
	var velocidadeH = (velocidadeHorizontal / sprite_width * 2) * objControleD.velocidadeMaxima;
	var velocidadeV = (velocidadeVertical / sprite_height * 2) * objControleD.velocidadeMaxima;	
	objControleD.alvo.x += velocidadeH;
	objControleD.alvo.y += velocidadeV;
}

function playerParado(){
	
}

function TiroPlayer(){
	tempoTiro--;
	if(tempoTiro < 0){
		tempoTiro = 13;
		instance_create_layer(x + 4, y, layer, objMunicao); 
		//show_debug_message("Bang!!");
	}	
}

function EfeitoDano(){	
	image_blend = c_red;	
	tempoDano--;
	if(tempoDano <= 0){
		if(vidaPlayer > 0){
			vidaPlayer--;
		}		
		tempoDano = room_speed / 4;
		image_blend = c_white;
		estado = playerParado;
	}
	
	if(vidaPlayer <= 0){
		//room_goto(GameOver);
	}
}

function LevandoDano(){
	//if(place_meeting(x, y, objBolaPrimeiroInimigo)){estado = EfeitoDano;}	
	if(place_meeting(x, y, objInimigoPrincipal)){estado = EfeitoDano;}
}	

function UpdatePlayer(){
	BotoesCentro();
	MovimentoP();
	LevandoDano();
}

