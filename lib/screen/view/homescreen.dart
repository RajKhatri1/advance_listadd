import 'package:advance_listadd/screen/modal/modalpage.dart';
import 'package:advance_listadd/screen/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController txtid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  TextEditingController xtxtid = TextEditingController();
  TextEditingController xtxtname = TextEditingController();
  TextEditingController xtxtstd = TextEditingController();
  Homeprovider? homeprovider;

  @override
  Widget build(BuildContext context) {
    homeprovider = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("MY APP"),
        ),
        body: Consumer<Homeprovider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: homeprovider!.l1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    leading: Text("${homeprovider!.l1[index].id}"),
                    title: Text("${homeprovider!.l1[index].name}"),
                    subtitle: Text("${homeprovider!.l1[index].std}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            homeprovider!.delete(index);
                          },
                          icon: Icon(Icons.delete,color: Colors.red),
                        ),
                        IconButton(
                            onPressed: () {
                              xtxtid = TextEditingController(
                                  text: homeprovider!.l1[index].id);
                              xtxtname = TextEditingController(
                                  text: homeprovider!.l1[index].name);
                              xtxtstd = TextEditingController(
                                  text: homeprovider!.l1[index].std);

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.5))),
                                        controller: xtxtid,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.5))),
                                        controller: xtxtname,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.5))),
                                        controller: xtxtstd,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(onPressed: () {
                                        homemodel m1 = homemodel(id: xtxtid.text,name: xtxtname.text,std: xtxtstd.text);
                                        homeprovider!.editData(index,m1);
                                        Navigator.pop(context);
                                      }, child: Text("update"))
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: txtid,
                      decoration: InputDecoration(hintText: "enter your ID"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtname,
                      decoration: InputDecoration(hintText: "enter your name"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtstd,
                      decoration:
                          InputDecoration(hintText: "enter your Standerd"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          homemodel h1 = homemodel(
                              id: txtid.text,
                              name: txtname.text,
                              std: txtstd.text);
                          homeprovider!.add(h1);
                          Navigator.pop(context);
                        },
                        child: Text("ADD"))
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
