import Foundation

let fileName = "input.txt"
func calculate() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")
    
    let firstRow = split[0].split(separator: " ")
    let nums = firstRow[0].split(separator: " ")
    guard nums.count != 0, let rows = Int(firstRow[0]), let columns = Int(firstRow[1]) else {return}
    //    print(rows)
    //    print(columns)
    var enemies = [Enemy]()
    var pointsOfBombing = [PointOfBombing]()
    var walls = [Wall]()
    
    var rowsArr = [String]()
    for i in 1...rows {
        let row = line.components(separatedBy: .newlines)[i]
        rowsArr.append(row)
    }
    
    for y in 0...rowsArr.count-1 {
        for (x, char) in rowsArr[y].enumerated() {
            //            print("\(Array(rowsArr[y])[x]) | x: \(x) | y: \(y)")
            if char == "B" {
                let enemy = Enemy(x: x, y: y)
                enemies.append(enemy)
            }
            else if char == "." {
                let pointOfBombing = PointOfBombing(x: x, y: y)
                pointsOfBombing.append(pointOfBombing)
            }
            else {
                let wall = Wall(x: x, y: y)
                walls.append(wall)
            }
        }
    }
    //    print(enemies)
    //    print("__WHERE?__")
    //    print(pointsOfBombing)
    if enemies.isEmpty {
        print("no enemies. just place it in x:0 y:0..")
    } else {
        for (index, point) in pointsOfBombing.enumerated() {
            print(point) // all targets
            
            //print("right")
            for xPosition in point.x ... columns-1 {
                if enemies.contains(where: {$0.x == xPosition && $0.y == point.y} ) {
//                    print("kill! \(point.x) \(point.y)")
                    pointsOfBombing[index].kill()
                }
                else if walls.contains(where: {$0.x == xPosition && $0.y == point.y} ) {
                    print("stop..")
                    break
                }
            }
            
            //print("left")
            for xPosition in stride(from: point.x, to: -1, by: -1) { //solution "Fatal error: Range requires lowerBound <= upperBound"
                if enemies.contains(where: {$0.x == xPosition && $0.y == point.y} ) {
//                    print("kill! \(point.x) \(point.y)")
                    pointsOfBombing[index].kill()
                }
                else if walls.contains(where: {$0.x == xPosition && $0.y == point.y} ) {
                    print("stop..")
                    break
                }
            }
            
            //print("up")
            for yPosition in stride(from: point.y, to: -1, by: -1) {
                if enemies.contains(where: {$0.y == yPosition && $0.x == point.x} ) {
//                    print("kill! \(point.x) \(point.y)")
                    pointsOfBombing[index].kill()
                }
                else if walls.contains(where: {$0.y == yPosition && $0.x == point.x} ) {
                    print("stop..")
                    break
                }
            }
            
            //print("down")
            for yPosition in point.y ... rows-1 {
                if enemies.contains(where: {$0.y == yPosition && $0.x == point.x} ) {
//                    print("kill! \(point.x) \(point.y)")
                    pointsOfBombing[index].kill()
                }
                else if walls.contains(where: {$0.y == yPosition && $0.x == point.x} ) {
                    print("stop..")
                    break
                }
            }
            

        }// end looping for pointsOfBombing

    }//end else, enemies = [Enemy]() is not empty
    
    let bestPoint = pointsOfBombing.sorted(by: {$0.killCount > $1.killCount}).first
    let bestPointCoordsString = String(String((bestPoint?.y ?? 0)+1) + " " + String((bestPoint?.x ?? 0)+1)) // +1 convert to "human-readable" coors
    print("BEST POINT \(bestPointCoordsString)")
    try? bestPointCoordsString.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}
calculate()

struct Enemy {
var x: Int
var y: Int
}

struct PointOfBombing {
var x: Int
var y: Int
var killCount = 0
    
    mutating func kill(){
        self.killCount += 1
    }
}

struct Wall {
var x: Int
var y: Int
}
