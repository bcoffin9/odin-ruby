LINE_WIDTH = 80

def picker(prices)
    prices = prices.split(/,? /).map {|price| price.to_f}
    optimal_choice = []
    optimal_profit = 0
    index = 0

    while index < prices.length - 1 do
        search_array = []
        search_array = prices[index+1..-1]
        profits = search_array.map {|price| price - prices[index]}

        #puts "[#{optimal_choice[0]}, #{optimal_choice[1]}]"
        if (optimal_choice.empty? || profits.max > optimal_profit)
            new_optimal_profit = profits.max + prices[index]
            optimal_choice.replace([prices[index], new_optimal_profit])
            optimal_profit = profits.max
        end
        index += 1

    end

    if optimal_profit > 0
        puts "[#{optimal_choice[0]}, #{optimal_choice[1]}]"
    else 
        puts "You picked a really bad stock"
    end

end


puts ("Welcome to the Stock Picker".center(LINE_WIDTH))
puts ("Enter a list of stock prices separated by either a space or comma".ljust(LINE_WIDTH))
puts ("We will tell you the highest profit possible".ljust(LINE_WIDTH))
puts ("--------------------------------------------")
prices = gets.chomp
#puts prices.split(/,? /)
picker(prices)