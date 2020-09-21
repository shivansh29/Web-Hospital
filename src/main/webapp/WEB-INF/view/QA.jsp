<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<html>

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
body{
background : url("resources\\image\\wall.jpg");
background-position: center center;
}
p{
width:570px;
word-wrap: break-word;
}
</style>
<script>
    function myfun(){
        if (confirm("Are you sure complain is resolved!")){
            document.getElementById("myForm").submit();
        }
        else{
            event.preventDefault();
            
        }
    }
</script>
</head>
<body>

    <div class="container">
        
                <%
        String msg1=(String)session.getAttribute("msg1");
        if(msg1!=null)
        {
        %>
        <div class="panel panel-danger">
            <div class="panel-heading text-center">
                <p><%=msg1%></p>
            </div>
        </div>
            <%
            }
            msg1=null;
            session.setAttribute("msg1",msg1);%>
            
            <c:forEach var="comp" items="${list}">
            
            <form:form method="POST" action="/DeleteObject" id="myForm">
        <div class="row border border-success " style="margin-top:10px;border-radius:15px;">
<div class="col-md-4">
    <label>Name: </label><label style="margin-left:5px;">${comp.getName()}</label><br>
<label>Age: </label><label style="margin-left:5px;">${comp.getAge() }</label><br>
<label>Mobile: </label><label style="margin-left:5px;">${comp.getMobile() }</label><br>
<label>Gender: </label><label style="margin-left:5px;">${comp.getGender() }</label><br>
<label>Email: </label><label style="margin-left:5px;">${comp.getEmail() }</label><br>
<input type="hidden" name="id" value="${comp.getId()}"/>
<input type="hidden" name="serv" value="comp"/>
</div>
<div class="col-md-6">
<label>Compalin:</label><p>${comp.getDescription() }</p>
</div>
<div class="col-md-2 text-center" style="margin-top:25px;">
    <input type="submit" class="btn btn-outline-success btn-lg" style="border-radius:15px" onclick="myfun()" value="Resolved"/>
</div>
</div>
        </form:form>
            
            </c:forEach>
            
    </div>
    
</body>
</html>