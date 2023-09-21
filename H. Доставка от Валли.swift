import Foundation

let fileName = "input.txt"
func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let path = Array(line.dropLast(1)) // dropLast for "\n" removal
    var onUpperSide = true
    var totalCrossCount = 0
    var upsideBad = false
    var downsideBad = false

    for (index, char) in path.enumerated() {
        print("index \(index)  |  char \(char)")
        if index < path.count-2 {
            if path[index+1] == "2" || path[index+1] == "3" {
                 upsideBad = true
            }
            else {
                downsideBad = false
            }
            if path[index+1] == "1" || path[index+1] == "3" {
                 downsideBad = true
            } else {
                downsideBad = false
            }
        }

        if true {
            switch char {
            case "1":
                if onUpperSide && upsideBad {
                    onUpperSide.toggle()
                    totalCrossCount += 1
                }
            case "2":
                if !onUpperSide && downsideBad {
                    onUpperSide.toggle()
                    totalCrossCount += 1
                }
            default:
                totalCrossCount += 1
            }

        }
    }
    if onUpperSide {totalCrossCount += 1}

    print(totalCrossCount)
    let result = String(totalCrossCount)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

//readNums()
