# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)

    (2...num_1*num_2).each {|n| return n if n % num_1 == 0 and n % num_2 == 0}

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.

def most_frequent_bigram(s)
    res = Hash.new(0)
    (0...s.length-1).each{|i| res[s[i] + s[i + 1]] += 1}
    mx =[0, 0]
    res.each do |k, v|
        if v > mx[1]
            mx[0] = k
            mx[1] = v
        end
    end
    mx[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        res = {}
        self.each{|k, v| res[v] = k}
        res
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        res = 0
        tracking = {}

        self.each do |i|
            if tracking.has_key?i
                res += 1
            else
                tracking[num - i] = 0
            end
        end
        res 
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    
    def bubble_sort(&prc)
        prc ||= Proc.new{|i, j| i <=> j }
        sorted = false

        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end


    #Question, why doesn't i > j work?

   # def bubble_sort(&prc)
   #     prc ||= Proc.new{|i, j| i > j }
   #     sorted = false
   #     while !sorted
   #         sorted = true
   #         (0...self.length - 1).each do |i|
   #             if prc.call(self[i], self[i + 1])
   #                 self[i], self[i + 1] = self[i + 1], self[i]
   #                 sorted = false
   #             end
   #         end
   #     end
   #     self
   # end
   #
end
