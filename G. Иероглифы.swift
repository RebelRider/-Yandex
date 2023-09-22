import Foundation

let fileName = "input.txt"
func calculate() {
    var totalPaintArea = 0.0
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    let firstRow = split[0].split(separator: " ")
    guard firstRow.count != 0, let ierglphCount = Int(firstRow[0]) else {return}
    let typedString = line.components(separatedBy: .newlines)[1]
    let thirdRow = line.components(separatedBy: .newlines)[2]; let secondsArr = thirdRow.components(separatedBy: " ") [0...ierglphCount-1]
    
    var arrayOfSymbols = [Ierglph]()
    var previosTime = 0
    for (index,ieglpph) in typedString.enumerated() {
        let searchTime = (Int(secondsArr[index]) ?? 1) - previosTime // ?? 1 - let's take 1 ms as default;)
        let ieglph = Ierglph(char: ieglpph, time: searchTime)
        previosTime += searchTime
        arrayOfSymbols.append(ieglph)
    }
    
    let longestSearchAllData = arrayOfSymbols.sorted(by: {$0.time < $1.time})
    print(longestSearchAllData)
    
    let longestSearchChar = longestSearchAllData.last?.char.lowercased() ?? "error in calculations" //.lowercased to convert Character to String
    print(longestSearchChar)
try? longestSearchChar.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}
calculate()

struct Ierglph {
    var char: Character
    var time = 0
    mutating func setMaxTime(time: Int){
        self.time = time
    }
}
