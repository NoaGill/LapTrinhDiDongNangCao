import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {

  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _nationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Your Infomaiton"),),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text('User Information',style: TextStyle(fontSize: 32,
                 fontWeight: FontWeight.bold,
                 color: Colors.blue),
                 ),
                
              ),TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _birthdayController,
                decoration: const InputDecoration(
                  labelText: "Birthday",
                ),
              ),
              const SizedBox(height: 16,)
              ,TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Gender",
                ),
              ),
              const SizedBox(height: 16,)
              ,TextFormField(
                controller: _nationController,
                decoration: const InputDecoration(
                  labelText: "Nation",
                ),
              ),
              const SizedBox(height: 16,)
              ,TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: 16,)
              ,TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 16,),
              Expanded(child: OutlinedButton(onPressed: (){},
              child: const Text('Save'),))
            ],
          ),
        ),
      ),
      ),
    );
  }
}