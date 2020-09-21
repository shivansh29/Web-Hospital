<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

<style>
body{
background : url("resources\\image\\10.jpg");
background-size: 1380px 660px;
background-attachment:fixed;
background-repeat: no-repeat;
background-position: center center;
}
#reg{
	background: rgba(0,0,0,0.3);
}
</style>
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
<form:form id="reg" style="margin-top:30px;" onsubmit="return myNum()" action="/hireEmployee" method="POST">
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
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" name="email" class="form-control" id="inputEmail4" placeholder="Email" required>
    </div>
    <div class="form-group col-md-6" >
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" name="pass" id="inputPassword4" placeholder="Password" required>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="name" required>
	  <span id="messagesName" style="color:red;"></span>
    </div>
    <div class="form-group col-md-4" >
      <label for="inputPassword4">Age</label>
      <input type="number" class="form-control" id="inputPassword4" name="age" placeholder="21" required>
    </div>
    <div class="form-group col-md-4" >
      <label for="inputPassword4">Mobile</label>
      <input type="number" class="form-control" id="phone" name="mobile" placeholder="1234567890" required>
	  <span id="messages" style="color:red;"></span>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md" >
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" name="address" placeholder="123 Street" required>
    </div>
  </div>
  <div class="form-row">
  <div class="col-md-4" >
  <label>City:</label>
<select id="inputState" class="dropin" name="city" >
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
  <div class="col-md-4" >
<label>State:</label>
    <select id="inputState" class="dropin" name="state" >
        <option selected>Uttar Pradesh</option>
        <option>Maharashra</option>
		<option>Karnatak</option>
		<option>Delhi</option>
      </select>
</div>
<div class="col-md-4" >
<label>Field</label>
    <select id="inputState" class="dropin" name="field" >
        <option selected>Doctor</option>
        <option>Q & A Section</option>
      </select>
</div>
  </div>
  <div class="form-row">
<div class="col-md-4 md-form" >
<label>DOB:</label>
<input placeholder="Selected date" type="text" name="dob" id="date-picker-example" class="form-control"  width="30" required/>
</div>
<div class="form-group col-md-4">
      <label for="inputEmail4">Aadhar No.</label>
      <input type="number" class="form-control" id="inputEmail4" name="aadhar" placeholder="0123456789" required>
    </div>
<div class="form-group col-md-4">
      <label for="inputEmail4">PAN No.</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="123456" name="pan" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-4">
      <label for="inputEmail4">College:</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="College" name="college" required>
    </div>
	<div class="form-group col-md-4">
      <label for="inputEmail4">Degree:</label>
	  <select id="inputState" class="dropin" name="" >
        <option selected>MBBS</option>
        <option>BCA</option>
      </select>
    </div>
	<div class="form-group col-md-4">
      <label for="inputEmail4">Gender:</label><br>
	  <div class="form-check form-check-inline" style="margin-left:15px;">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="male" checked>
  <label class="form-check-label" for="inlineRadio1">M</label>
</div>
<div class="form-check form-check-inline" style="margin-left:55px;">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="female">
  <label class="form-check-label" for="inlineRadio2">F</label>
</div>
<div class="form-check form-check-inline" style="margin-left:55px;">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="other" >
  <label class="form-check-label" for="inlineRadio3">O</label>
</div>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
  <input type="submit" class="btn btn-primary btn-lg btn-block" value="SUBMIT">
  </div>
  <div class="form-group col-md-6">
  <input type="reset" class="btn btn-danger btn-lg btn-block" value="CANCEL">
  </div>
  </div>
</form:form>
</div>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 
<script src="jquery-3.4.1.min.js"></script>
<script src="jquery-ui.min.js"></script>  -->
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