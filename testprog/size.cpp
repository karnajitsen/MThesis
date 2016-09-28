#include <iostream>

using namespace std;
int main()
{

 cout << "size of data types in bytes" << std::endl;
 cout <<  "Short: " << sizeof(short) << std::endl;
 cout <<  "Char: " << sizeof(char) << std::endl;
 cout <<  "Float: " << sizeof(float) << std::endl;
 cout <<  "Integer: " << sizeof(int) << std::endl;
 cout <<  "Unsigned Integer: " << sizeof(unsigned int) << std::endl;
 cout <<  "double: " << sizeof(double) << std::endl;
 cout <<  "Long: " << sizeof(long) << std::endl;
 cout <<  "Long Long: " << sizeof(long long) << std::endl;
 cout <<  "Unsigned Long Long pointer: " << sizeof(unsigned long long*) << std::endl;
 
  int i=system ("pwd");
  cout << i;
 
 return 0;
}
