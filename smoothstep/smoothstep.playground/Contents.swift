import Cocoa

print("smoothstep")


enum Math_Error:Error {
    case E_OVERFLOW
    case E_MINMAX_REVERSED
}

/*
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
*/


// Both functions originally created in generic form.
// The issue was a conversion from T into Double.
func clamp<T: FloatingPoint>(_ x:T,_ min: T,_ max: T) throws -> T {
    
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


func smoothstep<T: FloatingPoint>(_ edge0:T,_ edge1:T,_ x:T) throws -> T {
    
    guard edge0 != edge1 else {
        throw Math_Error.E_OVERFLOW
    }
    
    let t = try clamp((x-edge0)/(edge1-edge0), 0, 1)
    
    return t*t*(3 - 2*t) // -> conversion T into double was not specified!
    
}

for x in stride(from: 0.1, to: 0.9, by: 0.01) {
    
    do {
        _ = try smoothstep(0.1, 0.2, x)
        _ = try smoothstep(0.4, 0.5, x)
        _ = try smoothstep(0.8, 0.9, x)
        _ = try smoothstep(0.1, 0.9, x)
    } catch is Math_Error {
        print("A Mathematical Error")
    } catch {
        print("An unknown error!")
    }
}
