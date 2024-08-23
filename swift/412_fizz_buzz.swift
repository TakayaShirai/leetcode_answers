class Solution {
  func fizzBuzz(_ n: Int) -> [String] {
    var res: [String] = []

    for i in 1...n {
      var ans: String = ""

      if i % 3 == 0 {
        ans = "Fizz"
        if i % 5 == 0 {
          ans += "Buzz"
        }
      } else if i % 5 == 0 {
        ans = "Buzz"
      } else {
        ans = String(i)
      }

      res.append(ans)
    }

    return res
  }
}
