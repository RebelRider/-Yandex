//import Foundation
//
//let fileManager = FileManager.default
//let inputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/input.txt")
//let outputURL = URL(fileURLWithPath: "/Users/ks/Documents/cmdYandex/output.txt")
//
//do {
//    let input = try String(contentsOf: inputURL, encoding: .utf8)
//    let lines = input.components(separatedBy: .newlines)
//    let nm = lines[0].split(separator: " ").map { Int($0)! }
//    let n = nm[0]
//    let m = nm[1]
//    var a = lines[1].split(separator: " ").map { Int($0)! }
//    var output = ""
//
//    for i in 2..<(2+m) {
//        let lr = lines[i].split(separator: " ").map { Int($0)! }
//        let l = lr[0]
//        let r = lr[1]
//        var minVal = a[l]
//        for j in l...r {
//            if a[j] < minVal {
//                minVal = a[j]
//            }
//        }
//        var found = false
//        for j in l...r {
//            if a[j] != minVal {
//                output += "\(a[j])\n"
//                found = true
//                break
//            }
//        }
//        if !found {
//            output += "NOT FOUND\n"
//        }
//    }
//
//    try output.write(to: outputURL, atomically: false, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var a = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<m {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }
    let l = lr[0]
    let r = lr[1]
    var minVal = a[l]
    for j in l...r {
        if a[j] < minVal {
            minVal = a[j]
        }
    }
    var found = false
    for j in l...r {
        if a[j] != minVal {
            print(a[j])
            found = true
            break
        }
    }
    if !found {
        print("NOT FOUND")
    }
}
