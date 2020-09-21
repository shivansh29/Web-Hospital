<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="com.springboot.Application.WebHospital.modal.customer"%>
<%@page import="com.springboot.Application.WebHospital.Services.CustomerService"%>
<%@page import="com.springboot.Application.WebHospital.modal.appointment"%>
<%@page import="java.util.List"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
body{
background : url("resources\\image\\13967.jpg");
background-color:#EAF6F6;
background-size: 1380px 660px;
background-repeat: no-repeat;
background-position: center center;
}
.dropin {
	display: block;
	font-size: 16px;
	font-family: sans-serif;
	font-weight: 700;
	color: #444;
	line-height: 1.0;
	padding: .6em 1.4em .5em .8em;
	width: 100%;
	max-width: 100%;
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
        border-style:solid;
        border-color:#ff4400;
	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	border-radius: .5em;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}
</style>
<script type="text/javascript">
function makeNewItem(){
var Row=document.createElement('div')
Row.classList.add('row')
var Form=document.getElementById('form')
var RowContents=`
<div class="form-group col-md-8">
<label>  Medicine: </label>
<select id="inputState" class="dropin" name="medi" style="background:transparent;width:220px;border-radius:0px;border:0px;margin-top:5px;" size="1">
		<c:forEach var="emp" items="${list}">
		 <option >${emp.getName()}</option>
		</c:forEach>
 
</select>
</div>
<div class="form-group col-md-4">
<label>  Dose: </label>
<input type="number" name="dose"  class="form-control" required>
</div >
`
Row.innerHTML=RowContents
Form.append(Row)
}
function removeItems(){
var x=document.getElementById('form').lastElementChild
document.getElementById('form').removeChild(x)
}
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
</head>

<body>
<%
        String msg=(String)session.getAttribute("msg");
        if(msg!=null)
        {
        %>
        <div class="panel panel-danger">
            <div class="panel-heading text-center">
                <p><%=msg%></p>
            </div>
        </div>
            <%
            }
            msg=null;
            session.setAttribute("msg",msg);%>
	    

<div class="container ">
    <div class="row">
        <div class="col-md-8">
            
<b><label style="font-size:40px;">Hello Doctor</label></b><!--data-target="#mymodal" data-toggle="modal"-->
<%! int i=0; %>
<c:choose>
  <c:when test="${appointList.size()>0}">
    <c:forEach var="emp" items="${appointList}">
    <%
    	customer cust=((CustomerService)request.getAttribute("customer")).customerExists(((List<appointment>)request.getAttribute("appointList")).get(i++).getCustomerId());
    %> 
    	<div class="row border border-success " style="margin-top:10px;border-radius:15px;">
			<div class="col-md-4">
    			<label>Name: </label><label style="margin-left:5px;"><%=cust.getName() %></label><br>
				<label>Age: </label><label style="margin-left:5px;"><%=cust.getAge() %></label><br>
				<label>Gender: </label><label style="margin-left:5px;"><%= cust.getGender() %></label><br>
				<label>Email: </label><label style="margin-left:5px;">${emp.getCustomerId()}</label><br>
			</div>
		<div class="col-md-6">
				<label>Problem:</label><p>${emp.getDescription()}</p>
		</div>
		<div class="col-md-2 text-center" style="margin-top:25px;">
			<label>Time: </label><label style="margin-left:5px;">${emp.getTime()}</label><br>
		</div>
	</div>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <h3>No appointments for Today</h3>
  </c:otherwise>
</c:choose>

</div>
<%--
<%
    Date date = Date.valueOf(LocalDate.now());
List<appointment> lt=db.getSchedule(emp.getEmail(),date);
if(lt.size()==0){
    %>
    <h3>No appointments for Today</h3>
    <%
}
else
{
    for(int i=0;i<lt.size();i++){
            appointment at=lt.get(i);
        customer ct=db.getCustomer(at.getCustomerId());
%>


<div class="row border border-success " style="margin-top:10px;border-radius:15px;">
<div class="col-md-4">
    <label>Name: </label><label style="margin-left:5px;"><%=ct.getName() %></label><br>
<label>Age: </label><label style="margin-left:5px;"><%=ct.getAge() %></label><br>
<label>Gender: </label><label style="margin-left:5px;"><%=ct.getGender() %></label><br>
<label>Email: </label><label style="margin-left:5px;"><%=ct.getEmail() %></label><br>
</div>
<div class="col-md-6">
<label>Problem:</label><p><%=at.getDescription() %></p>
</div>
<div class="col-md-2 text-center" style="margin-top:25px;">
<label>Time: </label><label style="margin-left:5px;"><%=at.getTime() %></label><br>
    
</div>
</div>
<%
    }
}
%>


        </div>
        
        --%>
        <div class="col-md-4">

<div class="row d-flex justify-content-center">
    <button class="btn btn-info btn-lg " style="border-radius:15px;margin-top:120px;"  data-target="#mymodal" data-toggle="modal">Prescription</button>
</div>
<div class="row d-flex justify-content-center">
<button class="btn btn-info btn-lg " style="border-radius:15px;margin-top:120px;" data-target="#mymodal3" data-toggle="modal">Send Prescription</button>
</div>

	<c:if test="${file.equalsIgnoreCase('file')}">
	<div class="text-center">
		<a class="btn btn-secondary" style="margin-top:120px;" href="/DownloadFile" role="button">Download</a>
		
	</div>
	</c:if>
<%--
<%
           String fileReady=(String)session.getAttribute("fileReady");
        if(fileReady!=null)
        {
    %>
<div class="text-center">
<a class="btn btn-secondary" style="margin-top:120px;" href="DownloadFile" role="button">Download</a>
</div>
<%
               }
            fileReady=null;
            session.setAttribute("fileReady",fileReady);
    %>
    
    --%>
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
<form:form action="/QRCode" method="POST">
<div id="form">
<div class="row">
<div class="form-group col-md-8">
<label>  Medicine: </label>
<select id="inputState" class="dropin" name="medi" style="background:transparent;width:220px;border-radius:0px;border:0px;margin-top:5px;" size="1">
    
    <c:forEach var="emp" items="${list}">
		 <option >${emp.getName()}</option>
		</c:forEach>

</select>
</div>
<div class="form-group col-md-4">
<label>  Dose: </label>
<input type="number" name="dose"  class="form-control" required>
</div >
</div>
</div>
<div class="modal-footer justify-content-center">
<button class="btn btn-danger"  onclick="makeNewItem()" >Add</button>
<button class="btn btn-danger"  onclick="removeItems()" >Remove</button>
<button class="btn btn-success" type="submit" >Generate</button></div>
</form:form>
</div>
</div>
</div>
</div>

<div class="modal fade" id="mymodal3">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h3>Medicine</h3>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<form:form action="/SendMail" method="POST" enctype='multipart/form-data'>
<div id="form">
<div class="row">
<div class="form-group col-md-8">
<label>  Reciever: </label>
<input type="email" name="email"  class="form-control" required>
</div>
<div class="form-group col-md-4">
<label class="custom-file-upload" style="padding-top:35px;"><input name="prescription" type="file" id="fileName" accept=".jpg" onchange="validateFileType()"/></label>

</div >
</div>
</div>
<div class="modal-footer justify-content-center">
<input class="btn btn-success" type="submit"  value="Send" ></div>
</form:form>
</div>
</div>
</div>
</div>


</body>
</html>
