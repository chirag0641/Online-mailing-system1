<%@page import="java.sql.*" %>
<%	
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email1")+"@webmakers.com";
		String password=request.getParameter("password1");
		String password1=request.getParameter("password2");
%>
<jsp:useBean id="u" class="pack.MyBean">
<jsp:setProperty name="u" property="email" value="<%=email%>" />
<jsp:setProperty name="u" property="password" value="<%=password%>" />
<jsp:setProperty name="u" property="firstname" value="<%=firstname%>" />
<jsp:setProperty name="u" property="lastname" value="<%=lastname%>" />
</jsp:useBean>
<%		
		boolean valid1=false;
		if(password.equals(password1))
		{
			valid1=true;
			
		}
		if(valid1==true)
		{
		
			
			if(u.getUser())
			{
%>
<script> alert("Username already exists ")	</script>				
				
				<jsp:include page="index.htm"/>
<%			}
		
			else
			{
				response.sendRedirect("index.htm");
		}
		
		}
		else
		{
			
%>			
			<script> alert("Password doesnt match ")	</script>	
			
			<jsp:include page="index.htm"/>
<%			
			}%>
	