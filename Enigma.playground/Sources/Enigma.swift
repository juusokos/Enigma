import Foundation

// Enigma G-312
public class Enigma {
    private let maxLetters = 26
    
    private var rotor1: RotorSetting
    private var rotor2: RotorSetting
    private var rotor3: RotorSetting
    private var ukw: RotorSetting
        
    private let enableDebugPrints: Bool
    
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
    
    public init(ukw: RotorSetting, rotor3: RotorSetting, rotor2: RotorSetting, rotor1: RotorSetting, enableDebugPrints: Bool = false) {
        self.ukw = ukw
        self.rotor3 = rotor3
        self.rotor2 = rotor2
        self.rotor1 = rotor1
        self.enableDebugPrints = enableDebugPrints
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
    
    private func cypher(key: Key) -> Key? {
        updateNotches()
                
        let rotor1Position = rotor1.rawValue - 1
        let rotor2Position = rotor2.rawValue - 1
        let rotor3Position = rotor3.rawValue - 1
        let ukwPosition = ukw.rawValue - 1
        
        if enableDebugPrints { print(ukwPosition, rotor3Position, rotor2Position, rotor1Position) }
        
        // Forwards
        guard let etw = ETW(rawValue: key.rawValue)?.asKey else { return nil }
        if enableDebugPrints { print("etw", etw) }
        
        let jumpETWRotor1 = rotor1Position
        guard let rotorI = RotorI(rawValue: positionFor(jump: jumpETWRotor1, lastValue: etw.rawValue))?.asKey else { return nil }
        if enableDebugPrints { print("rotorI", rotorI, "jumpETWRotor1", jumpETWRotor1) }
        
        let jumpRotor1Rotor2 = rotor2Position - rotor1Position
        guard let rotorII = RotorII(rawValue: positionFor(jump: jumpRotor1Rotor2, lastValue: rotorI.rawValue))?.asKey else { return nil }
        if enableDebugPrints { print("rotorII", rotorII, "jumpRotor1Rotor2", jumpRotor1Rotor2) }
        
        let jumpRotor2Rotor3 = rotor3Position - rotor2Position
        guard let rotorIII = RotorIII(rawValue: positionFor(jump: jumpRotor2Rotor3, lastValue: rotorII.rawValue))?.asKey else { return nil }
        if enableDebugPrints { print("rotorIII", rotorIII, "jumpRotor2Rotor3", jumpRotor2Rotor3) }
        
        let jumpRotor3UKW = ukwPosition - rotor3Position
        guard let ukw = UKW(rawValue: positionFor(jump: jumpRotor3UKW, lastValue: rotorIII.rawValue))?.asKey else { return nil }
        if enableDebugPrints { print("ukw", ukw, "jumpRotor3UKW", jumpRotor3UKW) }

        // Backwards
        let jumpUKWRotor3 = rotor3Position - ukwPosition
        guard let positionedKey = Key(rawValue: positionFor(jump: jumpUKWRotor3, lastValue: ukw.rawValue)),
              let invertedRotorIII = Key(rawValue: RotorIII.fromKey(positionedKey).rawValue) else { return nil }
        if enableDebugPrints { print("invertedRotorIII", invertedRotorIII, "jumpUKWRotor3", jumpUKWRotor3) }
        
        let jumpRotor3Rotor2 = rotor2Position - rotor3Position
        guard let positionedKey = Key(rawValue: positionFor(jump: jumpRotor3Rotor2, lastValue: invertedRotorIII.rawValue)),
              let invertedRotorII = Key(rawValue: RotorII.fromKey(positionedKey).rawValue) else { return nil }
        if enableDebugPrints { print("invertedRotorII", invertedRotorII, "jumpRotor3Rotor2", jumpRotor3Rotor2) }

        let jumpRotor2Rotor1 = rotor1Position - rotor2Position
        guard let positionedKey = Key(rawValue: positionFor(jump: jumpRotor2Rotor1, lastValue: invertedRotorII.rawValue)),
              let invertedRotorI = Key(rawValue: RotorI.fromKey(positionedKey).rawValue) else { return nil }
        if enableDebugPrints { print("invertedRotorI", invertedRotorI, "jumpRotor2Rotor1", jumpRotor2Rotor1) }
        
        let jumpRotor1ETW = -rotor1Position
        guard let positionedKey = Key(rawValue: positionFor(jump: jumpRotor1ETW, lastValue: invertedRotorI.rawValue)),
              let invertedETW = Key(rawValue: ETW.fromKey(positionedKey).rawValue) else { return nil }
        if enableDebugPrints { print("invertedETW", invertedETW, "jumpRotor1ETW", jumpRotor1ETW)}

        return invertedETW
    }
    
    private func positionFor(jump: Int, lastValue: Int) -> Int {
        let position = (jump + lastValue) % maxLetters
        return position > 0 ? position : maxLetters + position
    }
    
    private func updateNotches() {
        // Notches
        defer {
            if let rotor1 = increaseRotor(from: rotor1.rawValue) {
                self.rotor1 = rotor1
            }
        }
        guard let visible = Key(rawValue: rotor1.rawValue), rotor1Turnover.contains(visible) else { return }
        
        defer {
            if let rotor2 = increaseRotor(from: rotor2.rawValue) {
                self.rotor2 = rotor2
            }
        }
        guard let visible = Key(rawValue: rotor2.rawValue), rotor2Turnover.contains(visible) else { return }

        defer {
            if let rotor3 = increaseRotor(from: rotor3.rawValue) {
                self.rotor3 = rotor3
            }
        }
        guard let visible = Key(rawValue: rotor3.rawValue), rotor3Turnover.contains(visible) else { return }
        
        guard let ukw = increaseRotor(from: ukw.rawValue) else { return }
        self.ukw = ukw
    }
    
    private func increaseRotor(from currentValue: Int) -> RotorSetting? {
        if currentValue < maxLetters {
            return RotorSetting(rawValue: currentValue + 1)
        } else {
            return RotorSetting(rawValue: 1)
        }
    }
}
