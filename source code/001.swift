/**
 * 题意：输入一个数组和一个目标值，数组中某两个元素相加会得到该目标值，找到符合条件的两个元素，输出他们的下标。
 * 思路：直接搞，注意下标一样的情况
 */

class Solution {
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var sortedNums = nums.sort()
        
        var l = 0, r = nums.count - 1
        var res: [Int] = []
        while (l != r) {
            let cnt = sortedNums[l] + sortedNums[r]
            if (cnt == target) {
                let index1 = nums.indexOf(sortedNums[l])!
                res.append(index1 + 1)
                var index2 = nums.indexOf(sortedNums[r])!
                if (index1 == index2) {
                    index2 = nums[(index1 + 1)...(nums.count - 1)].indexOf(sortedNums[r])!
                }
                res.append(index2 + 1)
                break
            } else if (cnt > target) {
                r -= 1
            } else if (cnt < target) {
                l += 1
            }
        }
        return res.sort()
    }
}