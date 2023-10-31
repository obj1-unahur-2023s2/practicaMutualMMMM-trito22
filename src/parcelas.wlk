import plantas.*

class Parcela {
	var ancho
	var largo
	var property horasAlSol
	const property plantas = #{}
	
	method cantidadPlantas() = plantas.size()
	
	method superficie() = ancho * largo
	method cantidaMaximaDePlantasQueTolera() = 
		if(ancho > largo) { self.superficie() / 5 }
		else { self.superficie() / 3 + largo }
	
	method tieneComplicaciones() = 
		plantas.any({ p => p.horasDeSolQueTolera() < horasAlSol})
	
	
	method plantarPlanta(unaPlanta) {
		if(self.condicionDeHoras(unaPlanta) or self.condicionDeTamanio(unaPlanta))
			self.error("No se pueden tener tantas plantas")
		else
			plantas.add(unaPlanta)
	}
	
	method condicionDeHoras(unaPlanta) = plantas.size() > self.cantidaMaximaDePlantasQueTolera()
	method condicionDeTamanio(unaPlanta) = unaPlanta.horasDeSolQueTolera()+2 < horasAlSol
	
	//Si se le sumara un conjunto en vez de una unica planta
	method plantarPlantaCon(unConjunto) {
		if(self.condicionDeHorasCon(unConjunto) or self.condicionDeTamanioCon(unConjunto))
			self.error("No se pueden tener tantas plantas")
		else
			plantas.addAll(unConjunto)	}
			
	method condicionDeHorasCon(unConjunto) = plantas.any({ p => p.horasDeSolQueTolera()+2 < horasAlSol})
	method condicionDeTamanioCon(unConjunto) = plantas.size() + unConjunto.size() > self.cantidaMaximaDePlantasQueTolera()
	
	method parcelaEsIdeal() = plantas.all({p => p.esIdealLaParcela(self)})
	
	method plantasNoPasanDe(unaAltura) = plantas.all({ p => p.altura() < unaAltura})
}

class ParcelaEcologica inherits Parcela {
	var property plantasAutosustentables = []
	
	
	method seAsociaBienAEcologica(unaPlanta) = unaPlanta.seAsociaBienAEco(self)
	
	method todasSeAsociaBien() = plantas.all({p => p.seAsociaBienAEco(self)})
	
	method aniadorPlantasAutoSustentables() = plantasAutosustentables.addAll(plantas.filter({p => p.seAsociaBienAEco(self)}))
}

class ParcelaIndustrial inherits Parcela {
	var property plantasAutosustentables = []
	
	
	method seAsociaBienAIndustrial(unaPlanta) = unaPlanta.seAsociaBienAIndus(self)
	
	method todasSeAsociaBien() = plantas.all({p =>p.seAsociaBienAIndus(self)})
	
	method plantasFuertes() = plantas.filter({p =>p.seAsociaBienAIndus(self)})
	
	method aniadorPlantasAutoSustentables() = 
		if(plantasAutosustentables.size() + self.plantasFuertes().size() <= 2) { plantasAutosustentables.addAll(self.plantasFuertes()) }
		else {
			plantasAutosustentables.add(plantasAutosustentables.first())
			plantasAutosustentables.add(plantasAutosustentables.last())
		}
}








