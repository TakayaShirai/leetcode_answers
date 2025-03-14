class Solution {
  func removeOuterParentheses(_ s: String) -> String {
    var openParCnt: Int = 0
    var resPar: String = ""

    for par in s {
      if par == "(" && openParCnt > 0 {
        resPar.append(par)
      }

      if par == ")" && openParCnt > 1 {
        resPar.append(par)
      }

      openParCnt += par == "(" ? 1 : -1
    }

    return resPar
  }
}
