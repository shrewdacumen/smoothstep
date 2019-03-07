#  smoothstep
A profiler of function smoothstep(e0, e1, x), written by Sungwook Kim

In order to figure out what smoothstep would do, I made this tiny program in Swift.

smoothstep performs smooth Hermite interpolation between 0 and 1 when edge0 < x < edge1. This is useful in cases where a threshold function with a smooth transition is desired. smoothstep is equivalent to:

// In GLSL,
genType t;  // Or genDType t;
t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
return t * t * (3.0 - 2.0 * t);
smoothstep returns 0.0 if x ≤ edge0 and 1.0 if x ≥ edge1.

Results are undefined if edge0 ≥ edge1.



In order to run the swift,  open terminal.app and then type the followings:
    chmod u+x ./smoothstep.swift
    ./smoothstep.swift

Then you'll see the result in the terminal as well.


// Please disregard all errors
// this is for Swift script which will execute in command line on macOS or Unix, Linux and the likes.
