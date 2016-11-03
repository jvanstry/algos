puts "Enter two numbers, separated by space"
str = gets.chomp
number_1 = str.split(" ")[0].to_i
number_2 = str.split(" ")[1].to_i

def karatsuba num_1, num_2
  if num_1.to_s.length <= 1 || num_2.to_s.length <= 1
    return num_1 * num_2
  end

  n = [num_1.to_s.length, num_2.to_s.length].min
  k = ( n + 1 ) / 2

  num_1_mid = num_1.to_s.length - k
  num_2_mid = num_2.to_s.length - k

  a = num_1.to_s[0..num_1_mid-1].to_i
  b = num_1.to_s[num_1_mid..-1].to_i
  c = num_2.to_s[0..num_2_mid-1].to_i
  d = num_2.to_s[num_2_mid..-1].to_i

  s1 = karatsuba a, c
  s2 = karatsuba b, d
  s3 = karatsuba a + b, c + d
  s4 = s3 - s2 - s1 ## ad + bc

  ((10**(2*k)) * s1) + (10**k * s4) + s2
end

kar_res = karatsuba number_1, number_2
puts kar_res
puts kar_res == number_1 * number_2