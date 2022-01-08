import Foundation

extension Collection where Element == Key {
    public var plainText: String {
        map { $0.asString }.joined()
    }
}

extension String {
    public var cypher: [Key] {
        compactMap { Key.fromString($0.lowercased()) }
    }
}

extension Key {
    var asString: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        case .c:
            return "c"
        case .d:
            return "d"
        case .e:
            return "e"
        case .f:
            return "f"
        case .g:
            return "g"
        case .h:
            return "h"
        case .i:
            return "i"
        case .j:
            return "j"
        case .k:
            return "k"
        case .l:
            return "l"
        case .m:
            return "m"
        case .n:
            return "n"
        case .o:
            return "o"
        case .p:
            return "p"
        case .q:
            return "q"
        case .r:
            return "r"
        case .s:
            return "s"
        case .t:
            return "t"
        case .u:
            return "u"
        case .v:
            return "v"
        case .w:
            return "w"
        case .x:
            return "x"
        case .y:
            return "y"
        case .z:
            return "z"
        }
    }
        
    static func fromString(_ string: String) -> Key? {
        switch string {
        case "a":
            return .a
        case "b":
            return .b
        case "c":
            return .c
        case "d":
            return .d
        case "e":
            return .e
        case "f":
            return .f
        case "g":
            return .g
        case "h":
            return .h
        case "i":
            return .i
        case "j":
            return .j
        case "k":
            return .k
        case "l":
            return .l
        case "m":
            return .m
        case "n":
            return .n
        case "o":
            return .o
        case "p":
            return .p
        case "q":
            return .q
        case "r":
            return .r
        case "s":
            return .s
        case "t":
            return .t
        case "u":
            return .u
        case "v":
            return .v
        case "w":
            return .w
        case "x":
            return .x
        case "y":
            return .y
        case "z":
            return .z
        default:
            return nil
        }
    }
}
