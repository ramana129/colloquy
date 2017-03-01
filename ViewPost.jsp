<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="UserHead.jsp" %>
<link rel="stylesheet" type="text/css" href="Styles/autumn05.css">
 <div id="maincol"><br><br><br><br>
   <script>
    var xmlhttp;
	function connect()
	{   try{
            if(window.XMLHttpRequest)
		{ xmlhttp=new XMLHttpRequest();
		}
		else
		{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}   
                 xmlhttp.open("POST","ALike.jsp",true);
                 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		 xmlhttp.send("aid="+document.getElementById('aid').value);      
                 xmlhttp.onreadystatechange=function()
                    {
                         if (xmlhttp.readyState==4 && xmlhttp.status==200)
                         {
                              var text=xmlhttp.responseText;
//                              array[2]= text.split("#");
//                              document.getElementById("demo").innerHTML =array[0] + "<br>" +array[1]+ "<br>"+array[2];
                         }
                    }  
                }  catch(e)
                {alert(e); }
	}
  </script>

<%  String status1=request.getParameter("status1");
        if(status1!=null)
            out.println(status1);
%>
<%  String qid=request.getParameter("status");

    if(qid==null)
        qid=(String)session.getAttribute("qid");
  session.setAttribute("qid",qid);
    ResultSet rs=dao.getQid(qid);
          while(rs.next())
          {     out.println("<p >"+rs.getString(2) +"<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:"+rs.getString(3)+"</b></p>");
                out.println("<br> <form action='ViewPost1.jsp?qid1="+rs.getString(1)+"' method=\"post\">");
                out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name=\"ans\" required></textarea>");
                out.println("<input type=\"reset\" value=\"Reset\">&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"submit\" value=\"Post\">");
                out.println("</form>");
                  out.println("<hr>");
                ResultSet rs1=dao.getAnsV(rs.getString(1));
          while(rs1.next())
            { String aid=rs1.getString(1);
                {
              String lid=dao.getLikeorNot(aid, uid);
              if(lid==null){
                   out.println("<p  style=\"text-decoration: none; font-size: 16px; color:#999\" >Answer:"+rs1.getString(2)+"<a href='ALike.jsp?aid="+rs1.getString(1)+"'>&nbsp;&nbsp;Like&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>Likes:</a>"+rs1.getString(5)+"<p style=\"text-decoration: none; font-size: 16px; margin: 0 50px auto 350px;  color:#999\" >: Answered by\""+rs1.getString(3)+"\"</p>");            
                   out.println("<hr>");
                   }
              if(lid!=null)
                     {  
                      out.println("<p  style=\"text-decoration: none; font-size: 16px; color:#999\" >Answer:"+rs1.getString(2)+"&nbsp;&nbsp;&nbsp;&nbsp;<a>Liked</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>Likes:</a>"+rs1.getString(5)+"<p style=\"text-decoration: none; font-size: 16px; margin: 0 50px auto 350px;  color:#999\" >: Answered by\""+rs1.getString(3)+"\"</p>");            
                    out.println("<hr>"); }  
              }
           }
          } 
     %> 
</div>
<%@include file="Footer.jsp"%>
<!--<form name=\"f1\"><input type=\"hidden\" name=\"aid\" value="+rs1.getString(1)+" ><input type=\"button\"  value=\"Like\" onclick=\"connect()\" ></form>-->
<!--<a href='ALike.jsp?aid="+rs1.getString(1)+"'>&nbsp;&nbsp;Like&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>Likes:</a>-->