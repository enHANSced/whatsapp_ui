import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Status bar
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://static.wikia.nocookie.net/masseffect/images/5/58/N7_Logo.png/revision/latest/scale-to-width-down/150?cb=20120329033056'),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text('My Status', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Viewed updates
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Viewed updates', style: TextStyle(color: Colors.grey[700], fontSize: 20)),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  backgroundImage: NetworkImage('https://static.wikia.nocookie.net/masseffect/images/d/d7/Miranda_-_Citadel_meet_1.png/revision/latest/scale-to-width-down/1000?cb=20230715042359'),
                ),
                title: Text('Miranda Lawson', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text('7 minutes ago', style: TextStyle(fontSize: 18)),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  backgroundImage: NetworkImage('https://www.darkhorsedirect.com/cdn/shop/files/ME_FIGURE_GARRUS_DHD_PHOTO_DSP_2.png?v=1692117437&width=480'),
                  child: Icon(Icons.person),
                ),
                title: Text('Garrus Vakkarian', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text('20 minutes ago', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Muted updates', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ]),
          ),

          // Muted updates
        ],
      ),
    );
  }
}
