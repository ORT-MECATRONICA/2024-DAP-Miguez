


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {

    TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
String user = "FeliM";
String pass = "LucasZ";

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'User',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: (){
                  if(userController.text == user && passController.text == pass){
                    context.go('/home/${userController.text}');
                  }
                  else if(userController.text == '' && passController.text == ''){
                    print('Empty user and password');
                  }
                  else if(userController.text == ''){
                    print('Empty user');
                  }
                  else if(passController.text == ''){
                    print('Empty password');
                  }
                  else if(userController.text != user){
                    print('Incorrect user');
                  }
                  else if(passController.text != pass){
                    print('Incorrect password');
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}