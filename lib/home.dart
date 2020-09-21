import 'package:flutter/material.dart';
import 'package:quizpic_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;


  List questionBank = [
   Question.name("Roger Federer has won the most Wimbledon titles of any player", true),
    Question.name("The Channel Tunnel is the longest rail tunnel in the world", false),
    Question.name("Stephen Hawking declined a knighthood from the Queen", false),
    Question.name("Japan and Russia did not sign a peace treaty after World War Two so are technically still at war", true),
    Question.name("Michael Keaton’s real name is Michael Douglas", false),
    Question.name("Donald Duck’s middle name is Fauntelroy", true),
    Question.name("The Great Wall of China is visible from space", false),
    Question.name("An octopus has five hearts", true),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Testing"),
        centerTitle:true ,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      //we used a builder to build a context
      body: Builder(
        builder:(BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/pngbarn.png",
                width: 250,
                    height: 250,),
              ),
              SizedBox(
                width: 15.0,
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid
                    ),
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white60,
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  RaisedButton(
                      onPressed: () => prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_back,color: Colors.white,)
                  ),

                  RaisedButton(onPressed: () => _checkAnswer(true,context),
                  color: Colors.blueGrey.shade900,
                  child: Text('True',style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: () => _checkAnswer(false,context),
                    color: Colors.blueGrey.shade900,
                    child: Text('False',style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: () => nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward,color: Colors.white,),),


                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
  _checkAnswer(bool userChoice,BuildContext context){
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content:Text("correct"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();

      //correct answer
      debugPrint("Yes");
      setState(() {
        _currentQuestionIndex++;
      });
    }else{
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content:Text("Incorrect"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("No wrong");
    }
  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }

  nextQuestion() {
_updateQuestion();
  }

  prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;

    });

  }
}
