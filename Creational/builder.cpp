#include<string>
#include<iostream>
using namespace std;

class Car{
public:
    int numberDoors, numberWheels;
    string name, engine, color;

    void showInformation(){
        cout << "Name: " << name << "\n";
        cout << "Color: " << color << "\n";
        cout << "Engine: " << engine << "\n";
        cout << "Number wheels: " << numberWheels << "\n";
        cout << "Number doors: " << numberDoors << "\n";
    }
};

class IConstructCar{
public:
    virtual string setName() = 0;
    virtual string setColor() = 0;
    virtual string setEngine() = 0;
    virtual int setNumberWheels() = 0;
    virtual int setNumberDoors() = 0;
};

class ConcreteConstructorFord: public IConstructCar{
public:
    string setName() override{
        return "Ford Mustang GT 1967";
    }

    string setColor() override{
        return "Sky blue";
    }

    string setEngine() override{
        return "Ford 351 Windsor V8";
    }

    int setNumberDoors() override{
        return 2;
    }

    int setNumberWheels() override{
        return 4;
    }
};

class ConcreteConstructorFiat: public IConstructCar{
public:
    string setName() override{
        return "Fiat 500 2008";
    }

    string setColor() override{
        return "White";
    }

    string setEngine() override{
        return "Fiat TwinAir 0.9L";
    }

    int setNumberDoors() override{
        return 2;
    }

    int setNumberWheels() override{
        return 4;
    }
};

class ConcreteConstructorTesla: public IConstructCar{
public:
    string setName() override{
        return "Tesla Model 3 2023";
    }

    string setColor() override{
        return "Black";
    }

    string setEngine() override{
        return "Tesla Electric Motor";
    }

    int setNumberDoors() override{
        return 4;
    }

    int setNumberWheels() override{
        return 4;
    }
};

class Director{
public:
    Car buildCar(IConstructCar& constructor){
        Car car;
        car.name = constructor.setName();
        car.engine = constructor.setEngine();
        car.color = constructor.setColor();
        car.numberDoors = constructor.setNumberDoors();
        car.numberWheels = constructor.setNumberWheels();

        return car;
    }
};

int main(){
    Director director;
    ConcreteConstructorFord constructorFord;
    ConcreteConstructorFiat constructorFiat;
    ConcreteConstructorTesla constructorTesla;

    Car car = director.buildCar(constructorFord);
    car.showInformation();

    cout << "\n";
    car = director.buildCar(constructorFiat);
    car.showInformation();

    cout << "\n";
    car = director.buildCar(constructorTesla);
    car.showInformation();
}