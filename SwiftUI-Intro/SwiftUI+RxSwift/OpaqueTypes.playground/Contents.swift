import UIKit

// Comparing
func getRandomInt() -> some Equatable {
    return Int.random(in: 1...20)
}

func getRandomBool() -> some Equatable {
    return Bool.random()
}

getRandomInt() == getRandomInt()

// Associated type with opaque type

protocol MobileOS {
    associatedtype Version
    var version: Version { get }
    init(version: Version)
}

struct iOS: MobileOS {
    var version: Float
}
struct Android: MobileOS {
    var version: String
}

func buildPreferredOS() -> some MobileOS {
    return iOS(version: 13.1)
}
