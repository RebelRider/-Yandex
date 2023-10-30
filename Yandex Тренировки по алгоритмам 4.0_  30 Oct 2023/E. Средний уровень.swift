
import Foundation

let n = Int(readLine()!)!
let ratings = readLine()!.split(separator: " ").map { Int($0)! }

var prefixSum = [0]
for i in 0..<n {
    prefixSum.append(prefixSum[i] + ratings[i])
}

var result = [Int]()
for i in 0..<n {
    let leftDissatisfaction = i * ratings[i] - prefixSum[i]
    let rightDissatisfaction = prefixSum[n] - prefixSum[i+1] - (n - i - 1) * ratings[i]
    result.append(leftDissatisfaction + rightDissatisfaction)
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
//var prefixSum = [0]
//for i in 0..<n {
//    prefixSum.append(prefixSum[i] + ratings[i])
//}
//
//var result = [Int]()
//for i in 0..<n {
//    let leftDissatisfaction = i * ratings[i] - prefixSum[i]
//    let rightDissatisfaction = prefixSum[n] - prefixSum[i+1] - (n - i - 1) * ratings[i]
//    result.append(leftDissatisfaction + rightDissatisfaction)
//}
//
//do {
//    let output = result.map { String($0) }.joined(separator: " ")
//    try output.write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}
