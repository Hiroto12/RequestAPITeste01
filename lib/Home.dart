import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  
  

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "Descobrir o nivel do Invocador";
  String key = 'RGAPI-98004969-e0cf-4340-bfcd-5be50f09202b';

  String name = "colocar nome";


  _recuperarCp(String nome) async
  {

    String cep = '01001000';
    String url = 'https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/${nome}?api_key=RGAPI-98004969-e0cf-4340-bfcd-5be50f09202b';
    http.Response response;

    response  =  await http.get(url);
    json.decode(response.body);

    Map<String, dynamic> retorno = json.decode(response.body);
     int level = retorno["summonerLevel"];


    setState(() {
      _resultado = "Seu level eh: ${level}";
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HI.GG"),
        backgroundColor: Colors.black,
      ),
        body: Column(
          children: <Widget>[

            Padding(
                padding: EdgeInsets.all(32),

                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Digite o nome do Invocador",
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.green
                  ),
                  onChanged: (String texto){
                      _recuperarCp(texto);
                  },
                ),

                  ),
          Text(
                  _resultado,
                  textAlign: TextAlign.justify,
                  style:  TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black

          )
          )
                ],

        ),


      );
  }
}
