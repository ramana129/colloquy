<%@page import="ColloQuy.DAO"%>
<?xml version="1.0" encoding="UTF-8"?>
<html>
<head>
    <title>ColloQuy</title>
<link rel="stylesheet" type="text/css" href="Styles/autumn05.css" />
</head>
<body>
<div id="container" >
<%
String uid=(String)session.getAttribute("uid");
if(uid==null)
{response.sendRedirect("index.jsp");
}
DAO dao=new DAO();
String uname=dao.getName(uid);
%>
  <div id="navarea">
      <div class="name"><img src="Images/user.png"/>&nbsp;&nbsp;<%=uname%></div>
         <ul id="nav">
         <li><a href="UserHome.jsp">Home</a></li>
         <li><a href="Topics.jsp" >Topics</a></li>
         <li><a href="EditProfile.jsp" >Edit </a></li>
         <li><a href="Post.jsp" >Post</a></li>
         <li><a href="Logout.jsp" >Logout</a></li>
        </ul>
  </div> <br><br><br>
  <form action="Search.jsp">
      <input type="text" name="search" placeholder="Search Here" style=" margin: 10px auto auto auto; position: fixed; border-radius:5px; background-color: #f5f5f5  ; color: #000;" height="50px" width="400px"  size="30px" required="" />
          <input type="submit" value="GO" style="background-color:#007ddd; margin: 10px auto auto 330px; position: fixed; border-radius:5px; background-color: #5BC4FD ; color: #000;" >
    </form>
          <br><br><br>
  <div id="hdr"><img src="Images/hdr_1.jpg" /></div>
 
  
