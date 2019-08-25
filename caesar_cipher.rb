def encrypt(ltr, up_alpha_norm, down_alpha_norm, up_alpha_shift, down_alpha_shift)
        up_pos = up_alpha_norm.index(ltr)
        down_pos = down_alpha_norm.index(ltr)
        if(up_pos != nil)
                return ltr = up_alpha_shift[up_pos]
        elsif(down_pos != nil)
                return ltr = down_alpha_shift[down_pos]
        else
                return ltr
        end
end

def caesar_cipher(message, shift)
    up_alpha_norm = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    down_alpha_norm = "abcdefghijklmnopqrstuvwxyz"
    
    if(shift % 26 == 0 || shift == 0)
        return puts message
    end
    shift = shift % 26
    up_alpha_shift = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    up_alpha_shift = up_alpha_shift[shift..-1] + up_alpha_shift[0..shift-1]
    down_alpha_shift = up_alpha_shift.downcase
    to_encrypt = message.split(//)
    encrypted = []
    to_encrypt.each do |ltr|
        encrypted.push(encrypt(ltr, up_alpha_norm, down_alpha_norm, up_alpha_shift, down_alpha_shift))
    end
    puts encrypted.join('')
end

lineWidth = 80
puts ("Welcome to the Caesar Cipher".center(lineWidth))
puts "Please enter a message to encrypt. We will encrypt the message to be sent."
puts "Ex: Given a shift of 3, the letter \"a\" will become \"d\""

message = gets.chomp
puts "Now enter your shift"
shift = gets.chomp.to_i
caesar_cipher(message, shift)
