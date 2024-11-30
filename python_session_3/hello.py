# test.py

def say_hello_username(names):
    """_summary_
        Prints graeatings to each name in the argument list
    Args:
        names (list): list of names.
    """
    for name in names:
        message = f"Hello, {name.title()}!"
        print(message)
