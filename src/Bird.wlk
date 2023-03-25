object Bird {
	
	var energy = 0
	var distanceAbleToFly = 0
	var myTrainner
	const joule4Grams = 4
	const basicEnergyToFlyJoules = 10
	
	
	method eat(grams, type,  dry,  sauce, cheese){
		if (type == "mijo"){
			if (dry)
				energy += 20
			else 
				energy += 15
				
			//return "comió mijo y su energía es: " + energy
		} else if (type == "canelon"){
			
			if (sauce && cheese)
				energy += 32
			else if (sauce && !cheese)
				energy += 25
			else 
				energy += 27
			
			//return "comió canelon y su energía es: " + energy
			
		} else {
			energy += grams * joule4Grams
			//return "comió alpiste y su energía es: " + energy
		}
	}
	
	method fly(kilometers){
		if (self.howMuchFly() > kilometers){
			energy -= kilometers + basicEnergyToFlyJoules
			//return "sí pudo volar"
		}
		//return "no pudo volar"	
	}
	
	method isWeak(){
		return energy < 50
	}
	
	method isHappy(){
		return energy > 500 && energy < 100
	}
	
	method howMuchFly(){
		if (energy > 0){
			distanceAbleToFly = energy/5
			
			if (energy>=300 && energy<=400)
				distanceAbleToFly += 10
			
			if (energy%20 == 0)
				distanceAbleToFly += 15
				
			return distanceAbleToFly
		}
		return 0
	}
	
	method goToEat(intQuantityEat, strgTypeFood, boolFoodDry, boogFoodSauce, boolFoodCheese){
		self.fly(5)
		self.eat(intQuantityEat, strgTypeFood, boolFoodDry, boogFoodSauce, boolFoodCheese)
		self.fly(5)
		
		return energy
	}

	method doWhatYouWant(){
		if (self.isWeak()){
			self.goToEat(20, "", false, false, false)
			return "comió y su energía es: " + energy
		} else if (self.isHappy()){
			self.fly(8)
			return "Voló y su energía es: " + energy
		} else {
			return "No está ni feliz ni infeliz. Su energía es " + energy 
		}
	}
	
	method getEnergy(){
		return energy
	}
	
	method setEnergy(_energy) {
		energy = _energy
	}
	
	method setMyTrainner(_myTrainner) {
		myTrainner = _myTrainner
	}
}



object Trainner {
	var bird
	
	method trainBird(_bird){
		bird = _bird
		bird.setMyTrainner(self)
		
		bird.setEnergy(20)
		bird.fly(10)
		bird.eat(20, "", false, false, false)
		bird.fly(5)
		return bird.doWhatYouWant()
		
	}
}