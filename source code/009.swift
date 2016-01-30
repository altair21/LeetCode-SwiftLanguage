class Solution {
    func isPalindrome(x: Int) -> Bool {
        if x < 0 {
            return false
        }
        let str = String(x)
        let arr = Array(str.characters)
        var index1 = 0, index2 = arr.count - 1
        var res = true
        for char in arr {
            if index1 > index2 {
                break
            }
            if arr[index1] != arr[index2] {
                res = false
                break
            }
            
            index1++
            index2--
        }
        return res
    }
}