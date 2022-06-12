#ifndef MYCLASS4_H
#define MYCLASS4_H

#include <iostream>
template<typename T>
class myclass4
{
 public:
 myclass4();
 template<class T1>
	 T1 SomeStuff(T1 myval);
	 //{
	//	 std::cout<<myval<<std::endl;
	// };

 
 virtual ~myclass4();
 protected:
 private:
};
#endif // MYCLASS4_H

