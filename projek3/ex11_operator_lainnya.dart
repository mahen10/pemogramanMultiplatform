void main(List<String> args) {
  print(2 is int);      // true
  print(2 is num);      // true
  print(2 is! String);  // true
  print([1, 2, 3] is Map); // false

  int a = 9, b = 10;  // Pastikan ini bertipe int
  print(a.isOdd);     // true
  print(a.isEven);    // false

  int maks = a > b ? a : b;  // a dan b sudah int
  print('Nilai max dari $a dan $b adalah $maks');

  int? aNullable = null;  // Gunakan int? agar bisa null
  int c = aNullable ?? b; // Gunakan null-aware operator
  print('Nilai c: $c');
}
