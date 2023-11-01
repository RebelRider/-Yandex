
import Foundation

func mergeArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var i = 0
    var j = 0

    while i < array1.count && j < array2.count {
        if array1[i] < array2[j] {
            mergedArray.append(array1[i])
            i += 1
        } else {
            mergedArray.append(array2[j])
            j += 1
        }
    }

    while i < array1.count {
        mergedArray.append(array1[i])
        i += 1
    }

    while j < array2.count {
        mergedArray.append(array2[j])
        j += 1
    }

    return mergedArray
}

guard let input = try? String(contentsOfFile: "input.txt", encoding: .utf8) else {
    print("can't read file")
    exit(1)
}

let lines = input.split(separator: "\n")
let n = Int(lines[0])!
let m = Int(lines[2])!

if n == 0 && m == 0 {
    let result = "0"
    do {
        try result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
    } catch {
        print("can't write file")
    }
} else {
    let array1 = n > 0 ? lines[1].split(separator: " ").map { Int($0)! } : []
    let array2 = m > 0 ? lines[3].split(separator: " ").map { Int($0)! } : []

    let mergedArray = mergeArrays(array1, array2)
    let result = mergedArray.map { String($0) }.joined(separator: " ")

    do {
        try result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
    } catch {
        print("can't write file")
    }
}


