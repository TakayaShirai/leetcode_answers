class Solution {
  func numUniqueEmails(_ emails: [String]) -> Int {
    var unique = Set<String>()

    for email in emails {
      let newEmail = modifyEmail(email)
      unique.insert(newEmail)
    }

    return unique.count

  }

  func modifyEmail(_ email: String) -> String {
    var index: String.Index = email.startIndex
    var modifiedEmail: String = ""

    while email[index] != "@" && email[index] != "+" {
      if email[index] != "." {
        modifiedEmail.append(email[index])
      }
      index = email.index(after: index)
    }

    while email[index] != "@" {
      index = email.index(after: index)
    }

    modifiedEmail.append("@")
    index = email.index(after: index)

    while index < email.endIndex {
      modifiedEmail.append(email[index])
      index = email.index(after: index)
    }

    return modifiedEmail
  }

  //         var unique = Set<String>()

  //         for email in emails {
  //             let parts = email.split(separator: "@")
  //             let local = parts[0].split(separator: "+")[0].replacingOccurrences(of: ".", with: "")
  //             let domain = parts[1]
  //             unique.insert("\(local)@\(domain)")
  //         }

  //         return unique.count

  //         var emailsTable: [String : Int] = [:]

  //         for email in emails {
  //             var modifiedEmail = modifyEmail(email)
  //             emailsTable[modifiedEmail, default:0] += 1
  //         }

  //         return emailsTable.keys.count
}
