
import Foundation

func getPathLen(Xa: Double, Ya: Double, Xb: Double, Yb: Double) -> Double {
    let straightPath = sqrt(Xa*Xa + Ya*Ya) + sqrt(Xb*Xb + Yb*Yb)
    let R = sqrt(Xa*Xa + Ya*Ya)

    if R == 0 {
        return straightPath
    }

    var Xc1 = 0.0, Yc1 = 0.0, Xc2 = 0.0, Yc2 = 0.0

    if Xb == 0 {
        Xc1 = 0
        Xc2 = 0
        Yc1 = R
        Yc2 = -R
    } else {
        let buf = sqrt( (Yb*Yb)/(Xb*Xb) + 1 )
        Xc1 = R / buf
        Xc2 = -R / buf
        Yc1 = Xc1 * Yb / Xb
        Yc2 = Xc2 * Yb / Xb
    }

    let C1toB = sqrt( (Xc1 - Xb)*(Xc1 - Xb) + (Yc1 - Yb)*(Yc1 - Yb) )
    let C2toB = sqrt( (Xc2 - Xb)*(Xc2 - Xb) + (Yc2 - Yb)*(Yc2 - Yb) )

    var Xgood = 0.0, Ygood = 0.0, CtoB = 0.0

    if C1toB < C2toB {
        Xgood = Xc1
        Ygood = Yc1
        CtoB = C1toB
    } else {
        Xgood = Xc2
        Ygood = Yc2
        CtoB = C2toB
    }

    let AtoC = sqrt( (Xgood - Xa)*(Xgood - Xa) + (Ygood - Ya)*(Ygood - Ya) )
    let angle = 2 * asin( AtoC / (2*R) )
    let l = angle * R

    let circlePath = l + CtoB

    return min(straightPath, circlePath)
}

let coordinatesStrs: [String]! = readLine()?.components(separatedBy: " ")
let coordinates: [Double]! = coordinatesStrs.map { Double($0)! }
let case1: Double! = getPathLen(Xa: coordinates[0], Ya: coordinates[1], Xb: coordinates[2], Yb: coordinates[3])
let case2: Double! = getPathLen(Xa: coordinates[2], Ya: coordinates[3], Xb: coordinates[0], Yb: coordinates[1])

print(min(case2, case1))
