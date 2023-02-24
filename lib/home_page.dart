import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color(0xFF212239),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Cards',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: orientation == Orientation.portrait
                    ? ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Center(
                            child: _CardItem(
                                color: Colors.primaries[
                                    index % Colors.primaries.length]),
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            ),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(

                              height: 160,
                              child: _CardItem(
                                  color: Colors.primaries[
                                      index % Colors.primaries.length]),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;

  const _CardItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(colors: [
              color.withOpacity(0.3),
              color,
            ])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('R\$ 15.988'),
              Spacer(),
              Text('4020 **** **** 2455'),
              Text('Lalli Bloom'),
            ],
          ),
        ),
      ),
    );
  }
}
