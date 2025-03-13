
import 'package:book_app/core/functions/launch_custom_url.dart';
import 'package:book_app/ui/home/data/model/book_model.dart';
import 'package:flutter/material.dart';

class MainDetails extends StatelessWidget{
  const MainDetails({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          bookModel.volumeInfo.imageLinks!.thumbnail,
          height: 240,
          width: 160,
          fit: BoxFit.fill,
        ),
        const SizedBox(height:30),
        SizedBox(
          width: double.infinity, // Make it take full width
          child: Text(
            bookModel.volumeInfo.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center the text inside the box
          ),
        ),
        Text(
            bookModel.volumeInfo.authors.first,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70)
        ),
        const SizedBox(height:15),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star,color: Colors.yellow,size: 20),
            const SizedBox(width:4),
            Text(bookModel.volumeInfo.averageRating.toString()),
            const SizedBox(width:4),
            Text(
                "(${bookModel.volumeInfo.ratingsCount.toString()})",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white70)
            )
          ],
        ),

        const SizedBox(height:30),

        Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            border: Border.all(color: Colors.transparent),
          ),
          child: Row(
            children: [
              // Left Side (Price)
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 50, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // Left side color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      bookModel.saleInfo.listPrice != null
                          ? "${bookModel.saleInfo.listPrice!.amount} ${bookModel.saleInfo.listPrice!.currencyCode ?? ''}"
                          : "Free",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ),
                ),
              ),
              // Right Side (Free Preview)
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent, // Right side color
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => launchCustomUrl(context, bookModel.volumeInfo.previewLink),
                      child: Text(
                        getText(bookModel),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink.isEmpty) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }

}