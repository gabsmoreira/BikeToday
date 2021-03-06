
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

  <head>
  
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

    

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="img/002-bicycle-3.png">
    
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        /* Optional: Makes the sample page fill the window. */
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
        }
      </style>
    <title>Vale a pena andar de bike?</title>

  

  <body>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    
    
    


    <nav>
        <div class="nav-wrapper  green accent-4">
            <a href="#" class="brand-logo"><i class="large material-icons">directions_bike</i></a>
            <ul id="nav-mobile" class="right" >
                <li ><a href="#" ><img src=getImage?login=${usuarioLogado} data-activates='dropdown1' style="height:45px; width:45px; margin-top:20%;" class="dropdown-button circle responsive-img"></a></li>
            </ul>
        </div>
    </nav>
    <br>    

    <div class="row center-align" style="height:70%;">
        <div class="col s12 m5 l3 ">
            <form>
            <div class="nav-container center-align">
                    <nav>
                        <div class="nav-wrapper grey lighten-2">
                            <div class="input-field">
                                <input id="start" type="search"required>
                                <label class="label-icon" for="search"><i class="material-icons">location_on</i></label>
                            </div>
                        </div>
                    </nav>
            </div>
                    <br>
                    <nav>
                        <div class="nav-wrapper grey lighten-2">
                            <div class="input-field">
                                <input id="end" type="search"required >
                                <label class="label-icon" for="search"><i class="material-icons">location_searching</i></label>
                                
                            </div>
                        </div>
                    </nav>
                    <br>
                    <h6> Qual o tempo máximo que deseja pedalar em minutos?</h6>
                    <br>
                    <p class="range-field">
                        <input type="range" id="time_max" min="0" max="100" />
                    </p>
                    <div class="switch left-align">
                        <label>
                            <input type="checkbox" id="limited_time">
                            <span class="lever"></span>
                            Pedalar com tempo ilimitado?
                        </label>
                    </div>
                    <br>
                    <button class="btn waves-effect waves-light green accent-4 modal-trigger" id="search_button" href="#modal1" type="submit" >Devo andar de bike?</button>
                </form>
                <br>
                <br>
            </div>
            <div class="col s12 m7 l9 center" id="map" style="height:100%;">
                
            </div>
            <script>
              function initMap() {
                // Create a map object and specify the DOM element for display.
                var map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: -34.397, lng: 150.644},
                  zoom: 8
                });
              }
        
            </script>
            <script>
                function initMap() {
                  var directionsService = new google.maps.DirectionsService;
                  var directionsDisplay = new google.maps.DirectionsRenderer;
                  var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 4,
                    center: {lat: -14.26438309, lng: -49.13085937}
                  });
                  directionsDisplay.setMap(map);
          
                  var onChangeHandler = function() {
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                  };
                  document.getElementById('start').addEventListener('change', onChangeHandler);
                  document.getElementById('end').addEventListener('change', onChangeHandler);
                }
          
                function calculateAndDisplayRoute(directionsService, directionsDisplay) {
                  directionsService.route({
                    origin: document.getElementById('start').value,
                    destination: document.getElementById('end').value,
                    travelMode: 'BICYCLING'
                  }, function(response, status) {
                    if (status === 'OK') {
                      directionsDisplay.setDirections(response);
                    } else {
                    }
                  });
                }
              </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC15a9ap1ppuoArK8entiJRwKyEzu66brk&callback=initMap"
            async defer></script>
        </div>

                
            

        
    <div id="main_modal">
    <div id="modal1" class="modal">
        <div class="modal-content">
        <h4 class="center-align" id="response_main" style="color:rgb(151, 21, 6);"></h4>
        <div class="route">

            <div class="row" style="margin-top:5%;">
                <div class="col s4 m4 l4" >
                    <img style="width:90px; height:auto;" class="responsive-img" src="./img/008-placeholder-5.png">
                </div>
                <div class="col s8 m8 l8" style="margin-top:1%;">
                    <h5 id="start_response"></h5>
                </div>
            </div>

            <div class="divider"></div>

            <div class="row" style="margin-top:5%;">
                <div class="col s4 m4 l4">
                    <img style="width:90px; height:auto;" class="responsive-img" src="./img/014-finish-2.png">
                </div>
                <div class="col s8 m8 l8" style="margin-top:1%;">
                    <h5 id="stop_response"></h5>
                </div>
            </div>

            <div class="divider"></div>
            
            <div class="row" style="margin-top:5%;">
                <div class="col s4 m4 l4">
                    <img style="width:90px; height:auto;" class="responsive-img" src="./img/006-alarm-clock.png">
                </div>
                <div class="col s8 m8 l8" style="margin-top:1%;">
                    <h5 id="timer_response"></h5>
                </div>
            </div>
            
            <div class="divider"></div>

            <div class="row" style="margin-top:5%;">
                <div class="col s4 m4 l4">
                    <img style="width:90px; height:auto;" class="responsive-img" src="./img/017-placeholder.png">
                </div>
                <div class="col s8 m8 l8" style="margin-top:1%;">
                    <h5 id="distance_response"></h5>
                </div>
            </div>
            
            <div class="divider"></div>
            
            <div class="row" style="margin-top:5%;">
                <div class="col s4 m4 l4">
                    <img style="width:90px; height:auto;" id="weather_img" class="responsive-img" src="./img/015-sunny.png">
                </div>
                <div class="col s8 m8 l8" style="margin-top:1%;">
                    <h5 id="weather_response"></h5>
                </div>
            </div> 

        </div>
        </div>
        <div class="modal-footer">
          <a href="#" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
        </div>
      </div>
    </div>
    <ul id='dropdown1' class='dropdown-content'>
    <li><a href="#">Settings</a></li>
    <li><a href="logout">Logout</a></li>
    
  </ul>

  </body>

  <footer class="page-footer green accent-3" style="margin-top:8%;">
    <div class="footer-copyright">
      <div class="container">
      © 2017 Vale a pena andar de bike?
      <a class="grey-text text-lighten-4 right" href="#!"><i class=" material-icons">directions_bike</i></a>
      </div>
    </div>
  </footer>

  
</html>