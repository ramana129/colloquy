<%@include file="UserHead.jsp" %>
 <div id="maincol">
   
     <br><br><br>
     <div class="mid">
 <%  String message=request.getParameter("message");
    if(message!=null)
out.println(message);            
%>
          <form action="EditProfile1.jsp">
              <table>
                  <tr><td></td><th>Change Your Password</th></tr>
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                  <tr><td class="co">Enter New Password</td><td><input type="password" name="password" ></td></tr>
                  <tr><td ><input type="reset" value="Reset"  ></td><td ><input type="submit" value="Submit" ></td></tr>
              </table>
          </form>
         </div>
          
  </div>
<%@include file="Footer.jsp" %>