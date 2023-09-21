import Foundation

let fileName = "input.txt"
func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    let firstRow = split[0].split(separator: " ")
    let secondRow = split[1].split(separator: " ")

    let appsCount = Int(firstRow.first!)!
    print(appsCount)
    var appsDrainNumbers = [Int]()
    for counter in 0 ... appsCount-1 {
        appsDrainNumbers.append(Int(secondRow[counter])!)
    }
    print(appsDrainNumbers)

    var maximumHours = 0

    var sumaryDrain = 0
    for number in appsDrainNumbers {
        sumaryDrain += number
    }
    print(sumaryDrain)

    maximumHours = 100 / sumaryDrain
    print(maximumHours)

    let result = String(maximumHours)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

readNums()
