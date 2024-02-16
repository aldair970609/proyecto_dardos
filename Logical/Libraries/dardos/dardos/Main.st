
PROGRAM _INIT
	(* Insert code here *)
	listo := 0;
	VC_HANDLE := 0;
//	x := 230;
//	y := 230;
	relleno := 250;
	perimetro_color := 0;
	ready := 0;
	ancho_alto;
	circulo := 0;

	
	x_posicion;
	y_posicion;
	
	ancho_alto [7] := 350;
	ancho_alto [6] := 300;
	ancho_alto [5] := 250;
	ancho_alto [4] := 200;
	ancho_alto [3] := 150;
	ancho_alto [2] := 100;
	ancho_alto [1] := 50;
	
	fill [7] := 164;
	fill [6] := 250;
	fill [5] := 164;
	fill [4] := 250;
	fill [3] := 164;
	fill [2] := 250;
	fill [1] := 19;
	
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	
	touch;
	current_page;
	
// habilitar variable con teclado //
	
	IF updateRadio THEN
		VA_Redraw (1,VC_HANDLE);
	END_IF;
	// habilitar setup //
	VC_HANDLE := VA_Setup(1,SPD);
	IF VC_HANDLE <> 0 THEN
		ready := 1;
	
		ELSE VC_HANDLE := 0;
	END_IF;
	// empezar a dibujar //
	
//	IF ready = 1 AND current_page = 18 THEN
//		IF VA_Saccess(1,VC_HANDLE) = 0  THEN	
//			VA_Rect(1,VC_HANDLE,50,50,400,360,250,0);
//			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto,ancho_alto,color,0);
//		END_IF;
//		END_IF;
	//dibujo en estado inicial //
	IF ready = 1 AND current_page = 18  THEN
		IF VA_Saccess(1,VC_HANDLE) = 0  THEN
			VA_GetTouchAction (1,VC_HANDLE,1,ADR(touch));
			x_posicion := touch.x;
			y_posicion := touch.y;
			touch_status := touch.status;
			VA_Rect(1,VC_HANDLE,50,50,370,360,11,0);
    		VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[7],ancho_alto[7],fill[7],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[6],ancho_alto[6],fill[6],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[5],ancho_alto[5],fill[5],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[4],ancho_alto[4],fill[4],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[3],ancho_alto[3],fill[3],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[2],ancho_alto[2],fill[2],0);
			VA_Ellipse (1,VC_HANDLE,x,y,ancho_alto[1],ancho_alto[1],fill[1],0);
			VA_Srelease (1,VC_HANDLE);
		END_IF;
	END_IF;
	
	//los posibles circulos y sus tamaños//
	
	IF circulo = 7 AND updateRadio THEN

			updateRadio := FALSE;
			ancho_alto[7] := radio;
		    fill[7] := 164; 
	END_IF;
		
	IF circulo = 6 AND updateRadio THEN
		updateRadio := FALSE;
			
			ancho_alto[6] := radio;
			fill [6] := 250;
		END_IF;
	
		IF circulo = 5 AND updateRadio THEN
			updateRadio := FALSE; 
		
		ancho_alto[5] := radio;
		fill [5] := 164;
		
	END_IF;
	
				
		IF circulo = 4 AND updateRadio THEN
		updateRadio := FALSE; 
		
		ancho_alto[4] := radio;
		fill [4] := 250;
		
	END_IF;

		IF circulo = 3 AND updateRadio THEN
		updateRadio := FALSE; 
		
		ancho_alto[3] := radio;
		fill [3] := 164;

			END_IF;

		IF circulo = 2 AND updateRadio THEN
		updateRadio := FALSE;
		
		ancho_alto[2] := radio;
		fill [2] := 250;

		END_IF;
				

    	IF circulo = 1 AND updateRadio THEN
		updateRadio := FALSE;
		
		ancho_alto[1] := radio;
		fill [1] := 19;
				
	END_IF;
	
	
	
	
		
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

