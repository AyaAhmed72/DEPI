from calc import add, subtract, mul, div

def main():
    print("Hey, this is the calculator")

    while True:
        command = input("Choose the operation you want to implement or type 'stop' to cease the operations: ").strip().lower()

        if command == "stop":
            print("Program Termination")
            break
        if command not in ['add', 'subtract', 'mul', 'div']:
            print("The command is not valid! Try again.")
            continue
        try:
            num1 = float(input("Please, enter the 1st number: "))
            num2 = float(input("Please, enter the 2nd number: "))
        except ValueError:
            print("The numbers are not valid! Try again.")
            continue

        if command == 'add':
            result = add(num1, num2)
        elif command == 'subtract':
            result = subtract(num1, num2)
        elif command == 'mul':
            result = mul(num1, num2)
        elif command == 'div':
            result = div(num1, num2)

        print(f"Your result of the {command} operation on {num1} and {num2} is {result}")

        another_input = input("Do you want to perform another operation (y or n)? ").strip().lower()
        if another_input != "y":
            print("We finished calculations, bye!")
            break

# Call the main function to start the program
main()