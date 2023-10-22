import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Переводчик нормальных слов в интересные',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Введите фразу для перетусовки букв Версия 1.1.0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textContr = TextEditingController();

  void _incrementCounter() {
    setState(() {
      String text = textEditingController.text;

      List<String> newList1 = [];

      List<String> list1 = text.split('.');
      for (var e1 in list1) {
        List<String> newList2 = [];

        List<String> list2 = e1.split(', ');
        for (var e2 in list2) {
          List<String> newList3 = [];

          List<String> list3 = e2.split('-');
          for (var e3 in list3) {
            List<String> newList4 = [];

            List<String> list4 = e3.split('(');
            for (var e4 in list4) {
              List<String> newList5 = [];

              List<String> list5 = e4.split(')');
              for (var e5 in list5) {
                List<String> newList6 = [];
                List<String> list6 = e5.split(' ');
                for (var e in list6) {
                  final length = e.characters.length;
                  if (length == 4) {
                    final f = e.characters.first;
                    final l = e.characters.last;
                    final two = e[1];
                    final three = e[2];
                    final combo = [f, three, two, l];
                    final join = combo.join('');
                    newList6.add(join);
                  } else if (length > 7) {
                    final f = e.substring(0, 2);
                    final l = e.substring(length - 2, length);
                    final sub = e.characters.join();
                    final d = sub.substring(2, length - 2).characters.toList();

                    d.shuffle();
                    List<String> newStr = [f];
                    newStr.addAll(d);
                    newStr.add(l);

                    newList6.add(newStr.join());
                  } else if (length > 4) {
                    final f = e.characters.first;
                    final l = e.characters.last;
                    final sub = e.characters.join();
                    final d = sub.substring(1, length - 1).characters.toList();

                    d.shuffle();
                    List<String> newStr = [f];
                    newStr.addAll(d);
                    newStr.add(l);

                    newList6.add(newStr.join());
                  } else {
                    newList6.add(e);
                  }
                }
                final text6 = newList6.join(' ');
                newList5.add(text6);
              }
              final text5 = newList5.join(')');
              newList4.add(text5);
            }
            final text4 = newList4.join('(');
            newList3.add(text4);
          }
          final text3 = newList3.join('-');
          newList2.add(text3);
        }
        final text2 = newList2.join(', ');
        newList1.add(text2);
      }
      textContr.text = newList1.join('.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          TextFormField(maxLines: null, controller: textEditingController),
          TextButton(onPressed: _incrementCounter, child: const Text('Перемешать буквы')),
          TextFormField(maxLines: null, controller: textContr),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
