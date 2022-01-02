// Script Controles do Jogo 
function JoystickE(){	
	if(!alvo){exit;}
	var pontoX = device_mouse_x_to_gui(0);
	var pontoY = device_mouse_y_to_gui(0);
	var sobre = point_in_circle(pontoX, pontoY, x, y, sprite_width / 2);
	var toque = device_mouse_check_button(0, mb_left);
	if(sobre or acompanharToque == true){
		if(toque){
			var distancia = point_distance(x, y, pontoX, pontoY);
			vel = min(distancia,sprite_width / 2);
			dir = point_direction(x, y, pontoX, pontoY);
			acompanharToque = true;
		}	
	}
	if(!toque){
		acompanharToque = false;
		vel = lerp(vel, 0, 0.2);
	}	
	var xx, yy;
	xx = lengthdir_x(vel, dir);
	yy = lengthdir_y(vel, dir);	
	draw_sprite_ext(sprBaseAlavanca, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.50);
	draw_sprite_ext(sprAlavanca, 0, x + xx, y + yy, image_xscale, image_yscale, 0, c_white, 0.50);
}

function MovimentoP(){
	if(!alvo){exit;}
	if(!instance_exists(alvo)){exit;}	
	var xx, yy;
	xx = lengthdir_x(vel, dir);
	yy = lengthdir_y(vel, dir);	
	var velocidadeH = (xx / sprite_width * 2) * velocidadeMaxima;
	var velocidadeV = (yy / sprite_height * 2) * velocidadeMaxima;	
	alvo.x += velocidadeH;
	alvo.y += velocidadeV;
}

function JoystickD(){	
	if(!alvo){exit;}	
	var pontoX = device_mouse_x_to_gui(0);
	var pontoY = device_mouse_y_to_gui(0);
	var sobre = point_in_circle(pontoX, pontoY, x, y, sprite_width / 2);
	var toque = device_mouse_check_button(0, mb_left);
	if(sobre or acompanharToque == true){
		if(toque){
			var distancia = point_distance(x, y, pontoX, pontoY);
			vel = min(distancia,sprite_width / 2);
			dir = point_direction(x, y, pontoX, pontoY);
			acompanharToque = true;
		}	
	}
	if(!toque){
		acompanharToque = false;
		vel = lerp(vel, 0, 0.2);
	}
	var xx, yy;
	xx = lengthdir_x(vel, dir);
	yy = lengthdir_y(vel, dir);	
	draw_sprite_ext(sprBaseAlavancaD, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.50);
	draw_sprite_ext(sprAlavancaD, 0, x + xx, y + yy, image_xscale, image_yscale, 0, c_white, 0.50);
}

function MovimentoM(){
	if(!alvo){exit;}
	if(!instance_exists(alvo)){exit;}	
	var xx, yy;
	xx = lengthdir_x(vel, dir);
	yy = lengthdir_y(vel, dir);	
	var velocidadeH = (xx / sprite_width * 2) * velocidadeMaxima;
	var velocidadeV = (yy / sprite_height * 2) * velocidadeMaxima;	
	alvo.x += velocidadeH;
	alvo.y += velocidadeV;
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

function BotoesCentro(){	
	virtual_key_add(748, 900, 128, 128, vk_left);
	virtual_key_add(904, 900, 128, 128, vk_right);
	
	var atirar = keyboard_check_pressed(vk_right);
	var pausar = keyboard_check_pressed(vk_left);
	
	if(atirar){
		atirando = !atirando;
		if(atirando){
			estado = TiroPlayer; 		
		}else{
			estado = playerParado;					
		}		
	}
	
	if(pausar){
		jogoEmPausa = !jogoEmPausa;	
		show_debug_message("Jogo Pausado");
		show_debug_message(jogoEmPausa);
	}
}

function BotoesCentroUI(){
	draw_sprite_ext(sprPause, 0, 848, 928, 1, 1, 0, c_white, 0.50);
	draw_sprite_ext(sprTiro, 0, 1000, 928, 1, 1, 0, c_white, 0.50);
}