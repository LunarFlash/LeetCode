/**
 [FizzBuzz](https://learnappmaking.com/fizzbuzz-swift/)
 */
import UIKit

/**
 Write a program that prints the numbers from 1 to 100
 For numbers divisible by 3, print “Fizz”
 For numbers divisible by 5, print “Buzz”
 For numbers divisible by both 3 and 5, print “FizzBuzz”
 */
func fizzBuzz2() {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0{
            print("FizzBuzz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else{
            print(i)
        }
    }
}

func fizzBuzz3() {
    for i in 1...100
    {
        switch (i % 3 == 0, i % 5 == 0)
        {
        case (true, false):
            print("Fizz")
        case (false, true):
            print("Buzz")
        case (true, true):
            print("FizzBuzz")
        default:
            print(i)
        }
    }
}

let fizzBuzz: (Int) -> String = { i in
    switch (i % 3 == 0, i % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    default:
        return "\(i)"
    }
}

fizzBuzz3()
Array(1...100).map(fizzBuzz).joined(separator: ",")
