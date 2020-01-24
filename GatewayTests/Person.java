public class Person {

    public int age;
    public String name;

    //constructor
    public Person (int startAge, String Name) {

        age = startAge;
        name = Name;

    }
    
    public void setAge(int newAge) {

        age = newAge;
    }

    public String getName() {

        return name;
    }

    public int getAge() {

        return age;
    }

    public static void main(String []args) {

        Person myPerson = new Person (5, "Tom");
        System.out.println(myPerson.getName());
        System.out.println(myPerson.getAge());

    }

}