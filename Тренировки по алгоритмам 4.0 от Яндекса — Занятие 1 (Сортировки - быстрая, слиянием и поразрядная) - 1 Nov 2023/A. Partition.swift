
import Foundation

let n = Int(readLine()!)!

if n == 0 {
    print("0\n0")
} else {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let pivot = Int(readLine()!)!

    var lessThanPivot = [Int]()
    var greaterThanOrEqualToPivot = [Int]()

    for number in numbers {
        if number < pivot {
            lessThanPivot.append(number)
        } else {
            greaterThanOrEqualToPivot.append(number)
        }
    }

    print("\(lessThanPivot.count)\n\(greaterThanOrEqualToPivot.count)")
}


//import Foundation
//
//guard let input = try? String(contentsOfFile: "input.txt", encoding: .utf8) else {
//    print("can't read file")
//    exit(1)
//}
//
//let lines = input.split(separator: "\n")
//let n = Int(lines[0])!
//
//if n == 0 {
//    let result = "0\n0"
//    do {
//        try result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
//    } catch {
//        print("can't write file")
//    }
//} else {
//    let numbers = lines[1].split(separator: " ").map { Int($0)! }
//    let pivot = Int(lines[2])!
//
//    var lessThanPivot = [Int]()
//    var greaterThanOrEqualToPivot = [Int]()
//
//    for number in numbers {
//        if number < pivot {
//            lessThanPivot.append(number)
//        } else {
//            greaterThanOrEqualToPivot.append(number)
//        }
//    }
//
//    let result = "\(lessThanPivot.count)\n\(greaterThanOrEqualToPivot.count)"
//
//    do {
//        try result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
//    } catch {
//        print("can't write file")
//    }
//}
