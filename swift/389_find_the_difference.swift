class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        // Bit Manipulation
        var curXORVal: UInt8 = 0

        for char in s {
            guard let asciiVal = char.asciiValue else { return Character("") }
            curXORVal ^= asciiVal
        }

        for char in t {
            guard let asciiVal = char.asciiValue else { return Character("") }
            curXORVal ^= asciiVal
        }

        return Character(UnicodeScalar(curXORVal))

        // Calc with Ascii Value
        // var total: UInt8 = 0

        // for char in t {
        //     guard let asciiVal = char.asciiValue else { return Character("") }
        //     total &+= asciiVal
        // }

        // for char in s {
        //     guard let asciiVal = char.asciiValue else { return Character("") }
        //     total &-= asciiVal
        // }

        // return Character(UnicodeScalar(total))

        // Hash Map
        // let sCharCntMap: [Character : Int] = createCharCntMap(s)
        // let tCharCntMap: [Character : Int] = createCharCntMap(t)

        // for (tChar, tCnt) in tCharCntMap {
        //     guard let sCnt = sCharCntMap[tChar] else { return tChar }

        //     if tCnt > sCnt {
        //         return tChar
        //     }
        // }

        // return Character("")
    }

    private func createCharCntMap(_ str: String) -> [Character : Int] {
        var map: [Character : Int] = [:]

        for char in str {
            map[char, default: 0] += 1
        }

        return map
    }
}