DICTIONARY = ["superior", "magical", "quick", "remarkable", "skyrocket", "stressed", "judgemental", "authoritative", "condescending", "wicked", "corrupting", "aggressive", "easy", "genuine", "realiable", "honest", "secure", "blissful", "gratified", "jovial", "world", "liberated", "thrilled", "pleased", "bright", "upbeat", "authentic", "forgiving", "dynamic", "productive", "responsive", "profitable", "superb", "urge"]

def substring(text)
    matches = []
    DICTIONARY.each do |word|
        if(text.index(/#{word}/))
            matches.push(word)
        end
    end
    return matches
end

puts "Welcome to the substring finder".center(40)
puts "Enter a word, sentence, haiku, etc. and we will determine"
puts "if the text has words that emote passion."
puts "---------".center(40)
text = gets.chomp
result = substring(text)
puts result.each {|word| "\"#{word}\""}