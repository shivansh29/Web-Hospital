<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

<html>
<head>
<title>Payment Page</title>
	
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script>
            function myNum(){
                var a=document.getElementById("account").value;
                if(a.length<10||a.length>12){
                //console.log("hhhhhhhhhhhhhhhhhhhhhh");
                document.getElementById("messages").innerHTML="enter valid account number";
                return false;
}
            }
        </script>
</head>

<body>
<div>
		
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-4 ">
			
			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Payment</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
                                        <form:form onsubmit="return myNum()" action="">
						
						<div style="margin-bottom: 25px" >
						<label>Account No.</label>
							
                                                <input type="number" name="account" id="account" placeholder="XXXXXXXXXXXX" class="form-control" required>
                                                <span id="messages" style="color:red;"></span>
						</div>

						<div style="margin-bottom: 25px">
						<div class="row">
						<div class="col-md-6">
							<label>Exp Date</label>
                                                        <input type="number" name="Expiry" placeholder="MM/YY" class="form-control" required />
						</div>
						<div class="col-md-6">
							<label>CCV</label>
                                                        <input type="number" name="ccv" placeholder="???" class="form-control" required >
						</div>
						</div>
						</div>

						<div style="margin-top: 10px" class="form-group">						
							<div class="col-sm-6 controls">
                                 <input class="btn btn-success" type="submit"  value="PAY(${Price})"/>
							</div>
						</div>

					</form:form>

				</div>

			</div>

		</div>

	</div>
</body>

</html>
