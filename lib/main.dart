import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Image(
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'MONDAY 16',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40.0,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const Text(
                        'TODAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '·',
                        style: TextStyle(
                          color: Colors.pink.shade400,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Date(
                        text: '17',
                      ),
                      const Date(
                        text: '18',
                      ),
                      const Date(
                        text: '19',
                      ),
                      const Date(
                        text: '20',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Card(
                  startHour: '11',
                  startMin: '30',
                  endHour: '12',
                  endMin: '20',
                  bgColor: Colors.yellow,
                  fistLine: 'DESIGN',
                  secondLine: 'METTING',
                  tags: [
                    {"name": 'ALEX', "isActive": false},
                    {"name": 'HELENA', "isActive": false},
                    {"name": 'NANA', "isActive": false},
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  startHour: '12',
                  startMin: '35',
                  endHour: '14',
                  endMin: '10',
                  bgColor: Colors.purple.shade200,
                  fistLine: 'DAILY',
                  secondLine: 'PROJECT',
                  tags: const [
                    {"name": 'ME', "isActive": true},
                    {"name": 'RECHARD', "isActive": false},
                    {"name": 'CITY', "isActive": false},
                    {"name": '+4', "isActive": false},
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                  startHour: '15',
                  startMin: '00',
                  endHour: '16',
                  endMin: '30',
                  bgColor: Color.fromARGB(255, 88, 252, 96),
                  fistLine: 'WEEKLY',
                  secondLine: 'PLANNING',
                  tags: [
                    {"name": 'DEN', "isActive": true},
                    {"name": 'NANA', "isActive": false},
                    {"name": 'MARK', "isActive": false},
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String startHour, startMin, endHour, endMin, fistLine, secondLine;
  final Color bgColor;
  final List<Map<String, dynamic>> tags;

  const Card({
    super.key,
    required this.startHour,
    required this.startMin,
    required this.endHour,
    required this.endMin,
    required this.bgColor,
    required this.fistLine,
    required this.secondLine,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  startHour,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  startMin,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  endHour,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  endMin,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fistLine,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(
                    0,
                    -10,
                  ),
                  child: Text(
                    secondLine,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: tags
                      .map((Map<String, dynamic> item) => Tag(
                            name: item['name'],
                            isActive: item['isActive'],
                          ))
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String name;
  final bool isActive;

  const Tag({
    super.key,
    required this.name,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class Date extends StatelessWidget {
  final String text;

  const Date({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
