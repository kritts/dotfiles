Vim�UnDo� �;cIX4����$��}����"�H[�>��8              private int num;                             UHB�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             UHB�    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        UHB�    �                 public class IntObjectTest {   ;        public static IntObject someMethod(IntObject obj) {   (                    IntObject ans = obj;   ,                            ans.increment();   /                                    return ans;   )                                        }   r            public static void main(String[] args) {   // _---------------------------- MAIN----------------------   7                        IntObject x = new IntObject(2);   ?                                IntObject y = new IntObject(7);   8                                        IntObject a = y;   B                                                x = someMethod(y);   J                                                        a = someMethod(x);   =                                                            }   }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             UHB�    �                       private int num;5��