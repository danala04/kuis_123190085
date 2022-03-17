import 'package:flutter/material.dart';
import 'package:kuis_123190085/data_hotel.dart';

class DetailHotel extends StatefulWidget {
  final DataHotel data;
  const DetailHotel({Key? key, required this.data}) : super(key: key);


  @override
  _DetailHotelState createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    var myInt = int.parse(widget.data.stars);
    var itemCount = widget.data.facility.length;
    return Scaffold(
      appBar : AppBar(
        title: Text(widget.data.name),
        actions: [
          IconButton(
            icon: Icon( selected ? Icons.favorite_outline : Icons.title),
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
          ),
        ],
      ),
      body :
      Column(
        children: [
          Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: <Widget>[
                      Container(
                          width: 400,
                          height: 300,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.data.imageUrl[0])
                              )
                          )),
                      Container(
                          width: 400,
                          height: 300,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.data.imageUrl[1])
                              )
                          )),
                      Container(
                          width: 400,
                          height: 300,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.data.imageUrl[2])
                              )
                          )),
                    ]
                )
            )
          ),
          Text(widget.data.name),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < myInt; i++) Icon(Icons.star, size: 15),
            ],
          ),
          Text(widget.data.location),
          Text(widget.data.roomPrice),
          Text("Link Pemesanan"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < itemCount; i++) Column(
                children: [
                  Icon(Icons.star, size: 15),
                  Text(widget.data.facility[i]),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text("Halaman Website"),
          )
        ],
      ),

    );
  }
}
