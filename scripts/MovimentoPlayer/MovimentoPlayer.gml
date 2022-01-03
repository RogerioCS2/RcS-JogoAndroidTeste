// Script Movimento do Protagonista 

function MovimentoP(){
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

function playerParado(){
	
}

function TiroPlayer(){
	tempoTiro--;
	if(tempoTiro < 0){
		tempoTiro = 13;
		//instance_create_layer(x + 4, y, layer, objMunicaoPistola); 
		show_debug_message("Bang!!");
	}	
}