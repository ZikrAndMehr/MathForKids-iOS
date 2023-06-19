//
//  Question.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 19/06/2023.
//

import Foundation

struct Question {
    private let operation: String
    private let min: Int
    private let max: Int
    private var a = 0
    private var b = 0
    private var c = 0
    private var random = Array(repeating: 0, count: 4)
    
    init(_ operation: String, _ min: Int, _ max: Int) {
        self.operation = operation
        self.min = min
        self.max = max
        
        a = getRandomNumber(check: false)
        
        setupQuestion()
        
        for i in random.indices {
            random[i] = getRandomNumber(check: true)
        }
    }
    
    private func getRandomNumber(check: Bool) -> Int {
        if check {
            var x = 1
            var r = Int.random(in: (c + (c / 2) - c / 2)...(c + (c / 2)))
            
            while x != 0 {
                if r == c {
                    r = Int.random(in: (c + (c / 2) - c / 2)...(c + (c / 2)))
                }
                else {
                    x = 0
                }
            }
            
            return r
        } else {
            return Int.random(in: min...max)
        }
    }
    
    private mutating func setupQuestion() {
        switch operation {
        case AppConstants.addition:
            b = getRandomNumber(check: false)
            c = a + b
        case AppConstants.subtraction:
            b = getRandomNumber(max: a - 1)
            c = a - b
        case AppConstants.multiplication:
            b = getRandomNumber(max: min / 5)
            c = a * b;
        case AppConstants.division:
            b = getRandomNumber(max: a)
            while a % b != 0 {
                b = getRandomNumber(max: a)
            }
            c = a / b
        default: break
        }
    }
    
    private func getRandomNumber(max: Int) -> Int {
        Int.random(in: 1...max)
    }
    
    func getQuestion() -> String {
        return "\(a)\(operation)\(b)\(AppConstants.equal)\(c)"
    }
    
    func getA() -> String {
        return String(a)
    }
    
    func getB() -> String {
        return String(b)
    }
    
    func getC() -> Int {
        return c
    }
    
    func getRandom() -> [Int] {
        return random
    }
}
