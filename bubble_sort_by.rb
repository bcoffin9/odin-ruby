#This method will allow you to input an array and provide a block that returns an integer. If the integer is greater than 0, then the current value is considered to be "bigger" than the next value.
#This concept could be used to present the user a couple of pre-written functions that can be called on certain data types. Very Helpful indeed.

def bubble_sort_by(arr)
    if block_given?
        swap = -1
        #bubble sort functionality
        while swap != 0
            swap = 0
            for i in 0..(arr.length - 2) do
    
                if (yield(arr[i], arr[i+1]) > 0)
                    arr[i], arr[i+1] = arr[i+1], arr[i]
                    swap += 1
                end
    
            end
        end

    else
        arr.sort
    end
    puts "--------------"
    output = arr.join(", ")
    puts "[#{output}]"
end

#given test
bubble_sort_by(["hey", "hello", "hi"]) {|left, right| left.length - right.length
}
#sort by last name. Compatible with mixed case.
bubble_sort_by(["Abraham Lincoln", "Thomas Brady", "Doulas McKinley", "William Chesterfield", "Adam Scott", "Pedro martinez"]) do |first, second|
    first_name_split = first.split(/ /)
    second_name_split = second.split(/ /)
    first_name_split[-1].downcase <=> second_name_split[-1].downcase
end