void main() {
  // Perulangan forEach pada List
  List<int> list = [10, 20, 30, 40, 50];
  list.forEach((elemen) {
    print(elemen);
  });

  // Perulangan forEach pada Map
  Map<String, String> map = {
    'one': 'satu',
    'two': 'dua',
    'three': 'tiga',
    'four': 'empat',
    'five': 'lima'
  };

  map.forEach((key, value) {
    print("'$key' artinya '$value'");
  });
}
