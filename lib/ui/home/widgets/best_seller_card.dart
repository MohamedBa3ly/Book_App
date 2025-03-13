
import 'package:flutter/material.dart';

class BestSellerCard extends StatelessWidget{
  final String image;
  final String title;
  final String author;
  final String price;
  final String rating;
  final String download;
  final VoidCallback onTap; // Add onTap callback

  const BestSellerCard({super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.download, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 100, // Define height
              width: 80,   // Define width
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),


          const SizedBox(width: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                    title,maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white)
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white70)
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      price,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)
                  ),
                  const SizedBox(width:30),
                  Icon(Icons.star,color: Colors.yellow,size: 20),
                  Text(rating),
                  Text(
                      "($download)",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white70)

                  )

                ],
              )
            ],
          )
      
        ],
      ),
    );
  }

}