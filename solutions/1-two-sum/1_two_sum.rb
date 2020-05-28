# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
# O(n^2) / O(1)
# def two_sum(nums, target)
#   nums.each_with_index do |num, index|
#     target_index = nums.index(target - num)
#     return [index, target_index] if target_index != index && target_index
#   end
# end

# O(n) / O(n)
def two_sum(nums, target)
  hsh = {}
  nums.each_with_index do |num, index|
    complement = target - num
    if hsh[complement] && hsh[complement] != index
      return [hsh[complement], index]
    end

    hsh[num] = index
  end
end

p two_sum([3, 2, 4], 6) == [1, 2]
p two_sum([3, 3], 6) == [0, 1]