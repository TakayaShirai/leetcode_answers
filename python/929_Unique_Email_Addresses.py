class Solution:
    def numUniqueEmails(self, emails: List[str]) -> int:
        validEmails = {}
        
        for email in emails:
            localName, domainName = email.split('@')
            localName = localName.split('+')[0].replace('.', '')
            
            validEmail = localName + '@' + domainName
            
            if validEmail not in validEmails:
                validEmails[validEmail] = 0
        
        return len(validEmails)
        
        
#         validEmails = {}
        
#         for email in emails:
#             char = []
#             i = 0
#             while email[i] != "@":
#                 if email[i] == ".":
#                     i += 1
#                     continue
#                 elif email[i] == "+":
#                     while email[i] != "@":
#                         i += 1
#                         continue
#                     break
#                 else:
#                     char.append(email[i])
#                     i += 1
            
#             char.append(email[i:])
#             res = ''.join(char)
            
#             if res not in validEmails:
#                 validEmails[res] = 0
        
#         return len(validEmails)
        
