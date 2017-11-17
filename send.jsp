<%@page import="java.sql.*,java.util.Date" %>

<%! Connection con ;
PreparedStatement ps ;
ResultSet rs ;%>	
<%		
		String from=(String)session.getAttribute("obj");
		String to=request.getParameter("to");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		Date d=new Date();
		String dd=d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900)+","+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		
		String status="false";
		
		
		boolean valid1=true;
		boolean valid2=true;
		
		if(to.equals(""))
		{
			valid1=false;
			
		}
		
		if(message.equals(""))
		{
			valid2=false;
			
		}
		if(valid1==true&&valid2==true)
		{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");

				ps=con.prepareStatement("insert into messdetails(from1,to1,subject,message,date,status) values(?,?,?,?,?,?)");
				
				ps.setString(1,from);
				ps.setString(2,to);
				ps.setString(3,subject);
				ps.setString(4,message);
				ps.setString(5,dd);
				ps.setString(6,status);
				
				ps.executeUpdate();
				
				Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");

				ps=con.prepareStatement("insert into sentdetails(from1,to1,subject,message,date) values(?,?,?,?,?)");
				
				ps.setString(1,from);
				ps.setString(2,to);
				ps.setString(3,subject);
				ps.setString(4,message);
				ps.setString(5,dd);
				
				
				ps.executeUpdate();
%>				
<script> alert("Message sent")	</script>				
				
				<jsp:include page="compose.jsp"/>
<%				
		}
		
		catch(Exception e)
		{
%>			
		<%= e %>
<%		
		}
		}
		else if(valid1==false)
		{
			
%>			
			<script> alert("To cannot be empty")	</script>	
			
			<jsp:include page="compose.jsp"/>
<%			
			}
			else if(valid2==false)
		{
%>
	<script> alert("Message cannot be empty")	</script>	
			
			<jsp:include page="compose.jsp"/>
<%       }
%>			