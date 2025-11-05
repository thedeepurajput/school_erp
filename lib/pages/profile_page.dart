import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Avatar Section
              CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
              const SizedBox(height: 20),

              // User Info
              Text(
                'Deepu Singh',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'deepanshusingh@seemarise.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),

              // Profile Details Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileField('Employee ID', 'EMP001'),
                      _buildProfileField('Department', 'Engineering'),
                      _buildProfileField('Position', 'Senior Developer'),
                      _buildProfileField('Phone', '+91 9876543210'),
                      _buildProfileField('Joining Date', '01-Jan-2023'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TeacherAuth()));
                      }, style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)

                        )
                    ),
                      child: Text('Logout'),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}
