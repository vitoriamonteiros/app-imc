import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _inputAltura = TextEditingController(); //"final"selando o tipo do atributo definido
  final _inputPeso = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // criação de identificador unico para acessar (calcular)

  double _resultado = 0;
  String _label = '';
  Color _cor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: _cor,
        
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                   Text(
                'I. M. C.', 
                style: 
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35)),
              Text(
              'Índice de Massa Corporal',
              style: 
                TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 16),
              TextFormField(
                controller: _inputAltura,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Altura: ",
                  hintText: "Digite sua altura",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 150, 148, 148), fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Informe sua Altura';
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _inputPeso,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Peso: ",
                  hintText: "Digite o seu peso",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 150, 148, 148), fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),),
              ),
              validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Informe seu Peso';
                  }
                },
            ),
              SizedBox(height: 30),
              ElevatedButton(
               onPressed: (){ 
                if(_formKey.currentState?.validate() ?? false){
                  _resultado = double.parse(_inputPeso.text) /
                      (double.parse(_inputAltura.text) * double.parse(_inputAltura.text));

                  if (_resultado < 18.5){
                    _label= 'Magreza';
                    _cor = Colors.red;
                  } else if(_resultado >= 18.5 && _resultado <= 24.9){
                    _label= 'Normal';
                    _cor = Colors.green;
                  }else if(_resultado > 25.0 && _resultado <=29.9) {
                    _label= 'Sobrepeso';
                    _cor = const Color.fromARGB(255, 180, 180, 3);
                  }else if(_resultado > 30 && _resultado <=34.9) {
                    _label= 'Obesidade Grau I';
                    _cor = const Color.fromARGB(255, 240, 136, 8);
                  }else if(_resultado > 35 && _resultado <=39.9) {
                    _label= 'Obesidade Grau II';
                    _cor = const Color.fromARGB(255, 255, 89, 0);
                  }else {
                    _label= 'Obesidade Grau III';
                    _cor = Colors.red;
                  }
                  setState(() {
                    
                  });
                }

               },
               child: Text(
                'Calcular',
                style: TextStyle(color: Colors.black)
                
              ), 
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
              ),
             ),
              GestureDetector(
                onLongPress: (){
                  _cor = Colors.black;
                  _inputAltura.clear();
                  _inputPeso.clear();
                  _label ='';

                  setState(() { });
                },

                child: Text(
                  _label,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
                ],
              )
              
            )
             
          ],
        ),
      ),
    );
  }
}
