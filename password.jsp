<%@page import="java.sql.*" %>
<%! Connection con ;
PreparedStatement ps ;
ResultSet rs ;%>	
<%				boolean valid=false;
				String email=(String)session.getAttribute("obj");
				String old=request.getParameter("old");
				String new1=request.getParameter("new");
				String new2=request.getParameter("new1");
				
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");

				ps=con.prepareStatement("select * from details where email="+email);
				rs=ps.executeQuery();
                while(rs.next())
				{
					if(old.equals(rs.getString("password")))
				
					valid=true;
%>				
				
<%			if(valid)
			{
				ps=con.prepareStatement("update details set password="+new1+" where email="+email);
				ps.executeUpdate();
			}
				}
	}
		catch(Exception e)
		{
%>
	 <%=e%><%
	 }
	 %>