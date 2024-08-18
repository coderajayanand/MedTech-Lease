import 'package:flutter/material.dart';
import '../ApiServices/EquipmentsApisServices.dart';
import '../Classes/Equipment.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<Mainscreen> {
  late Future<List<Equipment>> futureEquipments;
  List<Equipment> cart = [];

  @override
  void initState() {
    super.initState();
    print("init state start");
    futureEquipments = EquipmentService().getAllEquipments();
    print("future equipments = " + futureEquipments.toString());
  }

  void addToCart(Equipment equipment) {
    setState(() {
      cart.add(equipment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Main Page'),
      ),
      body: FutureBuilder<List<Equipment>>(
        future: futureEquipments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No equipment available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Equipment equipment = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(equipment.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(equipment.name),
                    subtitle: Text('Rent: \$${equipment.rentingCost}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () => addToCart(equipment),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
