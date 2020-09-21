<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<style>
.vl {
  border-left: 1px solid white;
  height: 655px;
  position: absolute;
  margin-left: -3px;
  top: 0;
}
#reg{
	background: rgba(0,0,0,0.5);
}
label{
color:white;
	font-size:25px;
}
#lab{
	 background: transparent;
	 border-radius:0px;
	 border:0px;
	 border-bottom: 1px solid white;
	 color:white;
}
#date-picker-example1{
    background: transparent;
	 border-radius:0px;
	 border:0px;
	 border-bottom: 1px solid white;
	 color:white;
}

#date-picker-example2{
    background: transparent;
	 border-radius:0px;
	 border:0px;
	 border-bottom: 1px solid white;
	 color:white;
}
</style>
<script>
    function myfun(){
        if (confirm("Are you sure you want to remove medicine? ")){
            document.getElementById("myForm").submit();
        }
        else{
            event.preventDefault();
            
        }
    }
    function myfun2(){
        if (confirm("Are you sure you want to Fire this employee? ")){
            document.getElementById("myForm3").submit();
        }
        else{
            event.preventDefault();
            
        }
    }
    function myfun3(){
        if (confirm("Are you sure you want to expire this job? ")){
            document.getElementById("myForm4").submit();
        }
        else{
            event.preventDefault();
            
        }
    }
</script>
</head>
<body style="	font-family:new time roman; background : url('resources//image//bb0463cbd1c88e3280cb273dd29d2859.jpg'); background-attachment:fixed;background-position: center center;background-size: 1380px 760px;">
<div class="container">
    
<div class="row text-center">
<div class="col-md-8 text-left" >
    <form:form id="reg" style="margin-top:50px;" action="/Store" method="POST">
        <%
           String msg=(String)session.getAttribute("msg");
        if(msg!=null)
        {
    %>
    <p style="color:green;"><%=msg%></p>
    <%
               }
            msg=null;
            session.setAttribute("msg",msg);
    %>
<div class="row">
<div class="col-md-4">
<label>URL</label>
</div>
<div class="col-md-8">
    <input name="url" type="text" id="lab" style="color:white;" placeholder="img/pp.jpg" />
</div>
</div><br>

<div class="row">
<div class="col-md-4">
<label>Name</label>
</div>
<div class="col-md-8">
    <input  id="lab" type="text"  placeholder="name" size="35" name="name" required />
</div>
</div><br>

<div class="row">
<div class="col-md-4">
<label>Price</label>
</div>
<div class="col-md-8">
<input type="text" id="lab" name="price" placeholder="Price" size="35">
</div>
</div><br>

<div class="row">
<div class="col-md-4">
<label>Quantity</label>
</div>
<div class="col-md-8">
<input type="number" name="quantity" id="lab" placeholder="Quantity" size="35" required/>
</div>
</div><br>

<div class="row">
<div class="col-md-4">
<label>Manufacture</label>
</div>
<div class="col-md-8">
    
<input placeholder="Selected date" type="text" name="mfg" id="date-picker-example1" class="form-control" style="margin-top:5px;" size="20" required/>
</div>
</div><br>

<div class="row">
<div class="col-md-4">
<label>Expiry</label>
</div>
<div class="col-md-8">
    
<input placeholder="Selected date" type="text" name="exp" id="date-picker-example2" class="form-control" style="margin-top:5px;" size="30" required/>
</div>
</div><br>
<div class="row">
<div class="col-md-4">
<label>Prescription</label>
</div>
<div class="col-md-8">
    <select id="inputState" class="dropin" name="pres" >
        <option selected>YES</option>
        <option>NO</option>
      </select>
</div>
</div><br>

<div class="text-center">
<input class="btn btn-secondary btn-lg" style="border-radius:15px;"  type="submit" value="Add">
<button class="btn btn-danger btn-lg" type="reset" style="border-radius:15px;" >Cancel</button></div>
</form:form>

</div>
<div class="col-md-4">
<div class="vl"></div>
<%
        String msg1=(String)session.getAttribute("msg1");
        if(msg1!=null)
        {
        %>
    <p style="color:green;font-size: 20px;"><%=msg1%></p>
            <%
            }
            msg1=null;
            session.setAttribute("msg1",msg1);%>
            <div class="row">
                <div class="col-md-6">
<button class="btn btn-success btn-lg" style="border-radius:15px; margin-top:100px;" data-target="#mymodal" data-toggle="modal"  >Remove</button><br>
                </div>
                <div class="col-md-6">
<button class="btn btn-success btn-lg" style="border-radius:15px; margin-top:100px;" onclick="window.location.href='/Hire';" >HIRE</button><br>
                </div>
            </div>
            <hr style="color:white; background-color: wheat;"/>
            <div class="row">
                <div class="col-md-6">
<button class="btn btn-success btn-lg" style="border-radius:15px; margin-top:100px;" data-target="#mymodal2" data-toggle="modal">Post Job</button><br>
                </div>
                <div class="col-md-6">
<button class="btn btn-danger btn-lg" style="border-radius:15px; margin-top:100px;" data-target="#mymodal3" data-toggle="modal" >Fire</button><br>
                </div>
                </div>
            <hr style="color:white; background-color: wheat;"/>
            
            <div class="row">
                <div class="col-md-12">
<button class="btn btn-success btn-lg" style="border-radius:15px; margin-top:100px;" data-target="#mymodal4" data-toggle="modal" >Expire Job</button><br>
                </div>
                </div>
            <hr style="color:white; background-color: wheat;"/>

</div>
</div>


</div>
<div class="modal fade" id="mymodal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Medicine</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/DeleteObject" method="POST" id="myForm">
<div class="form-group">
    <label style="color:black;"> Name: </label>
<input type="text" name="id"  class="form-control" required>
<input type="hidden" name="serv" value="med"/>
</div>
<div class="modal-footer justify-content-center">
<input class="btn btn-danger" type="submit" value="Remove" onclick="myfun()"/></div>
</form:form>
</div>
</div>
</div>
</div>
            
            
<div class="modal fade" id="mymodal3">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Employee</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/DeleteObject" method="POST" id="myForm3">
<div class="form-group">
    <label style="color:black;"> Email: </label>
<input type="email" name="id"  class="form-control" required>
<input type="hidden" name="serv" value="emp"/>
</div>
<div class="modal-footer justify-content-center">
<input class="btn btn-danger" type="submit" value="Fire" onclick="myfun2()"/></div>
</form:form>
</div>
</div>
</div>
</div>
            
            
<div class="modal fade" id="mymodal4">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Jobs</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/DeleteObject" method="POST" id="myForm4">
<div class="form-group">
    <label style="color:black;"> Job Id: </label>
<input type="number" name="id"  class="form-control" required>
<input type="hidden" name="serv" value="job"/>
</div>
<div class="modal-footer justify-content-center">
<input class="btn btn-danger" type="submit" value="Expire" onclick="myfun3()"/></div>
</form:form>
</div>
</div>
</div>
</div>


<div class="modal fade" id="mymodal2">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Jobs</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <form:form action="/PostJob" method="POST" >
<div class="form-group">
    <label style="color:black;"> position: </label>
<input type="text" name="pos"  class="form-control" required>
</div>
        
<div class="form-group">
    <label style="color:black;"> Experience: </label>
<input type="number" name="experience"  class="form-control" required>
</div>
      
<div class="form-group">
    <label style="color:black;"> Salary: </label>
<input type="number" name="sal"  class="form-control" required>
</div>
        
<div class="form-group">
    <label style="color:black;"> Job Description: </label>
    <textarea  name="descrip" placeholder="Job Description" cols="50" style="background: transparent;border-radius:0px;border:2px inset;border-bottom: 1px solid black;
	 color:black;" rows="3" required></textarea>
</div>
<div class="modal-footer justify-content-center">
<input class="btn btn-danger" type="submit" value="Add" /></div>
</form:form>
</div>
</div>
</div>
</div>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 
<script src="jquery-3.4.1.min.js"></script>
<script src="jquery-ui.min.js"></script>  -->
<script>
$(document).ready(function(){
$('#date-picker-example2').datepicker({
dateFormat: "dd/mm/yy",changeMonth: true,changeYear: true,
minDate: new Date(2012,0,1),
maxDate: new Date(2022,0,1)
});
})
</script>
<script>
$(document).ready(function(){
$('#date-picker-example1').datepicker({
dateFormat: "dd/mm/yy",changeMonth: true,changeYear: true,
minDate: new Date(2002,0,1),
maxDate: new Date(2020,0,1)
});
})
</script>
</body>
</html>