<%@page import="ColloQuy.ImageToMail"%>
<%@page import="ColloQuy.DAO"%>
<%
    DAO dao=new DAO();
        String qid1=request.getParameter("qid1");
        String ans=request.getParameter("ans");
        String uid=(String)session.getAttribute("uid");
               if(dao.setAnsPost(uid,qid1,ans))
                 {      String uid1=dao.getUid(qid1);
                        ImageToMail i=new ImageToMail();
                           boolean sendmail=i.sendImage(uid1,ans);
                            if(sendmail)
                                   {  response.sendRedirect("ViewPost.jsp?status1=<h1>Answered Successfully And Send Mail</h1>");   }
                            else{  response.sendRedirect("ViewPost.jsp?status1=<h1>Answered Successfully Not Send Mail Due to the Connection Problems</h1>");  }
             } else{ response.sendRedirect("ViewPost.jsp?status1=<h1>Answered Failed.</h1>");   }
             
%>