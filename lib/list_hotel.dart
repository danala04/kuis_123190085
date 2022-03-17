import 'package:flutter/material.dart';
import 'package:kuis_123190085/data_hotel.dart';
import 'package:kuis_123190085/detail_hotel.dart';

class ListHotel extends StatefulWidget {
  const ListHotel({Key? key}) : super(key: key);

  @override
  _ListHotelState createState() => _ListHotelState();
}

class _ListHotelState extends State<ListHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Hotel"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataHotel place = hotelList[index];
          var myInt = int.parse(place.stars);
          assert(myInt is int);
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailHotel(data: place)));
            },
            child: Card(
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter:
                        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        image: NetworkImage(place.imageUrl[0]))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          place.name,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < myInt; i++) Icon(Icons.star, color: Colors.white, size: 15,),
                        ],
                      ),
                      Text(
                        place.roomPrice,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              margin: EdgeInsets.only(left: 5, right: 5, top: 5.0),
            ),
          );
        },
        itemCount: hotelList.length,
      ),
    );
  }
}
