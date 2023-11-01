
import Foundation

if let a = readLine(), let b = readLine(), let n = readLine() {
    if let numA = Int(a), let numB = Int(b), let numN = Int(n) {
        if numA > Int(ceil(Double(numB) / Double(numN))) {
            print("Yes")
        } else {
            print("No")
        }
    }
}
