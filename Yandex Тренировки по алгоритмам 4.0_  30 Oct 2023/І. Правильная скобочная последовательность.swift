//import Foundation
//
//func isBracketSequenceCorrect(_ sequence: String) -> Bool {
//    var stack = [Character]()
//
//    for bracket in sequence {
//        switch bracket {
//        case "(", "[", "{":
//            stack.append(bracket)
//        case ")":
//            if stack.popLast() != "(" {
//                return false
//            }
//        case "]":
//            if stack.popLast() != "[" {
//                return false
//            }
//        case "}":
//            if stack.popLast() != "{" {
//                return false
//            }
//        default:
//            break
//        }
//    }
//
//    return stack.isEmpty
//}
//
//guard let input = try? String(contentsOfFile: "/Users/ks/Documents/cmdYandex/input.txt", encoding: .utf8) else {
//    fatalError("Failed to read input file.")
//}
//
//let result = isBracketSequenceCorrect(input.trimmingCharacters(in: .whitespacesAndNewlines)) ? "yes" : "no"
//
//do {
//    try result.write(toFile: "/Users/ks/Documents/cmdYandex/output.txt", atomically: true, encoding: .utf8)
//} catch {
//    fatalError("Failed to write to output file.")
//}


import Foundation

func isBracketSequenceCorrect(_ sequence: String) -> Bool {
    var stack = [Character]()

    for bracket in sequence {
        switch bracket {
        case "(", "[", "{":
            stack.append(bracket)
        case ")":
            if stack.popLast() != "(" {
                return false
            }
        case "]":
            if stack.popLast() != "[" {
                return false
            }
        case "}":
            if stack.popLast() != "{" {
                return false
            }
        default:
            break
        }
    }

    return stack.isEmpty
}

if let input = readLine() {
    let result = isBracketSequenceCorrect(input.trimmingCharacters(in: .whitespacesAndNewlines)) ? "yes" : "no"
    print(result)
} else {
    fatalError("Failed to read from standard input.")
}
