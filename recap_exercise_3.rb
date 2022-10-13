

def no_dupes?(arr) #O(nlogn) solution arguably not as efficient as O(n) solution
    cnt = Hash.new(0)
    res = []
    arr.each{|i| cnt[i] += 1}
    cnt.each{|k, v| res << k if v == 1}
    res
end


#p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
#p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
#p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)

    (0...arr.length - 1).each {|i| return false if arr[i] == arr[i + 1]}
    true
end


## Examples
#p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
#p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
#p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
#p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
#p no_consecutive_repeats?(['x'])                              # => true



def char_indices(s)
    res = Hash.new{|h, k| h[k] = []}
    s.each_char.with_index{|c, i| res[c] << i }
    res
end


# Examples
#p char_indices('mississippi')   == {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
#p char_indices('classroom')     == {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
#
#
def longest_streak(s)
    streak =''
    mx = ''
   
    s.each_char do|c|
        if c != streak[-1]
            streak = c
            mx = streak  if streak.length > mx.length

        else 
            streak += c
            mx = streak  if streak.length > mx.length

        end
    end
    mx
end

#p longest_streak('a') # 'a'
#p longest_streak('accccbbb') # 'cccc'
#p longest_streak('aaaxyyyyyzz') # 'yyyyy'
#p longest_streak('aaabbb') # 'bbb'
#p longest_streak('abc')  # 'c'


def is_prime?(num)
    return false if num < 2
    (2..num/2).each{|n| return false if num % n == 0}
    true
end

def bi_prime?(num)
    return false if num <= 0

    (2..num/2).each {|n| return true if is_prime?(n) and is_prime?(num/n)}
    false


end



# Examples
# p bi_prime?(14) == true
# p bi_prime?(22) == true
# p bi_prime?(25) == true
# p bi_prime?(94) == true
# p bi_prime?(24) == false
# p bi_prime?(64) == false


def vigenere_cipher #Should check the edge case of uppers or lowers



end


## Examples
#vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
#vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
#vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
#vigenere_cipher("zebra", [3, 0])            # => "ceerd"
#vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(s) #O(2n) 2 pass solution, get the vowels, change them after
    vowels = 'aeiouAEIOU'
    v = []

    s.each_char{|c| v << c if vowels.include?c}
    v.unshift(v.pop)
    
    s.each_char.with_index do |c, i|
        if vowels.include?c
            s[i] =v.shift

        else
            next
        end
    end
    return s
end
#
#
## Examples
#p vowel_rotate('computer')      # => "cempotur"
#p vowel_rotate('oranges')       # => "erongas"
#p vowel_rotate('headphones')    # => "heedphanos"
#p vowel_rotate('bootcamp')      # => "baotcomp"
#p vowel_rotate('awesome')       # => "ewasemo"
#
#
#
String#select

class String
    
    def select(&prc)
        prc ||= Proc.new{|c| false}
        res = ''
        self.each_char{|c| res += c if prc.call(c)}
        res
    end
    

    #Doesn't work, but this is alvin's answer D: not sure how to accept multiple arguments to a proc

    def map!(&prc)
        self.each_char.with_index do |c, i| 
            self[i] = prc.call(c, i)
        end
    end

end


# Examples
#p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
#p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
#p "HELLOworld".select          # => ""



#String#map!


word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end

p word_1.map!        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


def multiply(x, y)
    product = 0
    return product if y == 0

    if y < 0 #Take the negative value from y give it to x
        y *= -1
        x *= -1
    end

    return product += x + multiply(x, y -1)
end

#p multiply(3, 5)        # => 15
#p multiply(5, 3)        # => 15
#p multiply(2, 4)        # => 8
#p multiply(0, 10)       # => 0
#p multiply(-3, -6)      # => 18
#p multiply(3, -6)       # => -18
#p multiply(-3, 6)       # => -18


def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2
    return lucas_sequence(n - 1) << lucas_sequence(n - 2)[-1] + lucas_sequence(n - 1)[-1]
    

end

#p lucas_sequence(0)   # => []
#p lucas_sequence(1)   # => [2]    
#p lucas_sequence(2)   # => [2, 1]
#p lucas_sequence(3)   # => [2, 1, 3]
#p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]



#Recursive answer
def prime_factorization(num)
    return [num] if is_prime?(num)
    factor = 1
    (2..num/2).each do |n|
        if is_prime?(n) and num % n == 0
            factor = n
            break
        end
    end

    return [factor] + prime_factorization(num/factor)
end




#dp can be used to speed this up significantly ^^^^

$dp_prime = {}
$dp_range = []
def dp_prime?(num)
    
    (2..num).each {|n|  $dp_prime[n] = n if is_prime?num}
    
end

#DP answer for prime_factorization
#def prime_factorization(num)
#
#    return [] if num <= 1 
#
#    dp_prime?(num) if $dp_prime == {}
#    return [num] if $dp_prime.has_key?num
#
#    factor = 1
#    (2..num/2).each do |n|
#        if dp_prime?(n) and num % n == 0
#            factor = n
#            break
#        end
#    end
#
#    return [factor] + prime_factorization(num/factor)
#end


p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]