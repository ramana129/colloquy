<%@include file="UserHead.jsp" %>
 <div id="maincol">
     <br>
     <div class="mid"><form action="Mechanical.jsp" method="post">
                <h1><u>Mechanical</u></h1>
                    <table><tr><td><input type="checkbox" name="mhermal">Thermal Engg &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="checkbox" name="production" >Production Tech</td></tr>
                      <tr><td><input type="checkbox" name="machine" >Machine Design&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="checkbox" name="automobile">Automobile Engg</td></tr>
                        <tr><td></td><td><input type="submit" value="Submit"></td></tr> 
                    </table>
                    </form>
          <%
    String method=request.getMethod();
    if(method.equalsIgnoreCase("post"))
        {
        String mhermal=request.getParameter("mhermal");
        String production=request.getParameter("production");
        String machine=request.getParameter("machine");
        String automobile=request.getParameter("automobile");
        out.println(mhermal+"____"+production+"___"+machine+"____"+automobile);
        }
%> 
     </div>
  </div>
<%@include file="Footer.jsp" %>