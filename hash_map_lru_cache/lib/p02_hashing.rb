# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     str = self.join("")
#     str.hash
#   end
# end

# class String
#   def hash
#     to_build = 0
#     self.each_char.with_index do |char, i|
#       hashvalue = char.ord.hash * i.hash
#       to_build += hashvalue
#     end
#     to_build
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#     self.to_a.sort.hash
#   end
# end
