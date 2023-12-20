import 'package:flutter/material.dart';
import 'package:uas_traveleasy/resources/large_text.dart';
import 'package:uas_traveleasy/isigunung.dart/rinjani.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({Key? key}) : super(key: key);

  @override
  _SearchFilterPageState createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  final TextEditingController _searchController = TextEditingController();
  List<TravelDestination> allDestinations = [
    TravelDestination(
      name: 'Gunung Rinjani',
      description: 'The second-highest volcano in Indonesia located in Lombok.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Gunung Merbabu',
      description: 'The second-highest volcano in Indonesia located in Lombok.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Gunung Lawu',
      description: 'The second-highest volcano in Indonesia located in Lombok.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Gunung Jayawijaya',
      description: 'The second-highest volcano in Indonesia located in Lombok.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Gunung Tangkuban Perahu',
      description: 'The second-highest volcano in Indonesia located in Lombok.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Danau Toba',
      description:
          'The largest volcanic lake in the world, located in Sumatra.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Danau Kelimutu',
      description:
          'The largest volcanic lake in the world, located in Sumatra.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Danau Sentani',
      description:
          'The largest volcanic lake in the world, located in Sumatra.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Danau Labuan Cermin',
      description:
          'The largest volcanic lake in the world, located in Sumatra.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Danau Segara Anak',
      description:
          'The largest volcanic lake in the world, located in Sumatra.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Goa Jomblang',
      description: 'Famous cave located in Yogyakarta with a heavenly light.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Air Terjun Tumpak Sewu',
      description:
          'Spectacular waterfall in East Java, often called "The Niagara of Indonesia."',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Candi Borobudur',
      description:
          'One of the largest Buddhist temples in the world, located in Central Java.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Pantai Kuta',
      description:
          'Famous beach in Bali known for its white sand and surfing spots.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
    TravelDestination(
      name: 'Bukit Teletubbies',
      description:
          'A scenic hill in Bromo with a landscape reminiscent of Teletubbies.',
      imagePath: 'assets/gunung_rinjani.jpg',
    ),
  ];

  List<TravelDestination> displayedDestinations = [];

  @override
  void initState() {
    super.initState();
    displayedDestinations = List.from(allDestinations);
  }

  void filterDestinations(String query) {
    setState(() {
      displayedDestinations = allDestinations
          .where((destination) =>
              destination.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onDestinationTapped(TravelDestination destination) {
    if (destination.name == 'Gunung Rinjani') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RinjaniPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search and Filter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                controller: _searchController,
                onChanged: filterDestinations,
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Type to search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Text(
              'Travel Destinations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayedDestinations.length,
                itemBuilder: (BuildContext context, int index) {
                  return TravelDestinationCard(
                    destination: displayedDestinations[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class TravelDestination {
  final String name;
  final String description;
  final String imagePath; // Add this line

  TravelDestination({
    required this.name,
    required this.description,
    required this.imagePath, // Add this line
  });
}

class TravelDestinationCard extends StatelessWidget {
  final TravelDestination destination;

  TravelDestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        onTap: () {
          onDestinationTapped(context, destination);
        },
        leading: Image.asset(
          destination.imagePath,
          width: 50,
          height: 50,
        ),
        title: Text(destination.name),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(destination.description),
        ),
      ),
    );
  }
}

void onDestinationTapped(BuildContext context, TravelDestination destination) {
  if (destination.name == 'Gunung Rinjani') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RinjaniPage()),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SearchFilterPage(),
    ),
  );
}
