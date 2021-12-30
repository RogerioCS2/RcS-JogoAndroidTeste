// Script Controles do Jogo 

function JoystickE(){	
	if(!alvo){exit;}
	var pontoX = device_mouse_x_to_gui(0);
	var pontoY = device_mouse_y_to_gui(0);
	var sobre = point_in_circle(pontoX, pontoY, x, y, sprite_width / 2);
	var toque = device_mouse_check_button(0, mb_left)

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

function Movimento(){
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