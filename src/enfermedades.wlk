
class EnfermedadDeCelulas{
	var cantCelulasAmenazadas 
	
	method atenuar(dosis,persona){
		self.reducirCelulas(dosis)
		if(cantCelulasAmenazadas == 0){
			persona.curarseDe(self)
		}
	}
	
	method reducirCelulas(dosis){
		cantCelulasAmenazadas = (cantCelulasAmenazadas - dosis * 15).max(0)
	}
}


class EnfermedadInfecciosa inherits EnfermedadDeCelulas{
	
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

class EnfermedadAutoinmune inherits EnfermedadDeCelulas{
	var cantVecesProducidoEfecto = 0
	
	method cantCelulasAmenazadas() = cantCelulasAmenazadas
	
	method producirEfecto(persona){
		persona.modificarCelulas(-cantCelulasAmenazadas)
		cantVecesProducidoEfecto = cantVecesProducidoEfecto + 1
	}
	
	method esAgresiva(persona) = cantVecesProducidoEfecto > 30
}

object laHipotermia{
	method producirEfecto(persona){
		persona.disminuirTodaTemperatura()
	}
	
	method esAgresiva(persona) = true
	
	method atenuar(dosis){}
	
	method cantCelulasAmenazadas() = 0
	
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
