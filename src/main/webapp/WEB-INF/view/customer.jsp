<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
body{
background : url("resources//image//5bd1ec30a075d-wallpaper-preview.jpg");
background-color:#EAF6F6;
background-size: cover;
background-repeat: no-repeat;
background-position: center center;
}
img{
 width:280px;
 height:600px;
}
.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}
</style>
<script type="text/javascript">
function work(){
var time= new Date().getHours();
var minute= new Date().getMinutes();
/*if(time<6&&minute<30){
document.getElementById("appoint").style.display='none';
}
else
document.getElementById("call").style.display='none';*/
}
</script>
</head>
<body onload="work()">
    
<div id="carouselExampleSlidesOnly" class="carousel slide carousel-fade" data-ride="carousel" style="padding-top:50px ; padding-left:70px; padding-right:70px; padding-bottom:20px;">
  <div class="carousel-inner" >
    <div class="carousel-item active" data-interval="3000">
        <img src="resources//image//wp2121133.jpg" class="d-block w-100" alt="..." >
		<div class="carousel-caption">
	  <button class="btn btn-primary btn-lg" style="border-radius:15px" data-target="#mymodal" data-toggle="modal" >Prescription</button>
	  </div>
    </div>
    <div class="carousel-item" data-interval="3000" >
      <img src="resources//image//light-medical-examination-doctors-medical-study.jpg" class="d-block w-100" alt="..." >
	  <div class="carousel-caption">
	  <a href="/Appointment"><button class="btn btn-info btn-lg" id="appoint" style="border-radius:15px" >Appointment</button></a>
	<!--  <a href=""><button class="btn btn-info btn-lg" id="call" style="border-radius:15px" >Call</button></a> -->
	  </div>
    </div>
    <div class="carousel-item" data-interval="3000">
      <img src="resources//image//pills_-_istock_45457136_-_drupal.jpg" class="d-block w-100" alt="...">
	  <div class="carousel-caption">
	  <a href="/Shopping"><button class="btn btn-success btn-lg" style="border-radius:15px" >Shop</button></a>
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
<div class="modal fade" id="mymodal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3> Valid Prescription</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/pay" method="POST" enctype='multipart/form-data'>
    
<div class="modal-footer justify-content-center">

<label class="custom-file-upload"><input name="image" type="file" id="fileName" accept=".jpg" onchange="validateFileType()"/></label>
<script type="text/javascript">
    function validateFileType(){
        var fileName = document.getElementById("fileName").value;
        var idxDot = fileName.lastIndexOf(".") + 1;
        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        if (extFile=="jpg"){
            //TO DO
        }else{
            alert("only jpg files are allowed!");
        }   
    }
</script>
<input type="submit" value="GO"> 
</form:form>
</div>
</div>
</div>
</div>
</body>
</html>