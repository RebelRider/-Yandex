import Foundation

let fileName = "input.txt"

func readData() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    let firstRow = split[0].split(separator: " ")
    let secondRow = split[1].split(separator: " ")
    
    var allScreensArry = [ScreenInApp]()
    var totalErrors = 0
    
    let nums = firstRow[0].split(separator: " ")
    guard nums.count != 0, let appScreensCount = Int(firstRow[0]), let totalLogsRowsNumber = Int(firstRow[1]) else {return}
    print("appScreensCount \(appScreensCount)")
    print("totalLogsRowsNumber \(totalLogsRowsNumber)")
    
    for screenNo in 0 ..< appScreensCount {
        let tempScreen = ScreenInApp(name: String(secondRow[screenNo]), number: screenNo)
        allScreensArry.append(tempScreen)
    }
    print("allScreensArry \(allScreensArry)")
    
    var arrayOfLogs = [String]()
    for logRow in 3 ... totalLogsRowsNumber+2 {
        arrayOfLogs.append(line.components(separatedBy: .newlines)[logRow])
    }
    print("arrayOfLogs \(arrayOfLogs)")
    
    var currentScreenNumber = allScreensArry.first?.number
 
        for oneLogData in arrayOfLogs {
            let goingFrom = oneLogData.components(separatedBy: " ").first
            let goingTo = oneLogData.components(separatedBy: " ").last
            
            let goingFromNumber = allScreensArry.first(where: {$0.name == goingFrom})?.number
            let goingToNumber = allScreensArry.first(where: {$0.name == goingTo})?.number
            
            if goingFromNumber != currentScreenNumber {
                print("error \(goingFrom)")
                totalErrors += 1
            } else {
                currentScreenNumber = goingToNumber
            }
        }
    let result = String(totalErrors)
    print(result)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

struct ScreenInApp {
    var name: String
    var number = 1
}

readData()
