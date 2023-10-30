
import Foundation

func hypot(_ x: Double, _ y: Double) -> Double {
    return (x * x + y * y).squareRoot()
}

func atan2(_ y: Double, _ x: Double) -> Double {
    if x > 0 {
        return atan(y / x)
    } else if y >= 0 && x < 0 {
        return atan(y / x) + Double.pi
    } else if y < 0 && x < 0 {
        return atan(y / x) - Double.pi
    } else if y > 0 && x == 0 {
        return Double.pi / 2
    } else if y < 0 && x == 0 {
        return -Double.pi / 2
    }
    return 0
}

let numbers = readLine()!.split(separator: " ").map { Double($0)! }
let xA = numbers[0]
let yA = numbers[1]
let xB = numbers[2]
let yB = numbers[3]

let rA = hypot(xA, yA)
let rB = hypot(xB, yB)
let thetaA = atan2(yA, xA)
var thetaB = atan2(yB, xB)

if thetaB < thetaA {
    thetaB += 2 * Double.pi
}

let option1 = rA + rB
let option2 = abs(rA - rB) + min(rA, rB) * (thetaB - thetaA)

let result = min(option1, option2)

print(String(format: "%.6f", result))



//import Foundation
//
//func hypot(_ x: Double, _ y: Double) -> Double {
//    return (x * x + y * y).squareRoot()
//}
//
//func atan2(_ y: Double, _ x: Double) -> Double {
//    if x > 0 {
//        return atan(y / x)
//    } else if y >= 0 && x < 0 {
//        return atan(y / x) + Double.pi
//    } else if y < 0 && x < 0 {
//        return atan(y / x) - Double.pi
//    } else if y > 0 && x == 0 {
//        return Double.pi / 2
//    } else if y < 0 && x == 0 {
//        return -Double.pi / 2
//    }
//    return 0
//}
//
//let inputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/input.txt")
//let outputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/output.txt")
//
//do {
//    let input = try String(contentsOf: inputURL, encoding: .utf8)
//    let numbers = input.components(separatedBy: .newlines)[0].split(separator: " ").map { Double($0)! }
//    let xA = numbers[0]
//    let yA = numbers[1]
//    let xB = numbers[2]
//    let yB = numbers[3]
//
//    let rA = hypot(xA, yA)
//    let rB = hypot(xB, yB)
//    let thetaA = atan2(yA, xA)
//    var thetaB = atan2(yB, xB)
//
//    if thetaB < thetaA {
//        thetaB += 2 * Double.pi
//    }
//
//    let option1 = rA + rB
//    let option2 = abs(rA - rB) + min(rA, rB) * (thetaB - thetaA)
//
//    let result = min(option1, option2)
//
//    try String(format: "%.6f", result).write(to: outputURL, atomically: false, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}

