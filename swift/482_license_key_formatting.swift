class Solution {
  func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
    var reversedGroupsOfLicenseKey: [String] = []
    var curGroupChars: [Character] = []

    for char in s.reversed() where char != "-" {
      curGroupChars.append(char)

      if curGroupChars.count == k {
        reversedGroupsOfLicenseKey.append(String(curGroupChars.reversed()))
        curGroupChars.removeAll()
      }
    }

    if !curGroupChars.isEmpty {
      reversedGroupsOfLicenseKey.append(String(curGroupChars.reversed()))
    }

    let dashJoinedLicenseKey = reversedGroupsOfLicenseKey.reversed().joined(separator: "-")
    let uppercasedLicenseKey = dashJoinedLicenseKey.uppercased()

    return uppercasedLicenseKey
  }
}
