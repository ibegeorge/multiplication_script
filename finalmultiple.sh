#!/bin/bash

# Function to check if input is a valid number
is_number() {
    [[ "$1" =~ ^-?[0-9]*\.?[0-9]+$ ]]
}

while true; do
    # Prompt for multiplicand
    while true; do
        read -p "Enter number or multiplicand of choice: " a
        if is_number "$a"; then
            echo "Valid input!"
            break
        else
            echo "Invalid input. Please enter a valid number."
        fi
    done

    # Prompt for table type
    while true; do
        read -p "Press f for full table or p for partial: " table_type
        if [ "$table_type" = "f" ]; then
            echo "The full multiplication table for $a is:" 
            
            # List-style loop
            for multiplier in {1..10}; do
                product=$(($a * $multiplier))
                echo "$a x $multiplier = $product"
            done
            
            # C-style loop (commented out)
            # for ((i = 1; i <= 10; i++)); do
            #     product=$(($a * i))
            #     echo "$a x $i = $product"
            # done

            break
        elif [ "$table_type" = "p" ]; then
            echo "What range are you looking at?"
            
            # Prompt for range values
            read -p "Enter range starting number:  " start
            read -p "Enter range end number:  " end

            # Validate range inputs
            if [ "$start" -lt 1 ] || [ "$start" -gt 10 ] || [ "$end" -lt 1 ] || [ "$end" -gt 10 ] || [ "$start" -ge "$end" ]; then
                echo "Invalid range. Printing full table from 1 to 10 instead."
                
                # Print full table as fallback
                for multiplier in {1..10}; do
                    product=$(($a * $multiplier))
                    echo "$a x $multiplier = $product"
                done

                # C-style loop (commented out)
                # for ((i = 1; i <= 10; i++)); do
                #     product=$(($a * i))
                #     echo "$a x $i = $product"
                # done
                
                break
            else
                echo "The partial multiplication table for $a from $start to $end is: "
                
                # List-style loop
                for num in $(seq "$start" "$end"); do
                    product=$(($a * $num))
                    echo "$a x $num = $product"
                done
                
                # C-style loop (commented out)
                # for ((i = start; i <= end; i++)); do
                #     product=$(($a * i))
                #     echo "$a x $i = $product"
                # done
                
                break
            fi
        else
            echo "Invalid input. Please press f for full table or p for partial."
        fi
    done

    # Ask if user wants to restart or exit
    read -p "Do you want to restart the program? (y/n): " restart
    if [ "$restart" != "y" ]; then
        echo "Goodbye!"
        exit 0
    fi
done
