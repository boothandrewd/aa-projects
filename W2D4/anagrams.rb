# W2D4/anagrams.rb

def first_anagram?(string_1, string_2)
  permutations(string_1.chars).to_a.include?(string_2.chars)
end

def permutations(array)
  return [array] if array.empty?

  permutations(array.drop(1)).reduce([]) do |acc, perm|
    acc + (0...array.size).map { |idx| perm.dup.insert(idx, array.first) }
  end
end

p first_anagram?('gizmo', 'sally')
p first_anagram?('elvis', 'lives')


def second_anagram?(string_1, string_2)
  result = []

  string_1.each_char do |ch|
    result << ch if string_2.include?(ch)
  end

  string_2.each_char do |ch|
    result << ch if string_1.include?(ch)
  end

  result.uniq.each do |ch|
    string_1.delete!(ch)
    string_2.delete!(ch)
  end

  string_1.empty? && string_2.empty?
end

p second_anagram?('gizmo', 'sally')
p second_anagram?('elvis', 'lives')

def third_anagram?(string_1, string_2)
  string_1.chars.sort == string_2.chars.sort
end

p third_anagram?('gizmo', 'sally')
p third_anagram?('elvis', 'lives')

def fourth_anagram?(string_1, string_2)
  string_hash = Hash.new(0)

  string_1.each_char do |ch|
    string_hash[ch] += 1
  end

  string_2.each_char do |ch|
    string_hash[ch] -= 1
  end

  return string_hash.values.all?(&:zero?)

end

p fourth_anagram?('gizmo', 'sally')
p fourth_anagram?('elvis', 'lives')
