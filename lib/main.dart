import 'package:flutter/material.dart';
import 'candidate_form.dart'; // Importation de la page du formulaire

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Candidate {
  final String name;
  final String description;
  final String party;
  final String imageUrl;

  Candidate({
    required this.name,
    required this.description,
    required this.party,
    required this.imageUrl,
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Candidate> candidates = [
    Candidate(
      name: 'Adewole Adebayo',
      description: 'Candidat sérieux et engagé pour l\'éducation',
      party: 'Parti de l\'éducation',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b0/ADEWOLE_ADEBAYO.jpg',
    ),
    Candidate(
      name: 'Atiku Abubakar',
      description: 'Expert en économie et innovation',
      party: 'Parti de l\'innovation',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/7/76/Atiku_Abubakar-2010_%28cropped%29.jpg',
    ),
    Candidate(
      name: 'Bola Ahmed Tinubu',
      description: 'Passionné par les questions environnementales',
      party: 'Parti vert',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Bola_Tinubu_portrait.jpg/800px-Bola_Tinubu_portrait.jpg',
    ),
    // Ajout de trois nouveaux candidats
    Candidate(
      name: 'Aminata Diop',
      description: 'Défenseure des droits des femmes',
      party: 'Parti de l\'égalité',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/08/Portrait_photograph_of_Aminata_Diouf.jpg',
    ),
    Candidate(
      name: 'Emmanuel Okoye',
      description: 'Promoteur de l\'entreprenariat des jeunes',
      party: 'Parti de la jeunesse',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/16/Emmanuel_Okoye.jpg',
    ),
    Candidate(
      name: 'Fatima Kamara',
      description: 'Défenseure de l\'environnement',
      party: 'Parti écologiste',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b9/Fatima_Kamara.jpg',
    ),
  ];

  void addCandidate(Candidate candidate) {
    setState(() {
      candidates.add(candidate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Elections'),
            SizedBox(width: 10),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Benin.svg/1280px-Flag_of_Benin.svg.png',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 5),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Benin.svg/1280px-Flag_of_Benin.svg.png',
              width: 20,
              height: 20,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200], // Fond gris clair
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CandidateForm(
                onCandidateAdded: addCandidate,
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 165, 234, 243),
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.white, // Fond blanc
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 70), // Espace au bas pour la barre de navigation
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    candidates[index].imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  candidates[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(candidates[index].description),
                    Text('Parti: ${candidates[index].party}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 123, 209, 235),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Action à effectuer lorsque l'icône de personne est cliquée
              },
              tooltip: 'Voir les candidats',
            ),
            IconButton(
              icon: Icon(Icons.how_to_vote),
              onPressed: () {
                // Action à effectuer lorsque l'icône de vote est cliquée
              },
              tooltip: 'Voter',
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Action à effectuer lorsque l'icône de paramètres est cliquée
              },
              tooltip: 'Paramètres',
            ),
          ],
        ),
      ),
    );
  }
}
