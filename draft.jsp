<%@page import="java.util.Date,java.sql.*" %>

<%!
Connection con ;
PreparedStatement ps ;
ResultSet rs ;%>
<%		
		String from=(String)session.getAttribute("obj");
		String to=request.getParameter("to");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		Date d=new Date();
		String dd=d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900)+","+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");

				ps=con.prepareStatement("insert into draftdetails(from1,to1,subject,message,date) values(?,?,?,?,?)");
				
				ps.setString(1,from);
				ps.setString(2,to);
				ps.setString(3,subject);
				ps.setString(4,message);
				ps.setString(5,dd);
				
				
				ps.executeUpdate();
				
				%>				
<%=			
				"Saved as Draft"
%>				
				
				<jsp:include page="compose.jsp"/>
<%				
		}
		
		catch(Exception e)
		{
%>			
		<%= e %>
<%		
		}
%>