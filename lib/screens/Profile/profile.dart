import 'package:flutter/material.dart';

import '../../utilis/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kcontentColor,
      appBar: AppBar( backgroundColor: kcontentColor,
        title: Center(child: Text('Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),)),
      ),

      body: 
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text("Account", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20)),
                  SizedBox(height: 16),
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300
                    ), child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300
                          ),
                          child: Center(
                            child: Icon(Icons.person, size: 32,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text("Login / Register", style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.w400, color: Colors.blue)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Settings", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20)),
                  SizedBox(height: 16),

                  Column(
                    children: [
                      _buildListTile('Apperence', Icons.dark_mode_outlined, 'Light', Colors.deepPurple,onTab: () {}),
                      SizedBox(height: 8),
                      SizedBox(height: 8),
                      _buildListTile('Language', Icons.language, 'English', Colors.orange,onTab: () {}),
                      SizedBox(height: 8),
                      _buildListTile('Notifications', Icons.notifications_outlined, '', Colors.blue, onTab: () {}),
                      SizedBox(height: 8),
                      _buildListTile('Help', Icons.help, '', Colors.green, onTab: () {}),
                      SizedBox(height: 8),
                      _buildListTile('Logout', Icons.exit_to_app, '', Colors.red, onTab: () {}),

                    ],
                  )




                ],
              ),
            ),
          ),


    );
  }
}


  Widget _buildListTile(String title, IconData icon, String trailing, Color color, {onTab}) {
    return Card(color: kcontentColor,
      child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withAlpha(30)
            ),
            child: Center(
              child: Icon(icon, color: color,),
            ),
          ),
          title: Text(title),
          trailing: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(trailing, style: TextStyle(color: Colors.grey.shade600)),
                Icon(Icons.arrow_forward_ios, size: 16,),
              ],
            ),
          ),
          onTap: onTab
      ),
    );
  }
/*

SizedBox(height: 8),
GestureDetector(onTap: (){},
child: Card(
child: ListTile(leading: Icon(
Icons.dark_mode_outlined, color: Colors.deepPurple,),
title: Text('Apperence',), trailing: Text('Light >' ),),
),
),

GestureDetector(onTap: (){},
child: Card(
child: ListTile(leading: Icon(
Icons.language_outlined, color: Colors.orange,),
title: Text('Language',), trailing: Container(decoration: BoxDecoration(T),
child: Icon(Icons.arrow_forward_ios, size: 16,), )),),
),

GestureDetector(onTap: (){},
child: Card(
child: ListTile(leading: Icon(
Icons.notifications_outlined, color: Colors.blue,),
title: Text('Notification',), trailing: Icon(Icons.arrow_forward_ios, size: 16,),),
),
),

GestureDetector(onTap: (){},
child: Card(
child: ListTile(leading: Icon(
Icons.help_center_outlined, color: Colors.green,),
title: Text('Help',), trailing: Icon(Icons.arrow_forward_ios, size: 16,),),
),
),

GestureDetector(onTap: (){},
child: Card(
child: ListTile(
leading: Icon(Icons.exit_to_app, color: Colors.redAccent,),
title: Text('Log Out',),trailing: Icon(Icons.arrow_forward_ios, size: 16,),),
),
),*/
