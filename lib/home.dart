import 'package:flutter/material.dart';
import 'package:translation_new/component.dart';
import 'package:translator/translator.dart';

bool isLoad = false;
bool isState = false;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final translator = GoogleTranslator();

  getHeadingTranslate() async {
    for (var i = 0; i < heading.length; i++) {
      var colors = await translator.translate(heading[i], from: 'en', to: 'ta');
      setState(() {
        headingTamil.add(colors.text);
        print(headingTamil);
        // isLoad = true;
      });
    }
  }

  getAnimalTranslate() async {
    for (var i = 0; i < animalsName.length; i++) {
      var colors =
          await translator.translate(animalsName[i], from: 'en', to: 'ta');
      setState(() {
        animalsTamil.add(colors.text);
        print(animalsTamil);
        // isLoad = true;
      });
    }
  }

  getPetTranslate() async {
    for (var i = 0; i < petsName.length; i++) {
      var colors =
          await translator.translate(petsName[i], from: 'en', to: 'ta');
      setState(() {
        petTamil.add(colors.text);
        print(petTamil);
        isState = true;
        // isLoad = true;
      });
    }

    setState(() {
      isState = false;
    });
  }

  getColorTranslate() async {
    for (var i = 0; i < colorName.length; i++) {
      var colors =
          await translator.translate(colorName[i], from: 'en', to: 'ta');
      setState(() {
        colorTamil.add(colors.text);
        print(colorTamil);
        // isLoad = true;
      });
    }

    // for (var i = 0; i < pets.length; i++) {
    //   var petState =
    //       await translator.translate(petsName[i], from: 'en', to: 'ta');
    //   var colorState =
    //       await translator.translate(colorName[i], from: 'en', to: 'ta');
    //   var animalState =
    //       await translator.translate(animalsName[i], from: 'en', to: 'ta');

    //   setState(() {
    //     petsName[i] = petState.text;
    //     colorName[i] = colorState.text;
    //     animalsName[i] = animalState.text;
    //   });
    // }
    // setState(() {
    //   isLoad = false;
    // });
    // bool value = true;
    // print(value);
    // for (var i = 0; i < 10; i++) {
    //   value = !value;
    //   print(value);
    // }
    // value = true;
    // print(value);
  }

  @override
  void initState() {
    getColorTranslate();
    getAnimalTranslate();
    getHeadingTranslate();
    getPetTranslate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/27/4c/3a/274c3ad7626992dde987d15a8a84064d.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'One Former',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.cloud_circle,
              size: 35,
            ),
          )
        ],
      ),
      body: Home(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            setState(() {
              isLoad = !isLoad;
            });
          },
          child: isState == false
              ? Icon(
                  Icons.translate,
                  color: Colors.black,
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                )),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            minLeadingWidth: 15,
            leading: Icon(
              Icons.location_searching,
              color: Colors.black,
            ),
            title: Text(
              isLoad == false ? heading[0] : headingTamil[0],
              style: kStyle,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.yellow,
              ),
              title: Text(
                isLoad == false ? heading[1] : headingTamil[1],
                style: kStyle,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            isLoad == false ? heading[3] : headingTamil[3],
            style: kStyle,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) => Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: list[index],
                          image:
                              DecorationImage(image: NetworkImage(pets[index])),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            isLoad == false
                                ? petsName[index].toString().toUpperCase()
                                : petTamil[index].toString().toUpperCase(),
                            style: kStyle,
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            isLoad == false ? heading[2] : headingTamil[2],
            style: kStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) => Container(
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(animals[index])),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            isLoad == false
                                ? animalsName[index].toString().toUpperCase()
                                : animalsTamil[index].toString().toUpperCase(),
                            style: kStyle,
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            isLoad == false ? heading[4] : headingTamil[4],
            style: kStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) => Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: list[index],
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            isLoad == false
                                ? colorName[index]
                                : colorTamil[index],
                            style: kStyle,
                          ),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
