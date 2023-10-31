import socios.*

class Viajes {
	const property idiomas = #{}
	
	method implicaEsfuerzo() 
	method sirveParaBroncear() 
	method diasDeActividad() 
	method esInteresante() = idiomas.size() > 1
	method esRecomendadaParaSocio(unSocio) = self.esInteresante() and unSocio.leAtraeActividad(self) and not unSocio.actividadesHechas().contains(self)
}

class Playa inherits Viajes {
	var largoDePlaya
	
	override method diasDeActividad() = largoDePlaya / 500
	override method implicaEsfuerzo(){
		return largoDePlaya > 1200
	} 
	override method sirveParaBroncear() = true
	
}

class Ciudad inherits Viajes {
	var property atraccionesAVisitar
	
	override method diasDeActividad() = atraccionesAVisitar / 2
	override method implicaEsfuerzo(){
		return atraccionesAVisitar.between(5, 8)
	}
	override method sirveParaBroncear() = false
	override method esInteresante() = super() or atraccionesAVisitar == 5
}

class CiudadTropical inherits Ciudad{
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncear() = true
	
}

class Trekking inherits Viajes {
	var senderos
	var diasDeSol
	
	override method diasDeActividad() = senderos / 50
	override method implicaEsfuerzo(){
		return senderos > 80
	}
	override method sirveParaBroncear(){
		return diasDeSol > 200 or (diasDeSol.between(100, 200) and senderos > 120)
	}
	override method esInteresante() = super() and diasDeSol > 140
}

class Gimnasia inherits Viajes {
	override method idiomas() = #{"español"}
	override method diasDeActividad() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncear() = false
	override method esRecomendadaParaSocio(unSocio) = unSocio.edad().between(20, 30)
}
















































