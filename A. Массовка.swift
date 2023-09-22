import Foundation

let fileName = "input.txt"
func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return}
    
    let firstLine = line.split(separator: "\n")
    guard firstLine.count != 0 else {
        return}
    
    let nums = firstLine[0].split(separator: " ")
    guard nums.count != 0, let maxDays = Int(nums[0]), let totalScenes = Int(nums[1]) else {
    return}
    
    var scenesArr = [[Int]]()
    
    var totalPayments = 0
    var todayPlayedMax = 0
    
    var tempArr = [Int]()
    for rowNo in 1 ... totalScenes {
        let row = line.components(separatedBy: .newlines)[rowNo]
        
        for digitPosition in 0 ... 2 {
            tempArr.append(Int(row.components(separatedBy: .whitespaces)[digitPosition])!)
        }
        scenesArr.append(tempArr)
        tempArr = []
    }
    
    for today in 1 ... maxDays {
        todayPlayedMax = 0
        for sceneX in scenesArr {
            if sceneX[0] <= today && today <= sceneX[1] {
                if todayPlayedMax < sceneX[2] {
                    todayPlayedMax = sceneX[2]
                }
            }
        }
        totalPayments += todayPlayedMax
    }
    
    let result = String(totalPayments)
    print(result)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

readNums()
