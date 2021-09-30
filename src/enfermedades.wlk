class EnfermedadInfecciosa {
	var cantCelulasAmenazadas = 0
	
	method reproducirse(){
		cantCelulasAmenazadas = cantCelulasAmenazadas * 2
	}
	
	method cantCelulasAmenazadas() = cantCelulasAmenazadas
	
	method producirEfecto(persona){
		// no es sintácticamente válido:
		// pero el problema más grande es que ROMPE ENCAPSULAMIENTO
		//persona.temperatura() = persona.temperatura() - cantCelulasAmenazadas / 1000
		
		//persona.temperatura(persona.temperatura() + cantCelulasAmenazadas / 1000)
		
		persona.modificarTemperatura(cantCelulasAmenazadas / 1000)
	}
	
	method esAgresiva(persona) = cantCelulasAmenazadas > 0.001 * persona.cantCelulas()
	
}

class EnfermedadAutoinmune {
	var cantCelulasAmenazadas = 0
	var cantVecesProducidoEfecto = 0
	
	method cantCelulasAmenazadas() = cantCelulasAmenazadas
	
	method producirEfecto(persona){
		persona.modificarCelulas(-cantCelulasAmenazadas)
		cantVecesProducidoEfecto = cantVecesProducidoEfecto + 1
	}
	
	method esAgresiva(persona) = cantVecesProducidoEfecto > 30
}

// otra versión: (LA MALA)
/*
 * 
class Enfermedad {
	var esInfecciosa = true
	method reproducite(){
	  if esInfecciosa...
	} 
	method producirEfecto{
	   if esInfecciosa
	}
	  
}
 */

// otra versión más:
/*
class Enfermedad {
   var tipoEnfermedad = infecciosa
}
 * 
 */
