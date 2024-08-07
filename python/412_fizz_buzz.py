class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        res = []
        
        for i in range(1, n+1):
            if i % 3 == 0:
                tmp = "Fizz"
                if i % 5 == 0:
                    tmp += "Buzz"
            elif i % 5 == 0:
                tmp = "Buzz"
            else:
                tmp = str(i)
            
            res.append(tmp)
        
        return res
        
                