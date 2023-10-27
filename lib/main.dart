import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}

  class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Login Page'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'img/welcome.gif',
            width: 300.0, 
            height: 300.0,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
  padding:
    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (emailController.text == "oktavi1310@gmail.com" &&
                            passwordController.text == "21670024") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      email: emailController.text,
                    ),
                    ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid Credentials'),
                    ),
                  );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill input')),
              );
            }
          },
          
        child: 
        const Text('Login',),

      ),
    ),
),

            ],
          ),
        ),
      ),
        ],
    ),
    ),
    );
  }
  }


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Text(email),
            Image.network(
            'img/balonn.gif',
            width: 400.0, 
            height: 500.0,
          ),
          
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                
                child: const Text("Go back!"),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Okta Vian Agesti"),
            accountEmail: Text("oktavi1310@gmail.com"),
            currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage("img/okta.jpeg"),
                ),
                ),
            decoration: BoxDecoration(color: Colors.purpleAccent),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              "Calender",
              style: TextStyle(color: Colors.black),
            ),   
            
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Setting",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
  leading: Icon(Icons.account_box),
  title: Text(
    "Profil",
    style: TextStyle(color: Colors.black),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen(),
      ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Aplikasi Profil"),
            backgroundColor: Colors.purple,
          ),
          
          body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('img/okta.jpeg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Okta Vian Agesti', Icons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '082338903121', Icons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Jepara, Jawa Tengah', Icons.location_on),
            const SizedBox(height: 10),
            itemProfile('Email', 'oktavi1310@gmail.com', Icons.mail),
          ],
        ),
      ),
    ));
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 157, 247),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Color.fromARGB(255, 244, 182, 255),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}