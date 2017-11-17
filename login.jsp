<%@page import="java.sql.*" %>
<%
	        
			
			boolean valid1=false;
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
%>
<jsp:useBean id="l" class="pack.Login">
<jsp:setProperty name="l" property="email" value="<%=email%>" />
<jsp:setProperty name="l" property="password" value="<%=password%>" />
</jsp:useBean>
<%
			valid1=l.getLogin();
			if(valid1)
			{
				session.setAttribute("obj",email);
							
%>		
			    
			<jsp:forward page="opening.jsp"/>				
<%}
			else
			{
%>				
				<script> alert("Username/Password error ")	</script>		
				<jsp:include page="index.htm"/>	
<%			}
			%>