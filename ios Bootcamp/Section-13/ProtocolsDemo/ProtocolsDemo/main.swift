protocol canFly {
    func fly()
}


class Bird {
    
    var isFemale = true
    
    
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird shell")
        }
    }
    
}

class Eagle: Bird, canFly {
    func fly() {
        print("The eagle flips its wings and lift off into the sky")
    }
    
    func soar() {
        print("The eagle gildes in the air using currents")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water ")
    }
}

struct FlyingMuseum {
    
    func flyingDemo(flyingObject: canFly) {
        flyingObject.fly()
    }
}

struct Airplane: canFly {
    func fly() {
        print("The airplane use its enginee to lift off into the air")
    }
    
    
}

let myEagle = Eagle()
//myEagle.fly()
//myEagle.layEgg()
//myEagle.soar()

let myPenguin = Penguin()
//myPenguin.layEgg()
//myPenguin.swim()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)

let myPlane = Airplane()
//museum.flyingDemo(flyingObject: myPlane)

