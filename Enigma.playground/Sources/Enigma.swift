import Foundation

// Enigma G-312
public class Enigma {
    private let maxLetters = 26
    
    private var rotor1: RotorSetting
    private var rotor2: RotorSetting
    private var rotor3: RotorSetting
    private var ukw: RotorSetting
        
    
    private let rotor1Turnover: [Key] = [.s, .u, .v, .w, .z,
                                            .a, .b, .c, .e, .f,
                                            .g, .i, .k, .l, .o,
                                            .p, .q]
    private let rotor2Turnover: [Key] = [.s, .t, .v, .y, .z,
                                            .a, .c, .d, .f, .g,
                                            .h, .k, .m, .n, .q]
    private let rotor3Turnover: [Key] = [.u, .w, .x, .a, .e,
                                            .f, .h, .k, .m, .n,
                                            .r, ]
    
    public init(ukw: RotorSetting, rotor3: RotorSetting, rotor2: RotorSetting, rotor1: RotorSetting) {
        self.ukw = ukw
        self.rotor3 = rotor3
        self.rotor2 = rotor2
        self.rotor1 = rotor1
    }
    
    public func encrypt(input: [Key]) -> [Key] {
        return input.compactMap { key in
            cypher(key: key)
        }
    }
    
    public func decrypt(input: [Key]) -> [Key] {
        return input.compactMap { key in
            cypher(key: key)
        }
    }
    
    func cypher(key: Key) -> Key? {
        updateNotches()
                
        let rotor1Position = rotor1.rawValue - 1
        let rotor2Position = rotor2.rawValue - 1
        let rotor3Position = rotor3.rawValue - 1
        let ukwPosition = ukw.rawValue - 1
        
        print(ukwPosition, rotor3Position, rotor2Position, rotor1Position)
        
        // Forwards
        guard let etw = ETW(rawValue: key.rawValue)?.asKey else { return nil }
        print("etw", etw)
        
        let jump1 = rotor1Position
        let positionCalculation1 = (jump1 + etw.rawValue) % maxLetters
        let adjustedPosition1 = positionCalculation1 > 0 ? positionCalculation1 : maxLetters + positionCalculation1
        guard let rotorI = RotorI(rawValue: adjustedPosition1)?.asKey else { return nil }
        print("rotorI", rotorI, "jump1", jump1)
        
        let jump2 = rotor2Position - rotor1Position
        let positionCalculation2 = (jump2 + rotorI.rawValue) % maxLetters
        let adjustedPosition2 = positionCalculation2 > 0 ? positionCalculation2 : maxLetters + positionCalculation2
        guard let rotorII = RotorII(rawValue: adjustedPosition2)?.asKey else { return nil }
        print("rotorII", rotorII, "jump2", jump2)
        
        let jump3 = rotor3Position - rotor2Position
        let positionCalculation3 = (jump3 + rotorII.rawValue) % maxLetters
        let adjustedPosition3 = positionCalculation3 > 0 ? positionCalculation3 : maxLetters + positionCalculation3
        guard let rotorIII = RotorIII(rawValue: adjustedPosition3)?.asKey else { return nil }
        print("rotorIII", rotorIII, "jump3", jump3)
        
        let jump4 = ukwPosition - rotor3Position
        let positionCalculation4 = (jump4 + rotorIII.rawValue) % maxLetters
        let adjustedPosition4 = positionCalculation4 > 0 ? positionCalculation4 : maxLetters + positionCalculation4
        guard let ukw = UKW(rawValue: adjustedPosition4)?.asKey else { return nil }
        print("ukw", ukw, "jump4", jump4)

        // Backwards
        let jump5 = rotor3Position - ukwPosition
        let positionCalculation5 = (ukw.rawValue + jump5) % maxLetters
        let adjustedPosition5 = positionCalculation5 > 0 ? positionCalculation5 : maxLetters + positionCalculation5
        guard let positionedKey = Key(rawValue: adjustedPosition5) else { return nil }
        guard let invertedRotorIII = Key(rawValue: RotorIII.fromKey(positionedKey).rawValue) else { return nil }
        print("invertedRotorIII", invertedRotorIII, "jump5", jump5)
        
        let jump6 = rotor2Position - rotor3Position
        let positionCalculation6 = (invertedRotorIII.rawValue + jump6) % maxLetters
        let adjustedPosition6 = positionCalculation6 > 0 ? positionCalculation6 : maxLetters + positionCalculation6
        guard let positionedKey = Key(rawValue: adjustedPosition6) else { return nil }
        guard let invertedRotorII = Key(rawValue: RotorII.fromKey(positionedKey).rawValue) else { return nil }
        print("invertedRotorII", invertedRotorII, "jump6", jump6)

        let jump7 = rotor1Position - rotor2Position
        let positionCalculation7 = (invertedRotorII.rawValue + jump7) % maxLetters
        let adjustedPosition7 = positionCalculation7 > 0 ? positionCalculation7 : maxLetters + positionCalculation7
        guard let positionedKey = Key(rawValue: adjustedPosition7) else { return nil }
        guard let invertedRotorI = Key(rawValue: RotorI.fromKey(positionedKey).rawValue) else { return nil }
        print("invertedRotorI", invertedRotorI, "jump7", jump7)
        
        let jump8 = -rotor1Position
        let positionCalculation8 = (invertedRotorI.rawValue + jump8) % maxLetters
        let adjustedPosition8 = positionCalculation8 > 0 ? positionCalculation8 : maxLetters + positionCalculation8
        guard let positionedKey = Key(rawValue: adjustedPosition8) else { return nil }
        guard let invertedETW = Key(rawValue: ETW.fromKey(positionedKey).rawValue) else { return nil }
        print("invertedETW", invertedETW, "jump8", jump8)

        return invertedETW
    }
    
    func updateNotches() {
        // Notches
        if let visible = Key(rawValue: rotor1.rawValue), rotor1Turnover.contains(visible) {
            if let visible = Key(rawValue: rotor2.rawValue), rotor2Turnover.contains(visible) {
                if let visible = Key(rawValue: rotor3.rawValue), rotor3Turnover.contains(visible) {
                    if ukw.rawValue < maxLetters {
                        if let ukw = RotorSetting(rawValue: ukw.rawValue + 1) {
                            self.ukw = ukw
                        }
                    } else {
                        if let ukw = RotorSetting(rawValue: 1) {
                            self.ukw = ukw
                        }
                    }
                }
                
                if rotor3.rawValue < maxLetters {
                    if let rotor3 = RotorSetting(rawValue: rotor3.rawValue + 1) {
                        self.rotor3 = rotor3
                    }
                } else {
                    if let rotor3 = RotorSetting(rawValue: 1) {
                        self.rotor3 = rotor3
                    }
                }
            }
            
            if rotor2.rawValue < maxLetters {
                if let rotor2 = RotorSetting(rawValue: rotor2.rawValue + 1) {
                    self.rotor2 = rotor2
                }
            } else {
                if let rotor2 = RotorSetting(rawValue: 1) {
                    self.rotor2 = rotor2
                }
            }
        }
        
        if rotor1.rawValue < maxLetters {
            if let rotor1 = RotorSetting(rawValue: rotor1.rawValue + 1) {
                self.rotor1 = rotor1
            }
        } else {
            if let rotor1 = RotorSetting(rawValue: 1) {
                self.rotor1 = rotor1
            }
        }
    }
}
