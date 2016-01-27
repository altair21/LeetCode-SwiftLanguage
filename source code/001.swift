class Solution {
	func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var sortedNums = nums.sort()

        var l = 0, r = nums.count - 1
        var res: [Int] = []
        while (l != r) {
	        let cnt = sortedNums[l] + sortedNums[r]
	        if (cnt == target) {
		        var index1 = nums.indexOf(sortedNums[l])!
		        res.append(index1 + 1)
	        	var index2 = nums.indexOf(sortedNums[r])!
        		if (index1 == index2) {
        			index2 = nums[index1 + 1...nums.count - 1].indexOf(sortedNums[r])!
        		}
        		res.append(index2 + 1)
		        break
	        } else if (cnt > target) {
		        r--
	        } else if (cnt < target) {
		        l++
	        }
        }
        return res.sort()
	}
}