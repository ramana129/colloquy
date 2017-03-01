<%@include file="UserHead.jsp" %>
 <div id="maincol">
     <br>
     <div class="mid">
         
         <form action="Topics1.jsp" method="post">
<!--           <table><tr><td>Select Category&nbsp;&nbsp;&nbsp;<select name="Topic" required="" >
                                <option value="">Select</option>
                                <option value="1">Civil</option>
                                <option value="2">CSE,IT</option>
                                <option value="3">ECE</option>
                                <option value="4">EEE</option>
                                <option value="5">Mechanical</option>
                              </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Submit" value="Go"></td></tr>
             <tr><td></td></tr>
                 </table>-->


            <table><tr><td>
                         <select name="cate" required="">
                                <option value="" >Select</option>
                                <option value="1">Structural Engg</option>
                                <option value="2">Geotechnical Engg</option>
                                <option value="3">Transportation Engg</option>
                                <option value="4">Environmental Engg</option>
                                <option value="5">Water Resources Engg</option>
                                <option value="6">Programming</option>
                                <option value="7">Networking</option>
                                <option value="8">WebTechnologies</option>
                                <option value="9">Databases</option>
                                <option value="10">Electronic Engg</option>
                                <option value="11">Networking</option>
                                <option value="12">signalProcessing</option>
                                <option value="13">Embedded systems</option>
                                <option value="14">Electrical Circuits</option>
                                <option value="15">Electrical Machines</option>
                                <option value="16">power Systems</option>
                                <option value="17">Electrical Measurments</option>
                                <option value="18">control systems</option>
                                <option value="19">Digital Electronics</option>
                                <option value="20">Thermal Engg</option>
                                <option value="21">Production Tech</option>
                                <option value="22">Machine Design</option>
                                <option value="23">Automobile Engg</option></select></td><td>&nbsp;&nbsp;</td><td>
                            <input type="Submit" value="Go"/></td>
              </tr></table>
         </form>
         
      <%
//    String method=request.getMethod();
//    if(method.equalsIgnoreCase("post"))
//        {
//        String Topic=request.getParameter("Topic");
//               if(Topic.equalsIgnoreCase("1"))
//                 {      response.sendRedirect("Civil.jsp");
//                }
//        if(Topic.equalsIgnoreCase("2"))
//                 {      response.sendRedirect("CSE.jsp");
//                }
//        if(Topic.equalsIgnoreCase("3"))
//                 {      response.sendRedirect("ECE.jsp");
//                }
//        if(Topic.equalsIgnoreCase("4"))
//                 {      response.sendRedirect("EEE.jsp");
//                }
//         if(Topic.equalsIgnoreCase("5")) {      response.sendRedirect("Mechanical.jsp");
//                }
//         }
%> 
         
         
         
<!--         <table><tr><td><input type="checkbox" name="vehicle"></td><td><input type="checkbox" name="vehicle" ></td><td><input type="checkbox" name="vehicle" ></td><td><input type="checkbox" name="vehicle" ></td><td><input type="checkbox" name="vehicle"></td></tr>
                <tr><td><input type="checkbox" name="vehicle" ></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td></tr>
                <tr><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td><td><input type="checkbox" name="vehicle" value="Bike"></td></tr>
         </table>-->
     </div>
  </div>
<%@include file="Footer.jsp" %>