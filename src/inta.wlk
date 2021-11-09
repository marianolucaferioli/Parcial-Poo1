object inta {
	var parcelas = #{}
	
	method promedioDePlantasPorParcelas() { 
		const totalDePlantas = parcelas.sum{ parcela => parcela.cantPlantasEnParcela() }
		return totalDePlantas % parcelas.size()
	}
	
	method parcelaMasAutosustentable() {
		const parcelasEnConsideracion = parcelas.filter{ parcela => parcela.cantPlantasEnParcela() > 4 }
		
		return parcelasEnConsideracion.max{ parcela => parcela.porcentajeDePlantasBienAsociadas() }
	}
	
}







