<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<style>
body{
background : url("resources\\image\\1.jpg");
background-size: 1380px 660px;
background-attachment:fixed;
background-repeat: no-repeat;
background-position: center center;
}
#reg{
	background: rgba(0,0,0,0.3);
}

label{
	color:white;
	font-size:27px;
	margin-top:5px;
}

input{
	 background: transparent;
	 border-radius:0px;
	 border:0px;
	 border-bottom: 1px solid white;
	 color:white;
	font-size:22px;
}
::placeholder {
  color: whitesmoke;
  opacity: 1; /* Firefox */
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
    <div class="container">
        <div class="row">
                  
            <div class="col-md-6">
                <%
           String msg=(String)session.getAttribute("msg");
        if(msg!=null)
        {
    %>
    <div style=" margin-top: 25px;">
        <p style="color:gold;font-size: 25px;"><%=msg%></p></div>
    <%
               }
            msg=null;
            session.setAttribute("msg",msg);
    %>
<form:form onsubmit="return myNum()" action="/saveComplain" id="reg" method="POST" style="margin-top:80px;">
      
    <h3 style="color:white;">Complain Form</h3>
    <hr style="background-color:white;">
<div class="row">
<div class="col-md-4">
<label>Name :</label>
</div>
<div class="col-md-8" style="padding-left:0px;margin-top: 5px;">
<input type="text" name="name" placeholder="name" size="30" id="name" required>
<span id="messagesName" style="color:red;"></span>
</div>
</div>

<div class="row">
<div class="col-md-4">
<label>Age :</label>
</div>
<div class="col-md-8" style="padding-left:0px;">
<input type="number" name="age" placeholder="Age"  required/>
</div>
</div>
    

<div class="row">
<div class="col-md-4">
<label>E-Mail :</label>
</div>
<div class="col-md-8" style="padding-left:0px;">
<input type="email" name="email" placeholder="abc@gmail.com" size="30" required/>
</div>
</div>
    
<div class="row">
<div class="col-md-4">
<label>Phone No :</label>
</div>
<div class="col-md-8" style="padding-left:0px;">
<input type="number" id="phone" name="phone" placeholder="9999999999"  required/>
<span id="messages" style="color:red;"></span>
</div>
</div>
    
<div class="row">
<div class="col-md-4">
<label>Gender :</label>
</div>
<div class="col-md-8" style="padding-left:0px;">
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
<div class="col-md-4">
<label>Complain :</label>
</div>
<div class="col-md-8" style="padding-left:0px;">
<textarea  name="comp" placeholder="Your Complaint" cols="30" style="background: transparent;border-radius:0px;border:0px;border-bottom: 1px solid white;
	 color:white;font-size:22px;" rows="3" required></textarea>
</div>
</div>
    

    <div class="row" style="margin-top :10px; ">
<div class="col-md-3">

</div>
<div class="col-md-9 md-form" style="padding-left:0px;">
<a href="complain.html"><button class="btn btn-danger btn-lg" type="reset" style="border-radius:15px">Cancel</button></a>
<input class="btn btn-success btn-lg" type="submit" style="border-radius:15px" value="SUBMIT"/>
</div>
</div>
    
</form:form>
            </div>
            <div class="col-md-6" style="padding-top: 250px;padding-left: 100px;">
                <h1 class="animated  bounceInDown "><em>OK Boss.</em></h1><br>
                <h3 class="animated  bounceInRight delay-2s "><em>What's your problem</em></h3>
                <h3 class="animated  bounceInUp delay-3s "><em>Let us help you</em></h3>
            </div>
            </div>
        </div>
</body>
</html>