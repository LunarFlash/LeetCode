import UIKit

class Solution {

    /// Process 3 numbers at a time
    func process3(_ num: Int) -> String {
        var str = ""
        var singleDigit = num % 10
        var doubleDigit = num / 10 % 10
        var tripleDigit = num / 100

        if num / 100 > 0 {
            switch tripleDigit {
                case 0:
                  ()
                case 1:
                  str += "One Hundred"
                case 2:
                  str += "Two Hundred"
                case 3:
                  str += "Three Hundred"
                case 4:
                    str += "Four Hundred"
                case 5:
                    str += "Five Hundred"
                case 6:
                    str += "Six Hundred"
                case 7:
                    str += "Seven Hundred"
                case 8:
                    str += "Eight Hundred"
                case 9:
                    str += "Nine Hundred"
                default:
                  ()
            }
        }

        if num / 10 > 0 {
            if num / 100 >= 1, doubleDigit != 0 { // needs a space
                str += " "
            }

            switch doubleDigit {
                case 0:
                    ()
                case 1:
                    if tripleDigit == 0 && num / 1 >= 100 {
                        str += "And"
                    }
                    switch singleDigit {
                        case 0:
                            str += "Ten"
                        case 1:
                            str += "Eleven"
                        case 2:
                            str += "Twelve"
                        case 3:
                            str += "Thirteen"
                        case 4:
                            str += "Fourteen"
                        case 5:
                            str += "Fifteen"
                        case 6:
                            str += "Sixteen"
                        case 7:
                            str += "Seventeen"
                        case 8:
                            str += "Eighteen"
                        case 9:
                            str += "Nineteen"
                        default:
                            ()
                    }
                    return str // no longer need to process single digit
                case 2:
                    str += "Twenty"
                case 3:
                    str += "Thirty"
                case 4:
                    str += "Forty"
                case 5:
                    str += "Fifty"
                case 6:
                    str += "Sixty"
                case 7:
                    str += "Seventy"
                case 8:
                    str += "Eighty"
                case 9:
                    str += "Ninety"
                default:
                ()
            }
        }

        if num > 0 {
            // should we add space?
            if num / 10 >= 1, singleDigit != 0 {
                str += " "
            }

            switch singleDigit {
                case 0:
                   ()
                case 1:
                    str += "One"
                case 2:
                    str += "Two"
                case 3:
                   str += "Three"
                case 4:
                    str += "Four"
                case 5:
                    str += "Five"
                case 6:
                    str += "Six"
                case 7:
                    str += "Seven"
                case 8:
                    str += "Eight"
                case 9:
                    str += "Nine"
                default:
                ()
            }
        }

        return str
    }


    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        var num = num
        var translation = ""

        let units = ["", "Thousand", "Million", "Billion", "Trillion"]
        var unit = 0 // counter to track the thousandth unit

        while num > 0 { // pop 3 digits at a time

            let popThreeDigits = num % 1000
            var current3DigitsTranslation = process3(popThreeDigits)

            // Whether to append a unit word (thousand, million ...)
            //let thousandUnit = num / 1000 // logic wrong
            if popThreeDigits != 0, unit > 0 {
                current3DigitsTranslation += " \(units[unit])"
            }
            unit += 1

            // Whether to append a space between the current 3 digit and processed digits?
            if translation != "", translation.prefix(1) != " " {
                current3DigitsTranslation += " "
            }

            // perform the appendage
            translation = current3DigitsTranslation + translation

            // handle space after unit - how do we know if we need a space? 1000
            num /= 1000
        }

        return translation
    }
}

let s = Solution()
s.numberToWords(1000)
