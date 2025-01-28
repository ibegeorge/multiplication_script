# Bash Script for Generating a Multiplication Table
---
### Objective: 
A script that generates a mulitplication table for a number entered by the user

---
### Description: 
Script should prompt the user to enter a number. Ask the user if they prefer to see a full multiplication table from 1 to 10 or whether they prefer a partial table within a specified range. Based on the choice , the script should display the corresponding multiplication table.

---
### Project Requirements: 
1. User Input for the Number
2. User Input for the Table Type
3. User Input for choice of range
4. User Input Validation and Handling
5. Conditional Logic
6. Loops
7. Readable Output
8. Comments and Code Quality

---
## Script Snippet
```bash
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
```
---
### How I started the project
I started this project manually, by breaking down the steps that I will take to manaully achieve a solution and these are the steps that I wrote down
1. I will ask the person (user) fror his number of choice or better yet , multiplicand.
2. I will verify that what he tells me is valide, that is, it makes sense to be called a number.
3. I ask whether he wants a full multiplication table with multipliers from 1 - 10 or a partial one and then I work for him based on his choice.
4. If he says he wants a full table the I take the following steps:
   - 1. I separately calculate all the products for each multiplier from 1-10 and keep the product using the formula [multiplicand * multiplier = product]
     2. Then I begin to present the table in a readable way like so [ multiplicand * 1 = product ] ... [ multiplicand * 10 = product ]
5. But if he says he wants a partial table then I go through the following steps:
   - 1. Ask him for range values of multipliers to work with.
     2. Collect starting number and ending number
     3. Verify that the range values meets the appropriate conditions for the range to be correct such as:
        - 1. End number must be greater than starting number
          2. Values cannot be less than one and cannot be greater than 10
          3. Values cannot be equal
          4. Values must be numbers
     4. If the range is valid, I proceed to calculate the product for all the valid multipliers in range and keep them.
     5. Then I write out the table expressly line by line like so [ multiplicand * starting_number = product ] ... [ multiplicand * end_number = product ]
     6. Where as if the range is not valid, then I provide the full mulitiplication table from 1 - 10.
---
### Script Breakdown Highlighting Various Project Requirements

### Number Input 

```bash
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
```
The third line in the above block , prompts the user to enter a multiplicand , and also stores the value in the variable "$a"

#### Validating Number Input and Relevant Conditional Logic
```bash
   # Function to check if input is a valid number
is_number() {
    [[ "$1" =~ ^-?[0-9]*\.?[0-9]+$ ]]
}

while true; do
        read -p "Enter number or multiplicand of choice: " a
        if is_number "$a"; then
            echo "Valid input!"
            break
        else
            echo "Invalid input. Please enter a valid number."
        fi
    done
```
---

### Table_Type Input 

```bash
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
```
The third line in the above block , prompts the user choice for table type , and also stores the decision or value in the variable "$table_type"

#### Validating Table_Type Input and Relevant Conditional Logic
```bash
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
```
---
### Range Input

```bash
    echo "What range are you looking at?"

             # Prompt for range values
            read -p "Enter range starting number:  " start
            read -p "Enter range end number:  " end

```
The above block handles input for the range values. Prompts user for range starting and ending numbers respectively and stores the values in variables $start and $end

### Comments
Script is properly commented out for better readability
