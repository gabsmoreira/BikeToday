function decide(){
  if (0 >localStorage.getItem("temp") > 33) {
    document.getElementById("response_main").style = "color: rgb(151, 21, 6);"
    return "Você não deve andar de bike hoje!"
  }
  else if (localStorage.getItem("weather").includes("rain")){
    document.getElementById("response_main").style = "color: rgb(151, 21, 6);"
    return "Você não deve andar de bike hoje!"
  }
  else if (parseInt(localStorage.getItem("time_value")) > parseInt(localStorage.getItem("time_value_person"))){
    document.getElementById("response_main").style = "color: rgb(151, 21, 6);"
    return "Você não deve andar de bike hoje!"
  }
  else{
    document.getElementById("response_main").style = "color: green;"
    return "Você deve andar de bike hoje!"
  }
}




function translateString(string){
  if (string == "clear sky"){
    var d = new Date(); // for now
    hour = d.getHours()
    if(5 > hour > 18){
      document.getElementById("weather_img").src = "./img/clear_sky_night.png"
    }
    else{
      document.getElementById("weather_img").src = "./img/clear_sky_day.png"      
    }
    return "Céu claro"
  }
  else if (string == "few clouds"){
    document.getElementById("weather_img").src = "./img/clouds_normal.png"
    return "Poucas nuvens"
  }
  else if (string == "scattered clouds"){
    document.getElementById("weather_img").src = "./img/clouds_normal.png"
    return "Nuvens dispersas"
  }
  else if (string == "broken clouds"){
    document.getElementById("weather_img").src = "./img/clouds_normal.png"
    return "Nuvens esparsas"
  }
  else if (string == "shower rain"){
    document.getElementById("weather_img").src = "./img/rain.png"
    return "Chuva"
  }
  else if (string == "rain"){
    document.getElementById("weather_img").src = "./img/rain.png"
    return "Chuva"
  }
  else if (string == "light rain"){
    document.getElementById("weather_img").src = "./img/rain.png"
    return "Chuva"
  }
  else if (string == "thunderstorm"){
    document.getElementById("weather_img").src = "./img/storm.png"
    return "Tempestade"
  }
  else if (string == "snow"){
    document.getElementById("weather_img").src = "./img/snow.png"
    return "Neve"
  }
  else if (string == "mist"){
    document.getElementById("weather_img").src = "./img/mist.png"
    return "Nevoeiro"
  }
}


function showModal() {
  $('.modal').modal();
}

  function checkNumber(string){
    var hasNumber = /\d/;
    return hasNumber.test(string)
  }

function fetchWeather(city){
  const params = {q: city, APPID: '001b0f58045147663b1ea518d34d88b4' }
  const urlParams = new URLSearchParams(Object.entries(params))
  fetch("https://api.openweathermap.org/data/2.5/weather?" + urlParams, {
    method: 'GET'
  }).then((res) => {
    res.json().then((data) => {
      console.log(data)
      var weather = data.weather[0].description;
      var temp = (data.main.temp - 273.15)  
      var humidity = data.main.humidity;
      localStorage.setItem("weather",weather)
      localStorage.setItem("temp",temp)
      localStorage.setItem("humidity",humidity)

  
    })
  })
}



$(document).ready(function() {
  $('select').material_select();
  localStorage.setItem("time_value_person", 10000)  

  $( "#search_button").click(function() {
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;
    const params = {origin: start, destination: end, key: 'AIzaSyC15a9ap1ppuoArK8entiJRwKyEzu66brk', mode: 'bicycling' }
    const urlParams = new URLSearchParams(Object.entries(params))
    
    fetch("https://maps.googleapis.com/maps/api/directions/json?" + urlParams, {
      method: 'GET'
    }).then((res) => {
      res.json().then((data) => {
        
        localStorage.setItem("status", data.status)
        console.log(data)
        
        try{
          if (checkNumber(data.routes[0].legs[0].start_address)){
            var city = data.routes[0].legs[0].start_address.split(",")[2].split("-")[0];
            var start = data.routes[0].legs[0].start_address.split("-")[0];

          }
          else{
            var city = data.routes[0].legs[0].start_address.split(",")[1].split("-")[0];
            var start = data.routes[0].legs[0].start_address.split(",")[0];
          }
          var time = data.routes[0].legs[0].duration.text;
          var distance = data.routes[0].legs[0].distance.text;
          var end = data.routes[0].legs[0].end_address.split("-")[0];
          var distance_value = data.routes[0].legs[0].distance.value;
          var time_value = data.routes[0].legs[0].duration.value/60;
          var time_value_person = document.getElementById('time_max').value;
        }
        catch(TypeError){ 
        }
        if (!document.getElementById("limited_time").checked){
          localStorage.setItem("time_value_person", time_value_person)
        }
        else{
          localStorage.setItem("time_value_person", 1000)
        }
        localStorage.setItem('time', time);
        localStorage.setItem("start",start)
        localStorage.setItem("end",end)
        localStorage.setItem("city",city)
        localStorage.setItem("time",time)
        localStorage.setItem("distance",distance)
        localStorage.setItem("time_value",time_value)
        localStorage.setItem("distance value",distance_value)
        fetchWeather(localStorage.getItem("city"))

        if(localStorage.getItem("status") != "OK"){
          localStorage.setItem("start",null)
          localStorage.setItem("end",null)
          localStorage.setItem("time",null)
          localStorage.setItem("distance",null)
          localStorage.setItem("time",null)
          localStorage.setItem("distance",null)
          $('#modal1').modal('close');
          Materialize.toast('Digite um endereço válido', 4000)
        }
        else {
          document.getElementById("start_response").innerText = localStorage.getItem("start");
          document.getElementById("stop_response").innerText = localStorage.getItem("end");
          document.getElementById("timer_response").innerText = localStorage.getItem("time");
          document.getElementById("distance_response").innerText = localStorage.getItem("distance");
          document.getElementById("weather_response").innerText = translateString(localStorage.getItem("weather"))
          $(document.getElementById("response_main")).text(decide())
          localStorage.setItem("error",false)
            
        }          
      })
    })
    // api.openweathermap.org/data/2.5/weather?q=London&APPID=001b0f58045147663b1ea518d34d88b4
    showModal()  
  });
});


 
  