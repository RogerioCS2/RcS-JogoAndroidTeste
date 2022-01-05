// Script Script do inimigo 
function Colisao(){
	if(place_meeting(x + velocidadeHorizontal, y, objParede)){
		while !place_meeting(x + sign(velocidadeHorizontal), y, objParede){
			x += sign(velocidadeHorizontal);			
		}
		velocidadeHorizontal = 0;	
	}

	if(place_meeting(x, y + velocidadeVertical, objParede)){
		while !place_meeting(x, y + sign(velocidadeVertical), objParede){
			y += sign(velocidadeVertical);			
		}
		velocidadeVertical = 0;	
	}
	x += velocidadeHorizontal;
	y += velocidadeVertical;
}

function PerseguindoPlayer(){
	image_speed = 1.5;
	destinoX = objPlayer.x;
	destinoY = objPlayer.y;
	
	var direcao = point_direction(x, y, destinoX, destinoY);
	velocidadeHorizontal = lengthdir_x(velocidadePerseguindo, direcao);
	velocidadeVertical = lengthdir_y(velocidadePerseguindo, direcao);
	Colisao();
	if(distance_to_object(objPlayer) >= distPerdaVisao){
		//estado = EscolheEstado;
		alarm[0] = irandom_range(120, 240);
	}
}

function VerificaDistanciPlayer(){
	if(distance_to_object(objPlayer) <= distVisao){
		estado = PerseguindoPlayer;
	}
}

function InimigoParado(){
	image_speed = 0.5;	
	VerificaDistanciPlayer();
}

function InimigoAndando(){
	VerificaDistanciPlayer();	
	image_speed = 1;
	if(distance_to_point(destinoX, destinoY) > velocidade){
		var direcao = point_direction(x, y, destinoX, destinoY);
		velocidadeHorizontal = lengthdir_x(velocidade, direcao);
		velocidadeVertical = lengthdir_y(velocidade, direcao);
		Colisao();
	}else{
		x = destinoX;
		y = destinoY;
	}
}

function EscolheEstado(){
	proximoEstado = choose(InimigoAndando, InimigoParado);
	if(proximoEstado == InimigoAndando){
		estado = InimigoAndando;	
		destinoX = irandom_range(0, room_width);
		destinoY = irandom_range(0, room_height);
	}else{
		estado = InimigoParado;		
	}
	VerificaDistanciPlayer();
}

function EfeitoDanoInimigo(){
	image_blend = c_red;	
	tempoDanoInimigo--;
	if(tempoDanoInimigo <= 0){		
		tempoDanoInimigo = room_speed / 4;
		image_blend = c_white;
		estado = PerseguindoPlayer;
	}	
	empurrarVeloc = lerp(empurrarVeloc, 0, 0.2);	
	velocidadeHorizontal = lengthdir_x(empurrarVeloc, empurrarDir);
	velocidadeVertical = lengthdir_y(empurrarVeloc, empurrarDir);
	Colisao();	
}

function InimigoLevandoDano(){
	//if(place_meeting(x, y, objBolaInimigo)){estado = EfeitoDanoInimigo;}	
	if(place_meeting(x, y, objMunicao)){estado = EfeitoDanoInimigo;}
	depth = -y;
	if(vida <=0){
		//objPlayer.experiencia += 3;
		instance_destroy();
	}
}

function UpdateInimigo(){
	InimigoLevandoDano();
}