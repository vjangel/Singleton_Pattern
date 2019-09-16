#include "danli.h"

class Singelton
{
public:
    static Singelton * GGetSingelton();

private:
    Singelton(){};
    static Singelton * single;
};

Singelton * Singelton::single = nullptr;
Singelton * Singelton::GGetSingelton()
{
    if(nullptr == single)
    {
        single = new Singelton;
    }
    return single;
}

void test_01()
{
    //只有调用GetSingelton时，类才会new出对象
    Singelton *s1 = Singelton::GGetSingelton();
    Singelton *s2 = Singelton::GGetSingelton();

    if(s1 == s2)
    {
        std::cout << "s1 == s2" << std::endl;
    }
    else
    {
        std::cout << "s1 != s2" << std::endl;
    }
}
