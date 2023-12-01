//Para testar só a função que foi requisitada no teste, basta copiar este código e executar no https://dartpad.dev/
int func(int num) {
  int sum = 0;
  var result = [];

  if (num < 1) {
    return 0;
  }
  for (int i = 1; i < num; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      result.add(i);
      sum += i;
    }
  }
  print(result);
  return sum;
}

void main() {
  int num = 11;

  print(func(num));
}
