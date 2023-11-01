
import Foundation

func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low
    for j in low..<high {
        if array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
    }
    array.swapAt(i, high)
    return i
}

func quicksort(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pi = partition(&array, low: low, high: high)
        quicksort(&array, low: low, high: pi - 1)
        quicksort(&array, low: pi + 1, high: high)
    }
}
//
let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

quicksort(&numbers, low: 0, high: numbers.count - 1)

let result = numbers.map { String($0) }.joined(separator: " ")

print(result)


//import Foundation
//
//func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
//    let pivot = array[high]
//    var i = low
//    for j in low..<high {
//        if array[j] <= pivot {
//            array.swapAt(i, j)
//            i += 1
//        }
//    }
//    array.swapAt(i, high)
//    return i
//}
//
//func quicksort(_ array: inout [Int], low: Int, high: Int) {
//    if low < high {
//        let pi = partition(&array, low: low, high: high)
//        quicksort(&array, low: low, high: pi - 1)
//        quicksort(&array, low: pi + 1, high: high)
//    }
//}
//
//guard let input = try? String(contentsOfFile: "/Users/ks/Documents/cmdYandex/input.txt", encoding: .utf8) else {
//    print("can't read file")
//    exit(1)
//}
//
//let lines = input.split(separator: "\n")
//var numbers = lines[1].split(separator: " ").map { Int($0)! }
//
//quicksort(&numbers, low: 0, high: numbers.count - 1)
//
//let result = numbers.map { String($0) }.joined(separator: " ")
//
//do {
//    try result.write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//} catch {
//    print("can't write file")
//}
