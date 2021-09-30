class Persona {
	var temperatura = 36
	var cantCelulas = 7000000
	var enfermedades = #{}
	
	method cantCelulas() = cantCelulas
	
	method contraer(enfermedad){
		self.validarCantidadEnfermedades()
		enfermedades.add(enfermedad)
	}
	
	method validarCantidadEnfermedades(){
		if(enfermedades.size() >= 7){
			throw new DomainException(message="No se pueden contraer más enfermedades")
		}
	}
	
	method tenes(enf) = enfermedades.contains(enf)
	
	method viviUnDia(){
		enfermedades.forEach({cadaEnf => cadaEnf.producirEfecto(self)})
	}
	
	method modificarTemperatura(cant){
		temperatura = (temperatura + cant).min(45)
	}
	
	method modificarCelulas(cant){
		cantCelulas = cantCelulas + cant
	}
	
	method estaEnComa() = cantCelulas < 1000000 || temperatura >= 40
	
	method cantidadDeCelulasAgresivas() = self.enfermedadesAgresivas().sum({cadaEnf => cadaEnf.cantCelulasAmenazadas()})

	method enfermedadesAgresivas() = enfermedades.filter({enfermedad => enfermedad.esAgresiva(self)})
	
	method laQueMasCelulasAfecta() = enfermedades.max({enfermedad => enfermedad.cantCelulasAmenazadas()})
}	