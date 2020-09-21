<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<style>
body{
background : url("resources\\image\\eee.jpg");
background-size: 1380px 760px;
background-attachment:fixed;
background-repeat: no-repeat;
background-position: center center;
}
p{
width:570px;
word-wrap: break-word;
color: white;
}
label{
    color: white;
}
</style>
</head>

<body>
    <div class="container">
    
    
    <c:choose>
  		<c:when test="${list.size()>0}">
    		<c:forEach var="emp" items="${list}">
    			<form:form action="" method="POST">
        			<div class="row border border-white " style="margin-top:20px;border-radius:15px;">
						<div class="col-md-4">
    						<label>Designation: </label><label style="margin-left:5px;">${emp.getPosition()}</label><br>
							<label>Salary: </label><label style="margin-left:5px;">${emp.getSalary() } LPA</label><br>
							<label>Experience: </label><label style="margin-left:5px;">${emp.getExperience()}</label><br>
<!--<input type="hidden" name="id" value=""/>-->
						</div>
					<div class="col-md-6">
						<label>Job Description:</label><p>${emp.getDescription() }</p>
					</div>
					<div class="col-md-2 text-center" style="margin-top:25px;">
    					<a  href="Apply.jsp?id=${emp.getId()}" style=" margin-top:30px; margin-bottom: 20px; border-radius:15px;" class="btn btn-light btn-lg">Apply</a>
					</div>
					</div>
        	</form:form>
    		</c:forEach>
  		</c:when>
  		<c:otherwise>
    		<h1 style="color: white;">No Jobs Available</h1>
  		</c:otherwise>
	</c:choose>
  <%--      <%
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
        <h2 style="color:white;">Jobs:</h2>
        <%
        if(list.size() ==0)
        {
        %>
        <h1 style="color: white;">No Jobs Available</h1>
        <%
        }
        else
        {
                        int i=0;
                while(i<list.size()){
                  jobs job=list.get(i++);  
        %>
        <form:form action="" method="POST">
        <div class="row border border-white " style="margin-top:20px;border-radius:15px;">
<div class="col-md-4">
    <label>Designation: </label><label style="margin-left:5px;"><%=job.getPosition() %></label><br>
<label>Salary: </label><label style="margin-left:5px;"><%=job.getSalary() %> LPA</label><br>
<label>Experience: </label><label style="margin-left:5px;"><%=job.getExperience() %></label><br>
<!--<input type="hidden" name="id" value=""/>-->
</div>
<div class="col-md-6">
<label>Job Description:</label><p><%=job.getDescription() %></p>
</div>
<div class="col-md-2 text-center" style="margin-top:25px;">
    <a  href="Apply.jsp?id=<%=job.getId() %>" style=" margin-top:30px; margin-bottom: 20px; border-radius:15px;" class="btn btn-light btn-lg">Apply</a>
</div>
</div>
        </form:form>
        
        
        <%
        }
        }
        %>
         --%>
    </div>
    
   
    
</body>
</html>
