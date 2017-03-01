<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%final URL url = new URL("http://www.google.com");
final URLConnection conn = url.openConnection();
System.out.println("hellllllllllll"+conn);
%>