
import Foundation

if let input = readLine(), let t = Int(input) {
    var results: [String] = []
    for _ in 1...t {
        if let line = readLine() {
            let inputs = line.split(separator: " ").compactMap { Int(String($0)) }
            if inputs.count >= 3 {
                let (n, a, b) = (inputs[0], inputs[1], inputs[2])
                let result = n % a <= (b - a) * (n / a) ? "YES" : "NO"
                results.append(result)
            } else {
                print("Not enough data")
            }
        } else {
            print("Failed to read input line")
        }
    }
    let output = results.joined(separator: "\n")
    print(output)
} else {
    print("Invalid test case input")
}


//
//import Foundation
//
//if let input = try? String(contentsOfFile: "/Users/ks/Documents/cmdYandex/input.txt", encoding: .utf8) {
//    let lines = input.split(separator: "\n").map { String($0) }
//    if let t = Int(lines[0]) {
//        var results: [String] = []
//        for i in 1...t {
//            let inputs = lines[i].split(separator: " ").compactMap { Int($0) }
//            if inputs.count >= 3 {
//                let (n, a, b) = (inputs[0], inputs[1], inputs[2])
//                let result = n % a <= (b - a) * (n / a) ? "YES" : "NO"
//                results.append(result)
//            } else {
//                print("Not enought data")
//            }
//        }
//        let output = results.joined(separator: "\n")
//        do {
//            try output.write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//        } catch {
//            print("Error: \(error)")
//        }
//    } else {
//        print("Test cases wrong")
//    }
//} else {
//    print("Can't read file")
//}
