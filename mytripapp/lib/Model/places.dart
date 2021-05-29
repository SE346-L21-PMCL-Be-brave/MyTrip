class Place {
  String name;
  String locate;
  String img;

  Place({this.name, this.locate, this.img});

}

List<Place> placeList=[
  Place(name: "testname",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
];
List<Place> placeList1=[
  Place(name: "testname2",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname2",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname2",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname2",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  Place(name: "testname2",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
];
class Trip{
 static List<List<Place>> trip = [
  placeList,
  placeList1,
];

}

