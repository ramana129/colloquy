<link rel="stylesheet" type="text/css" href="Styles/autumn05.css">
<%@include file="UserHead.jsp"%>
 <div id="maincol">
<!--<hr>-->
     <div class="mid">
  <%        String status=request.getParameter("status");
     if(status!=null)
         out.println(status);
  %>

         <form action="Post.jsp" method="post">
             <table><tr>
                      <td class="co">
                         <select name="cate" required="" >
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
                                <option value="23">Automobile Engg</option>
              </td>
                    </tr>
                    <tr><td><textarea name="post" required=""></textarea></td></tr>
                <tr><td class="co"><input type="submit" value="Submit"></td></tr>
             </table>  
         </form>
  <%
    String method=request.getMethod();
    if(method.equalsIgnoreCase("post"))
        {
        String cate=request.getParameter("cate");
        String post=request.getParameter("post");
        if(dao.setPost(uid,cate,post));
          {     response.sendRedirect("Post.jsp?status=<h1>Posted Successfully</h1>");
               }
        }
%>
     </div>
  </div>
<%@include file="Footer.jsp" %>
