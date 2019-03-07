//
//  main.swift
//  smoothstep
//
//  Created by sungwook on 3/7/19.
//  Copyright © 2019 Sungwook Kim. All rights reserved.
//

import Foundation

print("smoothstep")


enum Math_Error:Error {
    case E_OVERFLOW
    case E_MINMAX_REVERSED
}

func clamp(_ x:Double,_ min: Double,_ max: Double) throws -> Double {
    
    guard max > min else {
        throw Math_Error.E_MINMAX_REVERSED
    }
    if x < min {
        return min
    } else if x > max {
        return max
    }
    
    return x
}

func smoothStep(_ edge0:Double,_ edge1:Double,_ x:Double) throws -> Double {
    
    guard edge0 != edge1 else {
        throw Math_Error.E_OVERFLOW
    }
    
    let t = try clamp((x-edge0)/(edge1-edge0), 0.0, 1.0)
    
    return t*t*(3.0 - 2.0*t)
    
}

for x in stride(from: 0.1, to: 0.9, by: 0.01) {
    
    do {
        let value12 = try smoothStep(0.1, 0.2, x)
        let value45 = try smoothStep(0.4, 0.5, x)
        let value89 = try smoothStep(0.8, 0.9, x)
        let value19 = try smoothStep(0.1, 0.9, x)
    } catch is Math_Error {
        print("A Mathematical Error")
    } catch {
        print("An unknown error!")
    }
}

