import parcelas.*

class Planta {
	const property anioDeObtencionSemilla
	const property altura
	
	method horasDeSolQueTolera()
	
	method esFuerte() = self.horasDeSolQueTolera() > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacioQueOcupaPlantada() 
	
	method esParcelaIdeal(unaParcela)
	
	method seAsociaBien(unaParcela) = unaParcela.puedeAsociar(self)
}

class Menta inherits Planta {
	
	override method horasDeSolQueTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacioQueOcupaPlantada() = altura * 3
	
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method horasDeSolQueTolera() = if (altura < 0.5) {6} else if (altura.between(0.5,1)) {7} else {9}
	
	override method daNuevasSemillas() = super() or anioDeObtencionSemilla > 2007 and altura > 1
	
	override method espacioQueOcupaPlantada() = altura / 2
	
	override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolQueRecibe() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta {
	const horasDeSolQueTolera
	
	override method horasDeSolQueTolera() = horasDeSolQueTolera
	
	override method daNuevasSemillas() = super() or anioDeObtencionSemilla < 2005
	
	override method espacioQueOcupaPlantada() = 0.5
	
	override method esParcelaIdeal(unaParcela) = not unaParcela.plantasEnParcela().any{ p => p.altura() > 1.5 }
}

// Variedades

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(unaParcela) = unaParcela.maximoDePlantas() == 1
}

class Hierbabuena inherits Menta {
	
	override method espacioQueOcupaPlantada() = altura * 6
}












