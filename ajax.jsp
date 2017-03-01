<%
String cour=request.getParameter("cour");
if(cour.equalsIgnoreCase("B.tech")){
out.println("<option value='1'>I</option>");
out.println("<option value='2'>II</option>");
out.println("<option value='3'>III</option>");
out.println("<option value='4'>IV</option>");
out.println("<option value='5'>V</option>");
out.println("<option value='6'>VI</option>");
out.println("<option value='7'>VII</option>");
out.println("<option value='8'>VIII</option>");

}
else if(cour.equalsIgnoreCase("M.Tech")){
out.println("<option value='1'>I</option>");
out.println("<option value='2'>II</option>");
out.println("<option value='3'>III</option>");
out.println("<option value='4'>IV</option>");
}
else{  out.println("");
 }    
%>