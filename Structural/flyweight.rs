use std::collections::HashMap;

#[derive(Debug)]
struct Flyweight {
    shared_state: String,
}

impl Flyweight {
    fn new(shared_state: &str) -> Flyweight {
        Flyweight {
            shared_state: shared_state.to_string(),
        }
    }

    fn operation(&self, unique_state: &[&str]) {
        let unique_state_str: Vec<&str> = unique_state.iter().cloned().collect();
        println!(
            "Flyweight: Displaying shared ({}) and unique ({}) state.",
            &self.shared_state,
            &unique_state_str.join(", ")
        );
    }
}

#[derive(Debug)]
struct FlyweightFactory {
    flyweights: HashMap<String, Flyweight>,
}

impl FlyweightFactory {
    fn new(initial_flyweights: Vec<Vec<&str>>) -> FlyweightFactory {
        let mut flyweights = HashMap::new();
        for state in initial_flyweights {
            let key = FlyweightFactory::get_key(&state);
            flyweights.insert(key, Flyweight::new(&state.join("_")));
        }
        FlyweightFactory { flyweights }
    }

    fn get_key(state: &[&str]) -> String {
        let mut sorted_state: Vec<&str> = state.to_vec();
        sorted_state.sort();
        sorted_state.join("_")
    }

    fn get_flyweight(&mut self, shared_state: &[&str]) -> &Flyweight {
        let key = FlyweightFactory::get_key(shared_state);

        if !self.flyweights.contains_key(&key) {
            println!("FlyweightFactory: Can't find a flyweight, creating new one.");
            let new_flyweight = Flyweight::new(&shared_state.join("_"));
            self.flyweights.insert(key.clone(), new_flyweight);
        } else {
            println!("FlyweightFactory: Reusing existing flyweight.");
        }

        self.flyweights.get(&key).unwrap()
    }

    fn list_flyweights(&self) {
        let count = self.flyweights.len();
        println!("FlyweightFactory: I have {} flyweights:", count);
        for key in self.flyweights.keys() {
            println!("{}", key);
        }
    }
}

fn add_car_to_police_database(
    factory: &mut FlyweightFactory,
    plates: &str,
    owner: &str,
    brand: &str,
    model: &str,
    color: &str,
) {
    println!("\n\nClient: Adding a car to database.");
    let flyweight = factory.get_flyweight(&[brand, model, color]);
    flyweight.operation(&[plates, owner]);
}

fn main() {
    let initial_flyweights = vec![
        vec!["Chevrolet", "Camaro2018", "pink"],
        vec!["Mercedes Benz", "C300", "black"],
        vec!["Mercedes Benz", "C500", "red"],
        vec!["BMW", "M5", "red"],
        vec!["BMW", "X6", "white"],
    ];

    let mut factory = FlyweightFactory::new(initial_flyweights.clone());

    factory.list_flyweights();

    add_car_to_police_database(
        &mut factory,
        "CL234IR",
        "James Doe",
        "BMW",
        "M5",
        "red",
    );

    add_car_to_police_database(
        &mut factory,
        "CL234IR",
        "James Doe",
        "BMW",
        "X1",
        "red",
    );

    println!("\n");

    factory.list_flyweights();
}