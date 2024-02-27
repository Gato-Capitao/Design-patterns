class Singleton{
    constructor(){}

    static #instance

    static getInstance(){
        if(!Singleton.#instance){
            Singleton.#instance = new Singleton()
        }

        return Singleton.#instance
    }

    static businessLogic(){
        console.log("Working...")
    }
}

function clientCode(){
    const s1 = Singleton.getInstance()
    const s2 = Singleton.getInstance()

    console.log(s1, "===", s2)
}

clientCode()