Creator_chain = {}

Users = {
    ["Adilson"] = {password = "ISaw10FrogJumpOverTheRiver.", paid_plan = true},
    ["Jonas"] = {password = "IDontHaveCreativityToCreatePasswords:C", paid_plan = false},
    ["Johnson"] = {password = "AreYouDoingWellToday?", paid_plan = true}
}
function Is_user_in_system(username)
    for key, _ in pairs(Users) do
        if key == username then
            return true
        end 
    end

    return false
end

function Creator_chain:create_element()
    local element = {
        next = nil,
    }
    function element:set_next(Next_handler)
        element.next = Next_handler
    end

    return element
end

function Concrete_user_checker()
    local element = Creator_chain:create_element()

    function element:handle(request)
        if Is_user_in_system(request.username) then
            print("The user exist:D")
            return element.next:handle(request)
        else
            print("The user doesn't exist :C")
        end
    end

    return element
end

function Concrete_password_checker()
    local element = Creator_chain:create_element()

    function element:handle(request)
        if request.password == Users[request.username].password then
            print("Correct password! :D")
            return element.next:handle(request)
        else
            print("Incorrect password! :C")
        end
    end

    return element
end

function Concrete_plan_checker()
    local element = Creator_chain:create_element()

    function element:handle(request)
        if Users[request.username].paid_plan then
            print("logging successfully")
        else
            print("The user doesn't paid the plan")
        end 
    end

    return element
end

--Create chain
User_checker = Concrete_user_checker()
Password_checker = Concrete_password_checker()
Paid_checker = Concrete_plan_checker()

Password_checker.next = Paid_checker
User_checker.next = Password_checker


--Create requests
Table_of_requests = {
    {
        username = "WrongUsername",
        password = "IDontHaveCreativityToCreatePasswords:C"
    },

    {
        username = "Adilson",
        password = "WrongPassword"
    },

    {
        username = "Jonas",
        password = "IDontHaveCreativityToCreatePasswords:C"
    },

    {
        username = "Adilson",
        password = "ISaw10FrogJumpOverTheRiver."
    },

    {
        username = "Johnson",
        password = "AreYouDoingWellToday?"
    }
}

for index, request in ipairs(Table_of_requests) do
    --Decorator
    print("Example ", index, "\nUsername:", request.username, "\nPassword:", request.password, "\n\nOutput:")
    
    User_checker:handle(request)
end

