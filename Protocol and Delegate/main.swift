
protocol AdvancedLifeSupport {
    func perfomCPR()
}


class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func medicalEmergency() {
        delegate?.perfomCPR()
    }
}


class Pramedic: AdvancedLifeSupport {
    
    init(handeler: EmergencyCallHandler) {
        handeler.delegate = self
    }
    
    func perfomCPR() {
        print("30 per second ...")
    }
}


let emilio = EmergencyCallHandler()
let pete = Pramedic(handeler: emilio)

print(emilio.medicalEmergency())


