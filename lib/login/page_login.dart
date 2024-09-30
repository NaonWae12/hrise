// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:hrise/component/colors.dart';
import 'package:hrise/component/text_style.dart';
import 'package:hrise/component/textfield_input.dart';
import 'package:hrise/component/textfield_pw.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bottom_navbar.dart';
import '../data_api/api_login.dart';
import 'error_dialog.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  late String currentTime;
  late String currentDate;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _databaseController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateTimeAndDate();
  }

  void _updateTimeAndDate() {
    final now = DateTime.now();
    currentTime = DateFormat('hh:mm a').format(now);
    currentDate = DateFormat('MMM dd, yyyy - EEEE').format(now);
  }

  Future<void> _login() async {
    // Validasi input sebelum mengirim request
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
        ErrorDialog.showErrorDialog(
            context, 'Login Gagal', 'Email dan Password harus diisi.');
      } else if (_emailController.text.isEmpty) {
        ErrorDialog.showErrorDialog(
            context, 'Login Gagal', 'Email harus diisi.');
      } else if (_passwordController.text.isEmpty) {
        ErrorDialog.showErrorDialog(
            context, 'Login Gagal', 'Password harus diisi.');
      }
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final body = {
      'db': _databaseController.text,
      'login': _emailController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(ApiLogin.loginEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiLogin.apiKey}',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Handle successful login
        print('Login successful: ${responseData['message']}');

        // Navigasi ke halaman HomePage setelah login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()),
        );
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        ErrorDialog.showErrorDialog(
          context,
          'Login Gagal',
          responseData['message'] ?? 'Email atau password tidak terdaftar.',
        );
      } else {
        ErrorDialog.showErrorDialog(
          context,
          'Login Gagal',
          'Terjadi kesalahan saat mencoba login. Silakan coba lagi.',
        );
      }
    } catch (error) {
      ErrorDialog.showErrorDialog(
        context,
        'Error',
        'Terjadi kesalahan jaringan. Pastikan Anda terhubung ke internet.',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('background.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                  child: Text(currentTime, style: AppTextStyles.displayText)),
              Center(child: Text(currentDate, style: AppTextStyles.heading4)),
              const SizedBox(height: 50),
              Text('URL', style: AppTextStyles.heading4_1),
              TextfieldInput(
                  controller: _databaseController,
                  hintText: 'https://hr.simise.id'),
              const SizedBox(height: 15),
              Text('Email', style: AppTextStyles.heading4_1),
              TextfieldInput(
                controller: _emailController,
                hintText: 'alamat email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Text('Password', style: AppTextStyles.heading4_1),
              TextfileldPw(
                controller: _passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              const SizedBox(height: 40),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: _login,
                        child: Text(
                          'Login',
                          style: AppTextStyles.heading1_1,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
