using System;
using Demo;

namespace testNet
{
    public class Fruit {
    public static String id() {
      return "This .NET class displays your favorite fruit.";
    }
    public String fruit;
    public Fruit () {
      fruit = "Uglyfruit";
    }
    public void setFruit(String newFruit) {
      fruit = newFruit;
    }
    public String getFruit() {
      return "My favorite fruit is "+fruit;
    }
     static void Main(string[] args)
        {
            BusinessService test = new BusinessService();
            test.OnTearDown();
        }
  }
}
