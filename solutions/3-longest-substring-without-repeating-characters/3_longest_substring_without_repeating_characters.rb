require 'benchmark'
# @param {String} s
# @return {Integer}
#
def length_of_longest_substring_1(str)
  longest = 0
  str_size = str.size

  str.chars.each_with_index do |_, i|
    hsh = Hash.new(0)
    j = 0
    loop do
      break if i + j == str_size

      hsh[str[i + j]] += 1
      break if hsh[str[i + j]] > 1

      j += 1
    end

    longest = [longest, j].max
  end

  longest
end

# TC : O(n), Index j will iterate n times.
# SC : O(min(m, n)).

def length_of_longest_substring(str)
  longest = 0
  i = 0
  j = 0
  str_size = str.size
  hsh = {}

  puts Benchmark.measure {
    while j < str_size
      if hsh.key?(str[j])
        i = [hsh[str[j]], i].max
      end
      longest = [longest, j - i + 1].max
      hsh[str[j]] = j + 1
      j += 1
    end
  }

  longest
end

p length_of_longest_substring('abcabcbb') == 3
p length_of_longest_substring('bbbbb') == 1
p length_of_longest_substring('pwwkew') == 3
p length_of_longest_substring('abacdbefg') == 7
