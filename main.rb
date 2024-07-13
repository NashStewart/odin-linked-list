# frozen_string_literal: true

require_relative 'lib/linked_list'

puts "\nnew():"
list = LinkedList.new
puts list
puts list.size

puts "\nappend():"
list.append 're'
puts list
puts list.size

list.append 'mi'
puts list
puts list.size

list.append 'fa'
puts list
puts list.size

puts "\nprepend():"
list.prepend 'do'
puts list
puts list.size

puts "\nat():"
list.each_with_index { |_, index| puts list.at index }

puts "\npop():"
puts "Before: #{list}"
puts "Return: #{list.pop}"
puts "After: #{list}"

puts "\ncontains?():"
puts list
puts "'fa': #{list.contains? 'fa'}"
puts "'re': #{list.contains? 're'}"

puts "\nfind():"
puts list
puts "'re': #{list.find 're'}"
