
import Foundation

guard let input = try? String(contentsOfFile: "input.txt", encoding: .utf8) else {
    print("can't read file")
    exit(1)
}

let lines = input.components(separatedBy: "\n")

func isAnagram(_ s1: String, _ s2: String) -> Bool {
    return s1.lowercased().sorted() == s2.lowercased().sorted()
}

let result = isAnagram(lines[0], lines[1]) ? "YES" : "NO"

do {
    try result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
} catch {
    print("can't write file")
}
