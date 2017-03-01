    <link href="Styles/started.css" rel="stylesheet" type="text/css">
  <title>ColloQuy</title>
<body style="background-image: url(Images/start.png); background-repeat:no-repeat;">
    
    <script type="text/javascript">
        function validate()
        {
       var email=document.getElementById("email").value;
      var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      try{    if(document.getElementById("email").value==0)
		{	alert(" Please enter a valid email id ");
            			document.getElementById("email").focus();
             			return false;
	  	}                 
                else  if(!(email.match(mailformat)))
                {  
                    alert("You have entered an invalid email address!");  
                    document.frm.getElementById("email").focus();
                    return false;  
                }                 
          }catch(e)
            {
//                alert("Error............ "+e);
        	return false;
            }
	return true;
}
function validate1()
        {
       var semail =document.getElementById("remail").value;
          var pass =document.getElementById("password").value;
      var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      try{    if(!(semail.match(mailformat)))
                {  
                    alert("You have entered an invalid email address!");  
                    document.getElementById("email").focus();
                    return false;  
                }
                if(pass.length<4 || pass.length>10)
		{	        
			alert("Password should contain Min 5 & Max 10 ");
			document.getElementById("password").focus();
			return false;
	  	}  
                
          }catch(e)
            {
//                alert("Error............ "+e);
        	return false;
            }
	return true;
}
function checkAlphabets(str)
{
	for (var i = 0; i < str.length; i++)
	{       var ch = str.substring(i, i + 1);
		if(((ch < "a" || "z" < ch) && (ch < "A" || "Z" < ch))&& (ch!=" ")) 

		{return true;
		}
	}
	return false;
}

function checkNumber(str)
{
	for (var i = 0; i < str.length; i++)
	{
		var ch = str.substring(i, i + 1);
		if((ch<"0")||(ch>"9"))
		{
			return true;
		}
	}
	return false;
}
</script>
  
    <form name="frm"  action="LoginCheck.jsp"  onsubmit="return validate();">
        <div style=" margin: 50px 0 0 850px; position:absolute;">
               <table><tr><th align="left" ><font color="#000099">Email</font></th><th align="left"><font color="#000099">Pasword</font></th></tr>
                   <tr><td><input type="text" id="email" name="uid"style="background-color:white " height="50px" width="50px" size="20px" required=""></td>
                       <td><input type="password"  name="password" style="background-color:white " height="50px" width="50px" size="20px" required=""></td>
                    <td><input type="submit" style="font-face:'Comic Sans MS'; font-size: medium; color: white; background-color: #000099; border: 1pt ridge lightgrey" value="Login"></td>
                </tr>
           </table>
        </div>
    </form>
                <table class="middle1" cellspacing="10px">
                <tr><th style=" color:skyblue ;font-style: Bookmanold " > 
                        <%
                      String status=request.getParameter("status");
                        if(status!=null)
                         out.println(status);
                        %>
                    </th></tr></table><br><br>
    <form action="Register.jsp" >
            <table class="middle" cellspacing="10px">
                 <tr><th align="left" ><font color="#000099" style="BookmanOld" size="100px">Sign Up</font></th></tr>
                <tr><td><input type="text"  name="name" size="40px" placeholder="Enter Name" required=""></td></tr>
                <tr><td><input type="text" id="remail" name="uid" size="40px" placeholder="Enter User Email" required=""></td></tr>
                <tr><td><input type="password" id="password" name="password"   size="40px" placeholder="Enter New Password" required=""></td></tr>
                <tr><td><input type="radio" name="gender" value="female" required >female<input type="radio" name="gender" value="male">male</td></tr>
                <tr><td><input type="submit" style="font-face: 'Comic Sans MS'; font-size: large; color: white; background-color: #000099; border: 1pt ridge lightgrey" value=" sign up " onclick="validate1()"></td></tr>
                </table>
    </form>
</body>
