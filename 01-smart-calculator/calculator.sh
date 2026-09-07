#!/bin/bash
addition() {
    sum=$((num1 + num2))
    echo "Sum: $sum"
}
subtraction() {
    difference=$((num1 - num2))
    echo "Difference: $difference"
}
multiplication() {
    product=$((num1 * num2))
    echo "Product: $product"
}
division() {
    if [ "$num2" -eq 0 ]; then
        echo "Error: Cannot divide by zero."
    else
        quotient=$((num1 / num2))
        echo "Quotient: $quotient"
    fi
}
while true; do
echo "===== Smart Calculator ====="
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"
read -p "Choose an operation (1-5): " choice
if [[ ! "$choice" =~ ^[1-5]$ ]]; then
    echo "Error: Please choose an option between 1 and 5."
    exit 1
fi
if [ "$choice" -eq 5 ]; then
    echo "Goodbye!"
    break
fi
read -p "Enter first number: " num1
if [[ ! "$num1" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi
read -p "Enter second number: " num2
if [[ ! "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi
case "$choice" in
    1)
        addition
        ;;
    2)
        subtraction
        ;;
    3)
        multiplication
        ;;
    4)division
    ;;

       
esac
done
