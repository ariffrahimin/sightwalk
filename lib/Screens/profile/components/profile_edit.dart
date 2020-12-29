import 'package:flutter/material.dart';
import 'package:sightwalk/screens/profile/components/body.dart';

class Edit extends StatelessWidget {
  final String name;
  final String age;
  final String phoneNo;
  Edit({Key key, @required this.name, this.age, this.phoneNo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
            child: Column(
//---------------------------------------------Name INPUT---------------------------------------------------------------------------------------
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: name,
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
//----------------------------------------------------------AGE INPUT------------------------------------------------------------------------
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          age,
                          //age,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
//-------------------------------------------------------------Phone No INPUT--------------------------------------------------------------------
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          phoneNo,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Expanded(
//-------------------------------------------------------------SAVE BUTTON code-----------------------------------------------------------------
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: new InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Body();
                          },
                        ));
                      },
                      child: Container(
                        height: 70,
                        width: 200,
                        child: Align(
                          child: Text(
                            'Save',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
