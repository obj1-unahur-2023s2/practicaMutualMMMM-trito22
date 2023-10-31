import viajes.*

class Socios {
	const property actividadesHechas = #{}
	const maximoActividades
	const property edad
	const property idiomas = #{}
	
	method esAdoradorDelSol() = actividadesHechas.all({a => a.sirveParaBroncear()}) 
	method actividadesEsforzadas() = actividadesHechas.filter({a => a.implicaEsfuerzo()})
	method realizarActividad(unaActividad){
		if(actividadesHechas.size() > maximoActividades){
			self.error("Te pasaste pa")
		}
		actividadesHechas.add(unaActividad)
	}
}

class SocioTranquilo inherits Socios{
	method leAtraeActividad(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socios{
	method leAtraeActividad(unaActividad) = (self.esAdoradorDelSol() and unaActividad.sirveParaBroncear()) or unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios{
	method leAtraeActividad(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}