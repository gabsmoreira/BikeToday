<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="img/002-bicycle-3.png">
        <title>Vale a pena andar de bike?</title>
  </head>

  <body>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>


    <nav>
        <div class="nav-wrapper  green accent-4">
            <a href="#" class="brand-logo"><i class="large material-icons">directions_bike</i></a>
        </div>
    </nav>

    <br>

    <div class="container login">
        <div class="row">
            <div class="col s12 m2 l2"><p></p></div>
            <div class="col s12 m8 l8 z-depth-3">
                    <form action="efetuaRegistro" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <input id="icon_prefix" type="email" class="validate" name="email">
                            <label for="icon_prefix">Email</label>
                            </div>
                            
                            <div class="input-field col s12">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="icon_prefix" type="text" class="validate" name="username">
                                <label for="icon_prefix">Usuário</label>
                            </div>

                            <div class="input-field col s12">
                                    <i class="material-icons prefix">lock</i>
                                    <input id="icon_telephone" type="password" class="validate" name="password">
                                    <label for="icon_telephone">Senha</label>                            
                            </div>
                            <div class="input-field col s12">
                                <i class="material-icons prefix">image</i>
                                <input id="icon_telephone" type="file" class="validate" name="image">
                            </div>

                                <div class="buttons-container center-align" style="margin-top:3%;">
                                <button class="btn waves-effect waves-light green accent-3" type="submit" >Registrar
                                        <i class="material-icons right"></i>
                                </button>
                                <a class="waves-effect waves-light btn green accent-3" href="login" style="margin-left:5%;">Login</a>
                                </button>
                                </div>
                        </div>
                        
                    </form>
                

            </div>
            <div class="col s12 m2 l2"><p></p></div>
        </div>
    </div>



  </body>
</html>