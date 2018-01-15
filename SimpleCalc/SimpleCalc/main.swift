//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let count = args.count
        var result = 0
        
        if count == 1 {
            result = 0
        } else if args[count - 1] == "count" {
            result = count - 1
        } else if args[count - 1] == "avg" {
            var total = 0
            var copy = args
            copy.remove(at: count - 1)
            for nums in copy {
                total += Int(nums)!
            }
            result = total / copy.count
        } else if args[count - 1] == "fact" {
            var total = 1
            for index in 1...Int(args[0])! {
                total = total * index
            }
            result = total
        } else if args[1] == "+" {
            result = Int(args[0])! + Int(args[2])!
        } else if args[1] == "-" {
            result = Int(args[0])! - Int(args[2])!
        } else if args[1] == "*" {
            result = Int(args[0])! * Int(args[2])!
        } else if args[1] == "/" {
            result = Int(args[0])! / Int(args[2])!
        } else if args[1] == "%" {
            result = Int(args[0])! % Int(args[2])!
        }

        return result;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

