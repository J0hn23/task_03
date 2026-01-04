import 'package:flutter/material.dart';
import 'package:photo_viewer/main.dart' show wellcomeMessage;
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Saca mensaje de bienvenida global
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      wellcomeMessage.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Bienvenido a esta app de visualización de fotos!'),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  var contadorCartas = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 03 Photo Viewer', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 128, 27, 40),
      ),
      body: Container(
        color: const Color.fromARGB(255, 206, 156, 156),
        child: Column(  
         
          children: [
             
            Expanded(
              
              flex: 3,
              child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
                child: CardSwiper(
                  cardsCount: contadorCartas,
                  cardBuilder: cardBuilder,
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                      'https://picsum.photos/400/600?random=$index',
                      fit: BoxFit.cover,
                  ),
              );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? cardBuilder(
    BuildContext context,
    int index,
    int horizontalOffsetPercentage,
    int verticalOffsetPercentage,
  ) {
    return 
      ClipRRect(
      borderRadius: BorderRadius.circular(16),  
      child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://picsum.photos/400/600?random=$index',
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}
