import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_traveleasy/page/rating_gambar.dart';
import 'package:uas_traveleasy/page/wishlist_prov.dart';
import 'wishlist_item.dart'; // Import WishlistItem or the appropriate class

class Tempat extends StatelessWidget {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = alam2[index];
          return SizedBox(
            width: 225,
            child: Card(
              elevation: 0.4,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(item.nama),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Image.asset(item.image),
                              Text('Lokasi: ${item.lokasi}'),
                              Text('Deskripsi: ${item.deskripsi}'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              size: 20,
              color: Colors.pink,
            ),
          ),
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        item.image,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: 190,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            item.nama,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            item.lokasi,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
        itemCount: alam2.length,
      ),
    );
  }
  
  void setState(Null Function() param0) {
    isBookmarked = true;
  }
}


class Tempat2 extends StatelessWidget {
  const Tempat2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, //ukuran box atas
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // Mengganti 'Lokasi2' dengan 'alam1'
          final item = alam1[index];
          return SizedBox(
            width: 255, //nganan
            child: Card(
              elevation: 0.4,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        item.image,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: 190, //boxfit
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(
                            item.nama,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(), //spasi bintang
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 12,
                          ),
                          Text(
                            item.rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            item.lokasi,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                              child: Icon(
                                Icons.bookmark,
                                color: Colors.grey,
                                size: 14,
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
        itemCount: alam1.length, // Ubah sesuai dengan jumlah item yang Anda inginkan
      ),
    );
  }
}
