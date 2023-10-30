
import Foundation

func largestSquare(matrix: [[Int]]) -> Int {
    var dp = matrix
    var maxSide = 0

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if i != 0 && j != 0 && matrix[i][j] != 0 {
                dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
            }
            maxSide = max(maxSide, dp[i][j])
        }
    }

    return maxSide
}

let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
let n = dimensions[0]
let m = dimensions[1]

var matrix = [[Int]]()
for _ in 1...n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append(row)
}

let result = largestSquare(matrix: matrix)

print(result)



//import Foundation
//
//func largestSquare(matrix: [[Int]]) -> Int {
//    var dp = matrix
//    var maxSide = 0
//
//    for i in 0..<matrix.count {
//        for j in 0..<matrix[0].count {
//            if i != 0 && j != 0 && matrix[i][j] != 0 {
//                dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
//            }
//            maxSide = max(maxSide, dp[i][j])
//        }
//    }
//    return maxSide
//}
//
//guard let input = try? String(contentsOfFile: "/Users/ks/Documents/cmdYandex/input.txt", encoding: .utf8) else {
//    fatalError("can't read file")
//}
//
//let lines = input.split(separator: "\n")
//let dimensions = lines[0].split(separator: " ").map { Int($0)! }
//let n = dimensions[0]
//let m = dimensions[1]
//
//var matrix = [[Int]]()
//for i in 1...n {
//    let row = lines[i].split(separator: " ").map { Int($0)! }
//    matrix.append(row)
//}
//let result = largestSquare(matrix: matrix)
//
//do {
//    try "\(result)".write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//} catch {
//    print("Error: \(error)")
//}
