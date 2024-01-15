abstract type Observer end

struct ConcreteObserver <: Observer
    name::String
end

function update(observer::ConcreteObserver, message::String)
    println("The observer $(observer.name) received the message $(message)")
end

abstract type Subject end

struct ConcreteSubject{T} <: Subject
    observers::Vector{T}
    state::String
end

function addObserver(subject::ConcreteSubject, observer::ConcreteObserver)
    push!(subject.observers, observer)
end

function notifyObserver(subject::ConcreteSubject, message::String)
    for observer in subject.observers
        update(observer, message)
    end
end

obs1 = ConcreteObserver("Observer 1")
obs2 = ConcreteObserver("Observer 2")

subject = ConcreteSubject{ConcreteObserver}([], "Initial State")

addObserver(subject, obs1)
addObserver(subject, obs2)

notifyObserver(subject, "state change to new state")