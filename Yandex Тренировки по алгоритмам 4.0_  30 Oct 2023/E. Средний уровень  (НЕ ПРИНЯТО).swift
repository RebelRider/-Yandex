
import Foundation

let n = Int(readLine()!)!
let ratings = readLine()!.split(separator: " ").map { Int($0)! }

var result = [Int]()
for i in 0..<n {
    var dissatisfaction = 0
    for j in 0..<n {
        dissatisfaction += abs(ratings[i] - ratings[j])
    }
    result.append(dissatisfaction)
}

let output = result.map { String($0) }.joined(separator: " ")
print(output)



//import Foundation
//
//guard let input = try? String(contentsOfFile: "/Users/ks/Documents/cmdYandex/input.txt", encoding: .utf8) else {
//    fatalError("can't read file")
//}
//
//let lines = input.split(separator: "\n")
//let n = Int(lines[0])!
//let ratings = lines[1].split(separator: " ").map { Int($0)! }
//
//var result = [Int]()
//for i in 0..<n {
//    var dissatisfaction = 0
//    for j in 0..<n {
//        dissatisfaction += abs(ratings[i] - ratings[j])
//    }
//    result.append(dissatisfaction)
//}
//
//do {
//    let output = result.map { String($0) }.joined(separator: " ")
//    try output.write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}
