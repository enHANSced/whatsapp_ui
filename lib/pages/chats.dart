import 'dart:math';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  Chats({super.key});

  final Map<String, String> chats = {
    'Liara T\'soni':
        "Shepard, still calibrating those morals?  Just kidding, how's the spacefaring life treating you?",
    'Garrus Vakkarian': "Shepard. (That's all I need to say, right?)",
    'Commander Shepard':
        "Busy saving the galaxy as usual. Anyone up for some calibrations tonight?",
    'Tali\'Zorah':
        "Normandy's purring like a kitten... well, a giant metal space kitten. Need a hand with your calibrations, Commander?",
    'Miranda Lawson':
        "Shepard. Cerberus needs you. Again. But hey, at least the pay's good this time... maybe.",
    'Javik':
        "Shepard. Information awaits. Though frankly, your species' dramas bore me.",
    'Thane':
        "Shepard. A shadow requires your guidance. This mission... it weighs heavy.",
    'Ashley Williams':
        "Shepard! Found something weird. Pretty sure it's not another Prothean cipher this time... maybe.",
    'Wrex':
        "Shepard! Grunt got stuck in the ventilation shaft again. Need your muscle (and patience) to get him out.",
    'Mordin':
        "Shepard. Urgent scientific inquiry. Requires immediate attention. (Just kidding, mostly)",
    'Joker':
        "Shepard, got a prank planned that needs your... approval? More like needs you to take the blame if it goes south. Ha!",
    'EDI':
        "Shepard. Efficiency report indicates crew morale at 78%. Recommend implementing humor subroutine or shore leave. Directive unclear. Please advise.",
  };

  final List<String> profiles = [
    'https://static.wikia.nocookie.net/masseffect/images/c/cd/ME_liara_charshot.png/revision/latest/scale-to-width-down/1000?cb=20210620063412',
    'https://static.wikia.nocookie.net/masseffect/images/5/5e/Garrus_ME2_Character_Shot.png/revision/latest/scale-to-width-down/150?cb=20100320090146',
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
    'https://www.giantbomb.com/a/uploads/scale_small/3/32621/1258281-tali_zorah_nar_rayya_mass_effect_2_screenshot_character.jpg',
    'https://i.pinimg.com/736x/48/38/80/483880cc23acbc8e2ef007728bf1df54.jpg',
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
    'https://static.wikia.nocookie.net/masseffect/images/a/af/Thane_Character_Shot.png/revision/latest/scale-to-width-down/150?cb=20100327034252',
    'https://static.wikia.nocookie.net/masseffect/images/a/a2/Ashley_ME3_Character_Shot.png/revision/latest?cb=20120327175353',
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
    'https://static.wikia.nocookie.net/masseffect/images/1/1a/Mordin_Character_Shot.png/revision/latest/scale-to-width-down/150?cb=20100419164012',
    'https://static.wikia.nocookie.net/masseffect/images/e/eb/Joker_ME2_Character_Shot.png/revision/latest/scale-to-width-down/150?cb=20100425171350',
    'https://static.wikia.nocookie.net/masseffect/images/f/f1/EDI_ME3_Character_Shot.png/revision/latest/scale-to-width-down/150?cb=20120321220133',
  ];

  String randomTime() {
    final random = Random();
    final hours = random.nextInt(24); // Genera un número aleatorio entre 0 y 23
    final minutes =
        random.nextInt(60); // Genera un número aleatorio entre 0 y 59
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  bool messageReadStatus(int index) {
    return Random().nextBool();  // True or false
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          String character = chats.keys.elementAt(index);
          String message = chats.values.elementAt(index);
          return ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$character: ',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: message,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                duration: const Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.greenAccent[100],
                elevation: 5,
                dismissDirection: DismissDirection.horizontal,
              ));
            },
            leading: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(profiles[index]),
                            radius: 80.0,
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(height: 10),
                          Text(chats.keys.elementAt(index),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0)),
                          const SizedBox(height: 20),
                          ListTile(
                            leading: const Icon(Icons.chat),
                            title: const Text('Send message'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.info),
                            title: const Text('View profile'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(profiles[index]),
                radius: 30.0,
                backgroundColor: Colors.transparent,
              ),
            ),
            title: Text(character,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0)),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.done_all,
                    size: 18.0,
                    color:
                        messageReadStatus(index) ? Colors.blue : Colors.grey),
                const SizedBox(width: 4.0),
                Expanded(
                    child: Text(message,
                        style: const TextStyle(fontSize: 18.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1)),
              ],
            ),
            trailing: Text(randomTime(),
                style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
            contentPadding: const EdgeInsets.all(10.0),
          );
        },
        itemCount: chats.length);
  }
}
