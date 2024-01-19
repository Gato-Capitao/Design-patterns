def log_begin_end(method):
    def wrapper(*args, **kwargs):
        print(f"Starting function: {method.__name__}.")
        result = method(*args, **kwargs)
        print(f"Ending function: {method.__name__}.")
    return wrapper

@log_begin_end
def destoy_planet(planet:str, weapon:str):
    print(f"Aiming {weapon} to {planet}.")
    print(f"Destroying {planet} using {weapon}!")
    print(f"The planet {planet} was successfully destroyed.")

@log_begin_end
def teleport(planet:str):
    print("Cheking and solving problems.")
    print("Recharging fuel.")
    print(f"Teleporting to {planet}.")

teleport(planet="Mercury")
destoy_planet(planet="Mercury", weapon="Íon laser")
