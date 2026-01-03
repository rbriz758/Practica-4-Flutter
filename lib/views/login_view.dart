import 'package:flutter/material.dart';
import 'package:isaacperezmascaro_rodrigobrizramos_p3/l10n/gen/app_localizations.dart';
import '../main.dart';
import 'main_view.dart';
import 'registration_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _username;
  String? _password;

  void _login() {
    // Aquí iría la lógica de autenticación real
    // Por ahora, simplemente navegamos a la vista principal
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainView()),
    );
  }

  void _submitLogin() {
    final isValid = _loginFormKey.currentState?.validate() ?? false;
    if (!isValid) return;
    _loginFormKey.currentState!.save();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Accediendo...')),
    );
    _login();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text(
            l10n?.appTitle ?? 'Inicio de Sesión',
            style: const TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: l10n?.loginTabSignIn ?? 'Iniciar sesión'),
              Tab(text: l10n?.registerTitle ?? 'Crear cuenta'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: l10n?.loginUsernameLabel ?? 'Usuario',
                          labelStyle: const TextStyle(color: Colors.white70),
                          hintText: l10n?.loginUsernameHint ?? 'Introduce tu usuario',
                          hintStyle: const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.person, color: Colors.white70),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Introduce tu usuario';
                          }
                          return null;
                        },
                        onSaved: (value) => _username = value?.trim(),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: l10n?.loginPasswordLabel ?? 'Contraseña',
                          labelStyle: const TextStyle(color: Colors.white70),
                          hintText: l10n?.loginPasswordHint ?? 'Introduce tu contraseña',
                          hintStyle: const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Introduce tu contraseña';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 4,
                          ),
                          onPressed: _submitLogin,
                          child: Text(
                            l10n?.loginButton ?? 'Entrar',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: RegistrationForm(
                onLocaleChanged: (locale) => MyApp.of(context)?.setLocale(locale),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
