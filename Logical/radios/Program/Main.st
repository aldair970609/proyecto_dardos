
PROGRAM _INIT
	(* Insert code here *)
	puntaje_intermediario[7] := 10;
	puntaje_intermediario[6] := 20;
	puntaje_intermediario[5] := 30;
	puntaje_intermediario[4] := 40;
	puntaje_intermediario[3] := 50;
	puntaje_intermediario[2] := 60;
	puntaje_intermediario[1] := 70;
END_PROGRAM

PROGRAM _CYCLIC
	// VALOR DEL DIAMETRO EN CUALQUIER PUNTO DE LA PANTALLA PARA TOMAR VALORES ENTRE LOS CIRCULOS //
	x_real := UINT_TO_REAL (x);
	y_real := UINT_TO_REAL (y);
	x_posicion_real := UDINT_TO_REAL (x_posicion);
	y_posicion_real := UDINT_TO_REAL (y_posicion);
diametro_touch := (SQRT ((EXPT((x_real-x_posicion_real),2)) + (EXPT((y_real-y_posicion_real),2))))*2;
//VALOR DE LOS PUNTAJES//

	IF  diametro_touch < ancho_alto[7] AND diametro_touch >= ancho_alto[6] THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario[7];
			ELSE valor_score := 0;
		END_IF;
			END_IF;
	
	IF diametro_touch < ancho_alto [6] AND diametro_touch >= ancho_alto [5] THEN
			IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
				valor_score := puntaje_intermediario [6];
			ELSE valor_score := 0;
			END_IF;
		END_IF;		
	
	IF diametro_touch < ancho_alto [5] AND diametro_touch >= ancho_alto [4] THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario [5];
		ELSE valor_score := 0;
		END_IF;
	END_IF;	
	
	IF diametro_touch < ancho_alto [4] AND diametro_touch >= ancho_alto [3] THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario [4];
		ELSE valor_score := 0;
		END_IF;
	END_IF;	
	
	IF diametro_touch < ancho_alto [3] AND diametro_touch >= ancho_alto [2] THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario [3];
				ELSE valor_score := 0;
		END_IF;
	END_IF;	
	
	IF diametro_touch < ancho_alto [2] AND diametro_touch >= ancho_alto [1] THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario [2];
				ELSE valor_score := 0;
		END_IF;
	END_IF;	
	
	IF diametro_touch < ancho_alto [1]  THEN
		IF current_page = 18 AND EDGEPOS (touch_status = 1) THEN
			valor_score := puntaje_intermediario[1];
				ELSE valor_score := 0;
		END_IF;
	END_IF;	
	
	//elegir los puntajes para cada circulo //
	
	IF segment_score = 7 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [7] := puntaje;
	END_IF;
	
	IF segment_score = 6 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [6] := puntaje;
	END_IF;
	
	IF segment_score = 5 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [5] := puntaje;
	END_IF;
	
	IF segment_score = 4 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [4] := puntaje;
	END_IF;
	
	IF segment_score = 3 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [3] := puntaje;
	END_IF;
	
	IF segment_score = 2 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [2] := puntaje;
	END_IF;
	
	IF segment_score = 1 AND update_puntaje THEN
		update_puntaje := FALSE;
		puntaje_intermediario [1] := puntaje;
	END_IF;
	
	
	// valor de puntaje acumulado //
	puntaje_acumulado := puntaje_acumulado + valor_score;
	
	//cantidad de tiros //
	IF current_page = 18 AND EDGEPOS (touch_status =1) AND resetear = FALSE AND x_posicion > 50 AND x_posicion < 420 AND y_posicion > 50 AND y_posicion < 410 THEN
	  cantidad_tiros := cantidad_tiros +1;
	END_IF;
	
	//resetear puntos y tiros //
	
	IF EDGEPOS (resetear)  THEN
		cantidad_tiros := 0;
		puntaje_acumulado := 0;
		ELSE resetear := FALSE;
	
	END_IF;
	

END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

