import Foundation

let fileName = "input.txt"
func calculate() {
    var totalPaintArea = 0.0
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    let firstRow = split[0].split(separator: " ")
    guard firstRow.count != 0, let rowsCount = Int(firstRow[0]), let columnsCount = Int(firstRow[1]) else {return}
    
    var rowsArray = [String]()
    for row in 1...rowsCount {
        let rowString = line.components(separatedBy: .newlines)[row]
        rowsArray.append(rowString)
    }
    print(rowsArray)
    
    var insideFigure = false
    
    for row in rowsArray {
        for character in row {
            if character != "." {
                totalPaintArea += 0.5
                insideFigure.toggle()
                print("slash")
            }
            else {
                if insideFigure{
                    totalPaintArea += 1
                    print("dot inside")
                }
            }
        }
    }
    
        print(totalPaintArea)
        let result = String(Int(totalPaintArea))
        try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}
calculate()
