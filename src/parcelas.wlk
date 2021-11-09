import plantas.*

class Parcela {
	const property ancho
	const property largo
	const property horasDeSolQueRecibe
	var plantas = []
	
	method superficie() = ancho * largo
	
	method maximoDePlantas() = if (ancho > largo) {self.superficie() / 5} else {(self.superficie() / 3) + largo}
	
	method tieneComplicaciones() = plantas.any{ planta => planta.horasDeSolQueTolera() < horasDeSolQueRecibe }
	
	method plantar(unaPlanta) {
		if  (plantas.size() > self.maximoDePlantas() or horasDeSolQueRecibe - 2 >= unaPlanta.horasDeSolQueTolera() ) {
			self.error("No es posible plantar esta planta en la parcela!")
		} else {
			plantas.add(unaPlanta)
		}
	}
	
	method plantasEnParcela() = plantas
	
	method cantPlantasEnParcela() = plantas.size()
	
	method puedeAsociar(unaPlanta)
	
	method porcentajeDePlantasBienAsociadas() {
		const cantPlantasBienAsociadas = plantas.filter({ planta => self.puedeAsociar(planta) }).size()
		
		return (self.cantPlantasEnParcela() * cantPlantasBienAsociadas) / 100
	}
}

class ParcelaEcologica inherits Parcela {
	
	override method puedeAsociar(unaPlanta) = unaPlanta.esParcelaIdeal(self) and not self.tieneComplicaciones()
}

class ParcelaIndustrial inherits Parcela {
	
	override method puedeAsociar(unaPlanta) = unaPlanta.esFuerte() and self.cantPlantasEnParcela() <= 2
}









