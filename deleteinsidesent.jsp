

<%@page import="java.sql.*" %>
<%! Connection con ;
PreparedStatement ps ;
ResultSet rs ;%>
	
<%
    int messid=Integer.parseInt(request.getParameter("messidhid"));
	try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");
			ps=con.prepareStatement("delete from sentdetails where messid=?");
			ps.setInt(1,messid);
			ps.executeUpdate();
		
%>		<jsp:forward page="sentmain.jsp"/>
<%		
		}
		catch(Exception e)
		{
%>			
		<%= e %>
		<% } %>