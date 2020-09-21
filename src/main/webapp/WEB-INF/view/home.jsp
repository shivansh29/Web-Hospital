<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

<style>
body{
background : url("resources\\image\\capsules-cure-drug-health-wallpaper-preview.jpg");
background-color:#EAF6F6;
background-size: 1380px 760px;
background-attachment:fixed;
background-repeat: no-repeat;
background-position: center center;
}
h1{
text-align:center;
color:slateblue;
padding-top:20px;
}
img{
 width:300px;
 height:650px;
}
#loading{
    background:  black url('https://media.giphy.com/media/McUcHPA9CXHMyovnhY/giphy.gif') no-repeat center;
    position: fixed;
    width: 100%;
    height: 100vh;
    z-index: 999999;
}

</style>

<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

function myfun(){
    var pre=document.getElementById("loading");
    pre.style.display ='none';
} 
</script>
</head>
<body onload="myfun()" >
    <div id="loading"></div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<a class="navbar-brand" href="#">Home</a>
<button class="navbar-toggler toggler-example" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1"
    aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"><span class="dark-blue-text"><i
        class="fas fa-bars fa-1x"></i></span></button>
<div class="collapse navbar-collapse" id="navbarSupportedContent1">
<ul class="navbar-nav ml-auto">
<li class="nav-item"><a class="nav-link" href="/Contact">Contact</a></li>
<li class="nav-item"><a class="nav-link" href="/Jobs">Jobs</a></li>
<li class="nav-item"><a class="nav-link" href="/complain">Complain</a></li>
</ul>
</div>
</nav>

<h1>
<em>Healthy Life, Wealthy Life</em>
</h1>
 <%
           String msg=(String)session.getAttribute("msg");
        if(msg!=null)
        {
    %>
    <div style="text-align:center;">
    <p style="color:red;"><%=msg%></p>
    </div>
    <%
               }
            msg=null;
            session.setAttribute("msg",msg);
    %>
<div id="carouselExampleSlidesOnly" class="carousel slide carousel-fade" data-ride="carousel" style="padding-top:50px ; padding-left:50px; padding-right:50px">
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="3000">
        <img src="resources//image//doctor-image.jpg" class="d-block w-100" alt="..." >
		<div class="carousel-caption">
	  <h3><em>Best Doctors are</em></h3>
	  </div>
    </div>
    <div class="carousel-item" data-interval="3000" >
      <img src="resources//image//1572812957-4792.jpg" class="d-block w-100" alt="..." >
	  <div class="carousel-caption">
	  <h3><em>One Click Away</em></h3>
	  </div>
    </div>
    <div class="carousel-item" data-interval="3000">
      <img src="resources//image//popular-health-websites-are-sharing-sensitive-medical-data-with-advertisers_1500.jpg" class="d-block w-100" alt="...">
	  <div class="carousel-caption">
	  <h4>Health is the greatest possession</h4>
	  </div>
    </div>
  </div>
  <ul class="carousel-indicators">
  <li data-target="#carouselExampleSlidesOnly" data-slide-to="0" class="active"></li>
  <li data-target="#carouselExampleSlidesOnly" data-slide-to="1" class=""></li>
  <li data-target="#carouselExampleSlidesOnly" data-slide-to="2" class=""></li>
  </ul>
  <a href="#carouselExampleSlidesOnly" data-slide="prev" class="carousel-control-prev"><span class="carousel-control-prev-icon"></span></a>
  <a href="#carouselExampleSlidesOnly" data-slide="next" class="carousel-control-next"><span class="carousel-control-next-icon"></span></a>

</div>
<div class="text-center" style="padding-top:100px; padding-bottom:20px">
<button class="btn btn-outline-info btn-lg" style="border-radius:15px" data-target="#mymodal" data-toggle="modal">Login</button>
<button class="btn btn-light btn-lg" style="border-radius:15px" onclick="window.location.href='/RegisterPage';">Register</button></div>
<div class="modal fade" id="mymodal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Login</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/Login" method="POST">
<div class="form-group">
<label> <i class="fas fa-user-circle"></i> Username: </label>
<input type="text" name="user"  class="form-control" required>
</div>
<div class="form-group">
<label> <i class="fas fa-lock"></i> Password: </label>
<input type="password" name="pass"  class="form-control" id="myInput" required>
<input type="checkbox" onclick="myFunction()">Show Password
</div >
<div class="form-group">
    <select id="idType" name="kind" class="dropin" style="background-color:white;border-radius:0px;border:0px;border-bottom: 1px solid white;margin-top:5px; width:220px;">
        <option selected>Customer</option>
        <option>Employee</option>
		<option>Admin</option>
      </select>
</div >
<div class="modal-footer justify-content-center">
<input class="btn btn-danger" type="submit" value="Login"></input></div>
	</form:form>
</div>
</div>
</div>
</div>
</body>
</html>