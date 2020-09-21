<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources//stile.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<title>Registeration</title>
<script>
function myNum(){
var a=document.getElementById("phone").value;
if(a.length<10||a.length>10){
//console.log("hhhhhhhhhhhhhhhhhhhhhh");
document.getElementById("messages").innerHTML="enter valid phone number";
return false;
}

var str=document.getElementById("name").value.trim();
if(str.length<1){
document.getElementById("messagesName").innerHTML="Enter Valid name";
return false;
}
}
</script>
</head>
<body>
<div class="container" style="padding-left:0px;">
<div class="row">
<div class="col-md-6">
<h1 class="text-left"> Registration form</h1>
<h3 class="text-left"> "It is health that is real wealth and not pieces of gold and silver"</h3>
</div>
<div class="col-md-6" id="reg" style="margin-top:40px;">
<h3 style="color:white;margin-top:10px;">Sign Up <i class="fas fa-pencil-alt " size="3x"></i></h3>
<hr size="30" style="background-color:white;">
<form:form onsubmit="return myNum()" action="/RegisterUser" cssClass="date-picker-example" method="POST">
    <%
           String msg=(String)session.getAttribute("msg");
        if(msg!=null)
        {
    %>
    <p style="color:red;"><%=msg%></p>
    <%
               }
            msg=null;
            session.setAttribute("msg",msg);
    %>
<div class="row">
<div class="col-md-3">
<label>Name :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<input type="text" name="name" placeholder="name" size="35" id="name" required></input>
<span id="messagesName" style="color:red;"></span>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>Age :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<input type="number" name="age" placeholder="Age" size="35" required></input>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>E-Mail :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<input type="email" name="email" placeholder="abc@gmail.com" size="35" required></input>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>Password :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<input type="password" name="pass" placeholder="pass" size="35" required></input>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>Mobile No. :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<input type="number" id="phone" name="phone" placeholder="0123-456-789"  style="color:danger;" required/>
<span id="messages" style="color:red;"></span>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>Address :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<textarea  name="address" placeholder="street address" cols="35" style="background: transparent;border-radius:0px;border:0px;border-bottom: 1px solid white;
	 color:white;" rows="3" required></textarea>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>City :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<select id="inputState" class="dropin" name="city" style="background:transparent;background-color:white;border-radius:0px;border:0px;border-bottom: 1px solid white;margin-top:5px; width:220px;">
        <option selected>Agra</option>
        <option>Kanpur</option>
		<option>Lucknow</option>
		<option>Delhi</option>
		<option>Noida</option>
		<option>Mumbai</option>
		<option>Patna</option>
		<option>Banglore</option>
      </select>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>State :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
    <select id="inputState" class="dropin" name="state" style="background:transparent;background-color:white;border-radius:0px;border:0px;border-bottom: 1px solid white;margin-top:5px; width:220px;">
        <option selected>Uttar Pradesh</option>
        <option>Maharashra</option>
		<option>Karnatak</option>
		<option>Delhi</option>
      </select>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>DOB :</label>
</div>
<div class="col-md-9 md-form" style="padding-left:0px;">
<input placeholder="Selected date" type="text" name="dob" id="date-picker-example" class="form-control " style="margin-top:5px;" width="30" required/>
</div>
</div>
<div class="row">
<div class="col-md-3">
<label>Gender :</label>
</div>
<div class="col-md-9" style="padding-left:0px;">
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="male" checked>
  <label class="form-check-label" for="inlineRadio1">M</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="female">
  <label class="form-check-label" for="inlineRadio2">F</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="other" >
  <label class="form-check-label" for="inlineRadio3">O</label>
</div>
</div>
</div>
<div class="row">
<div class="col-md-3">

</div>
<div class="col-md-9 md-form" style="padding-left:0px;">
<a href="/RegisterPage"><button class="btn btn-danger" type="reset" style="border-radius:15px">Cancel</button></a>
<input class="btn btn-success" type="submit" style="border-radius:15px" value="submit"/>
</div>
</div>
</form:form>
</div>
</div>
</div>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 
<script src="jquery-3.4.1.min.js"></script>
<script src="jquery-ui.min.js"></script> -->
<script>
$(document).ready(function(){
$('#date-picker-example').datepicker({
dateFormat: "dd/mm/yy",changeMonth: true,changeYear: true,
minDate: new Date(1900,0,1),
maxDate: new Date(2019,0,1)
});
})
</script>
</body>
</html>