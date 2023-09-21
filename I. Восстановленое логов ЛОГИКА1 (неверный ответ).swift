import Foundation

let fileName = "input.txt"
func readData() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    let firstRow = split[0].split(separator: " ")
    let secondRow = split[1].split(separator: " ")
    let mainScreenName = split[2].components(separatedBy: .newlines).first
    print(mainScreenName)
    
    var totalCounterOfErrors = 0
    var allScreensArry = [ScreenInApp]()
    
    let nums = firstRow[0].split(separator: " ")
    guard nums.count != 0, let appScreensCount = Int(firstRow[0]), let totalLogsRowsNumber = Int(firstRow[1]) else {return}
    print("appScreensCount \(appScreensCount)")
    print("totalLogsRowsNumber \(totalLogsRowsNumber)")
    
    for screenNo in 0 ... appScreensCount-1 {
        let tempScreen = ScreenInApp(name: String(secondRow[screenNo]), number: screenNo)
        allScreensArry.append(tempScreen)
    }
    print("allScreensArry \(allScreensArry)")
    
    var arrayOfLogs = [String]()
    for logRow in 3 ... totalLogsRowsNumber+2 {
        arrayOfLogs.append(line.components(separatedBy: .newlines)[logRow])
    }
    print("arrayOfLogs \(arrayOfLogs)")
    
    
//    var allMovements = [String]()
    var lastFromTemp = mainScreenName
    for oneLogData in arrayOfLogs {
        let goingFrom = oneLogData.components(separatedBy: " ").first
        let goingTo = oneLogData.components(separatedBy: " ").last
//        allMovements.append(goingFrom ?? "")
//        allMovements.append(goingTo ?? "")
        
        
        if (
        (allScreensArry.first(where: {$0.name == goingTo}) )?.number != (allScreensArry.first(where: {$0.name == goingFrom}) )!.number+1
            &&
            (allScreensArry.first(where: {$0.name == goingTo}) )?.number != (allScreensArry.first(where: {$0.name == goingFrom}) )!.number-1
        ) || goingFrom != lastFromTemp
        {
            totalCounterOfErrors += 1
            print("error")
        }
        else
        { print("normal log") }
        lastFromTemp = goingTo ?? ""
    }
//    print("allMovements \(allMovements)")
    
    let result = String(totalCounterOfErrors)
    print(result)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

struct ScreenInApp {
    var name: String
    var number = 1
}

readData()
