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

class ConstructCar{
public:
    void getName(){
        return "noName";
    }

    void getColor(){
        return "White";
    }
}

int main(){
    Car car;
    car.name = "Storm";
    car.color = "Red";
    car.engine = "V8";
    car.numberDoors = 2;
    car.numberWheels = 4;
    
    car.showInformation();
    return 0;
}