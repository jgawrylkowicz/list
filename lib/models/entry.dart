class Entry {
  int id;
  var name;
  double value;

  static int counter = 0;

  Entry(name, value){
    this.id = counter++;
    this.name = name;
    this.value = value;
  }
}