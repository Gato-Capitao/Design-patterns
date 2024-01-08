using System;

namespace DesignPatterns.AbstractFactory
{
    public interface AbstractFactory{
        IAbstractProductA createProductA();
        IAbstractProductB createProductB();
    }

    public class ConcreteFactory1 : AbstractFactory{
        public IAbstractProductA createProductA(){
            return new ConcreteProductA1();
        }

        public IAbstractProductB createProductB(){
            return new ConcreteProductB1();
        }
    }

    public class ConcreteFactory2 : AbstractFactory{
        public IAbstractProductA createProductA(){
            return new ConcreteProductA2();
        }

        public IAbstractProductB createProductB(){
            return new concreteProductB2();
        }
    }

    public interface IAbstractProductA{
        string usefulFunctionA();
    }

    class ConcreteProductA1 : IAbstractProductA{
        public string usefulFunctionA(){
            return "Função de A1";
        }
    }

    class ConcreteProductA2 : IAbstractProductA{
        public string usefulFunctionA(){
            return "Função de A2";
        }
    }

    public interface IAbstractProductB{
        string usefulFunctionB();
    }

    class ConcreteProductB1 : IAbstractProductB{
        public string usefulFunctionB(){
            return "Função útil de B1";
        }
    }

    class concreteProductB2 : IAbstractProductB{
        public string usefulFunctionB(){
            return "Função útil de B2";
        }
    }

    class Client{
        public void Main(){
            Console.WriteLine("Testing first factory.");
            ClientMethod(new ConcreteFactory1());

            Console.WriteLine("Testing second factory.");
            ClientMethod(new ConcreteFactory2());
        }
        public void ClientMethod(AbstractFactory factory){
            //Creating products
            IAbstractProductA productA = factory.createProductA();
            IAbstractProductB productB = factory.createProductB();

            //Testing
            Console.WriteLine(productA.usefulFunctionA());
            Console.WriteLine(productB.usefulFunctionB());
        }
    }

    class Program
    {
        static void Main(string[] args)
        {   
            Client client = new Client()
            client.Main()
        }
    }
}