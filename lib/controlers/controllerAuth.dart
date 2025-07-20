
import '../elper/navigation.dart';
import '../models/modelUtilisateur.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/gestionPharmacie/adminPharmacie/AcceuilAdmin.dart';

class controllerAuth{
  var context;
  controllerAuth(this.context);
  authPhar(){
    navigation(context,pageAuthentificationPharma());
  }

  connecter(String login,String mot_de_passe)async{
    var val =await ModelUtilisateur.connecter(login, mot_de_passe);
    print(login);
    if(val[0]==true){
        navigation(context,pageAccueille());
    }else{
      navigation(context,pageAuthentificationPharma());
    }

    }

  deconnecter(){
    ModelUtilisateur.deconnection();
    navigation(context,pageAuthentificationPharma());
  }
  }


