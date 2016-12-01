arr = [1, 2, 10, 7, 5, 0]
puts "Unsorted array:"
puts arr

def mergesort unsorted
  length = unsorted.length

  return unsorted if length <= 1

  mid = length / 2
  front = mergesort unsorted.slice(0, mid)
  back = mergesort unsorted.slice(mid, length)

  sorted = []
  front_offset = 0
  back_offset = 0

  while front_offset < front.length && back_offset < back.length
    a = front[front_offset]
    b = back[back_offset]

    if a <= b
        sorted << a
        front_offset += 1
    else
        sorted << b
        back_offset += 1
    end
  end

  while front_offset < front.length
    sorted << front[front_offset]
    front_offset += 1
  end

  while back_offset < back.length
    sorted << back[back_offset]
    back_offset += 1
  end

  return sorted
   
end

sorted_arr = mergesort arr
puts "Sorted array:"
puts sorted_arr