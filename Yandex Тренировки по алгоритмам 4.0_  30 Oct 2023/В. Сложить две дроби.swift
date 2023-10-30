//import Foundation
//
//func gcd(_ a: Int, _ b: Int) -> Int {
//    let r = a % b
//    if r != 0 {
//        return gcd(b, r)
//    } else {
//        return b
//    }
//}
//
//let fileManager = FileManager.default
//let inputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/input.txt")
//let outputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/output.txt")
//
//do {
//    let input = try String(contentsOf: inputURL, encoding: .utf8)
//    let numbers = input.components(separatedBy: .newlines)[0].split(separator: " ").map { Int($0)! }
//    let a = numbers[0]
//    let b = numbers[1]
//    let c = numbers[2]
//    let d = numbers[3]
//
//    var m = a * d + b * c
//    var n = b * d
//
//    let g = gcd(m, n)
//    m /= g
//    n /= g
//
//    try "\(m) \(n)".write(to: outputURL, atomically: false, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}


import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r != 0 {
        return gcd(b, r)
    } else {
        return b
    }
}

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let a = numbers[0]
let b = numbers[1]
let c = numbers[2]
let d = numbers[3]

var m = a * d + b * c
var n = b * d

let g = gcd(m, n)
m /= g
n /= g

print("\(m) \(n)")
