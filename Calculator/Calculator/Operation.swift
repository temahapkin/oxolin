import Foundation

enum Button {
    enum Operation {
        case division
        case multiplication
        case subtraction
        case summarize
    }

    enum Number: Int {
        case zero
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
    }

    enum Other {
        case equals
        case drop
    }

    case operation(Operation)
    case numbers(Number)
    case other(Other)

    init?(_ rawValue: Int) {
        switch rawValue {
        case 0:
            self = .numbers(.zero)
        case 1:
            self = .numbers(.one)
        case 2:
            self = .numbers(.two)
        case 3:
            self = .numbers(.three)
        case 4:
            self = .numbers(.four)
        case 5:
            self = .numbers(.five)
        case 6:
            self = .numbers(.six)
        case 7:
            self = .numbers(.seven)
        case 8:
            self = .numbers(.eight)
        case 9:
            self = .numbers(.nine)
            
        case 10:
            self = .other(.drop)
        case 15:
            self = .other(.equals)

        case 11:
            self = .operation(.division)
        case 12:
            self = .operation(.multiplication)
        case 13:
            self = .operation(.subtraction)
        case 14:
            self = .operation(.summarize)
        default:
            return nil
        }
    }

    private static let mapping: [Int: Button] = [0: .numbers(.zero),
                                                 1: .numbers(.one),
                                                 2: .numbers(.two),
                                                 3: .numbers(.three),
                                                 4: .numbers(.four),
                                                 5: .numbers(.five),
                                                 6: .numbers(.six),
                                                 7: .numbers(.seven),
                                                 8: .numbers(.eight),
                                                 9: .numbers(.nine),
                                                 10: .other(.drop),
                                                 11: .operation(.division),
                                                 12: .operation(.multiplication),
                                                 13: .operation(.subtraction),
                                                 14: .operation(.summarize),
                                                 15: .other(.equals)]

    init?(rawValue: Int) {
        if let button = Self.mapping[rawValue] {
            self = button
        } else {
            return nil
        }
    }
}
