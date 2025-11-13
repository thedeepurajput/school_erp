import 'package:flutter/material.dart';
import 'package:school_erp/auth/teacher_auth.dart';

import '../student/student_navigation.dart';


class StudentAuth extends StatefulWidget {
  const StudentAuth({super.key});

  @override
  State<StudentAuth> createState() => _StudentAuthState();
}
class _StudentAuthState extends State<StudentAuth> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool obscuredPassword = false;
  bool isLoading = false;

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (formkey.currentState!.validate()) {
      setState(() => isLoading = true);

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() => isLoading = false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1a237e),
              const Color(0xFF0d47a1),
              const Color(0xFF1565c0),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 24.0 : 48.0,
                  vertical: 24.0,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Card(
                    elevation: 12,
                    shadowColor: Colors.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:
                      EdgeInsets.all(40.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Logo Section
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1a237e).withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.school_rounded,
                                  size: 48,
                                  color: Color(0xFF1a237e),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Title
                              const Text(
                                'School ERP',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1a237e),
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Student Portal',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),

                              // Username Field
                              TextFormField(
                                controller: userName,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                  prefixIcon: const Icon(Icons.person_outline),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username is required';
                                  } else if (value.length < 3) {
                                    return 'Username must be at least 3 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              // Password Field
                              TextFormField(
                                controller: password,
                                obscureText: obscuredPassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscuredPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscuredPassword = !obscuredPassword;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color(0xFF1a237e),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Login Button
                              SizedBox(
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: isLoading ? null : submit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1a237e),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    disabledBackgroundColor:
                                    const Color(0xFF1a237e).withOpacity(0.6),
                                  ),
                                  child: isLoading
                                      ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                      : const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Divider
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.grey[300])),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Divider(color: Colors.grey[300])),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Teacher Login Button
                              OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                          TeacherAuth(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF1a237e),
                                  side: const BorderSide(
                                    color: Color(0xFF1a237e),
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                icon: const Icon(Icons.person_outline),
                                label: const Text(
                                  'Teacher Portal',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}