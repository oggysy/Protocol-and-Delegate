
// BootCampのセクション13のNo.147「An Example of Protocols and Delegates in Practice
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

emilio.medicalEmergency()




//「Swift実践入門」p289 13.2 デリゲートパターンでのサンプルコード

protocol GameDelegate: AnyObject {
    var numberOfPlayers: Int { get }
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

class TwoPersonsGameDelegate : GameDelegate {
    var numberOfPlayers: Int { return 2}
    func gameDidStart(_ game: Game) { print("Game start")}
    func gameDidEnd(_ game: Game) { print("Game end")}
}

class Game {
    weak var delegate: GameDelegate?
    
    func start() {
        print("Number of players is \(delegate?.numberOfPlayers ?? 1)")
        delegate?.gameDidStart(self)
        print("Playing")
        delegate?.gameDidEnd(self)
    }
}


let delegate = TwoPersonsGameDelegate()
let twoPersonsGame = Game()
twoPersonsGame.delegate = delegate
twoPersonsGame.start()
