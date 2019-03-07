#!/usr/bin/swift
// This is for Swift script which will execute in command line on macOS or Unix, Linux and the likes.
//
//  main.swift script (this can be executable on any unix or macOS command line)
//  smoothstep
//
//  Created by sungwook on 3/7/19.
//  Copyright © 2019 Sungwook Kim. All rights reserved.
//

import Foundation
import Cocoa




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

func smoothstep(_ edge0:Double,_ edge1:Double,_ x:Double) throws -> Double {
    
    guard edge0 != edge1 else {
        throw Math_Error.E_OVERFLOW
    }
    
    let t = try clamp((x-edge0)/(edge1-edge0), 0.0, 1.0)
    
    return t*t*(3.0 - 2.0*t)
    
}

func dummy() {
//    return Void()
//    return
    return () // () -> Void
}

func demo(with option:String) -> Void? {

    for x in stride(from: 0.1, to: 0.9, by: 0.01) {
        
        do {
            // in playground version,
            // the following 4 lines will gives 4 graphs on Xcode editor window
            let value: Double
            switch option {
            case "12":
                value = try smoothstep(0.1, 0.2, x)
            case "45":
                value = try smoothstep(0.4, 0.5, x)
            case "89":
                value = try smoothstep(0.8, 0.9, x)
            case "19":
                value = try smoothstep(0.1, 0.9, x)
            default:
                return nil
            }
            print("value = \(value)")
      
        } catch is Math_Error {
            print("A Mathematical Error")
        } catch {
            print("An unknown error!")
        }
    }
    
    return ()
}


print("smoothstep")

/*
for x in stride(from: 0.1, to: 0.9, by: 0.01) {
    
    do {
        // in playground version,
        // the following 4 lines will gives 4 graphs on Xcode editor window
        let value12 = try smoothstep(0.1, 0.2, x)
        let value45 = try smoothstep(0.4, 0.5, x)
        let value89 = try smoothstep(0.8, 0.9, x)
        let value19 = try smoothstep(0.1, 0.9, x)
    } catch is Math_Error {
        print("A Mathematical Error")
    } catch {
        print("An unknown error!")
    }
}
*/

demo(with: "12")
demo(with: "45")
demo(with: "89")
demo(with: "19")
