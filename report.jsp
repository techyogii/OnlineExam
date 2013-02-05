<%@page language="java" import="java.sql.*" %>  
<%
try 
{ 
	int mark=0,ques=1,ans=0; 
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
	Connection c = DriverManager.getConnection("jdbc:odbc:db"); 
	Statement s = c.createStatement(); 
	int s1 = Integer.parseInt(request.getParameter("t1")); 
	String s2 = request.getParameter("t2"); 
	int s3 = Integer.parseInt(request.getParameter("r1")); 
	int s4 = Integer.parseInt(request.getParameter("r2")); 
	int s5 = Integer.parseInt(request.getParameter("r3")); 
int s6 = Integer.parseInt(request.getParameter("r4")); 
int s7 = Integer.parseInt(request.getParameter("r5")); 
int s8 = Integer.parseInt(request.getParameter("r6")); 
int s9 = Integer.parseInt(request.getParameter("r7")); 
int s10 = Integer.parseInt(request.getParameter("r8")); 
int s11 = Integer.parseInt(request.getParameter("r9")); 
int s12 = Integer.parseInt(request.getParameter("r10")); 
	ResultSet rs1 = s.executeQuery("select * from quiz"); 
	while(rs1.next()) 
	{ 
		ans = rs1.getInt("ans"); 
		if(ques==1) { if(s3==ans) mark++; } 
		else if(ques==2) { if(s4==ans) mark++; } 
		else if(ques==3) { if(s5==ans) mark++; } 
else if(ques==4) { if(s6==ans) mark++; } 
else if(ques==5) { if(s7==ans) mark++; } 
else if(ques==6) { if(s8==ans) mark++; } 
else if(ques==7) { if(s9==ans) mark++; } 
else if(ques==8) { if(s10==ans) mark++; } 
else if(ques==9) { if(s11==ans) mark++; } 
else if(ques==10) { if(s12==ans) mark++; } 
		ques++; 
	} 
	int i = s.executeUpdate("Insert into db values("+s1+",'"+s2+"',"+mark+")"); 
	ResultSet rs2 = s.executeQuery("select * from db"); 
	out.println("<html><head>Mark List</head><body><br>"); 
	out.println("<table><tr><th>Number</th><th>Name</th><th>Mark</th></tr>"); 
	while(rs2.next()) 
		out.println("<tr><td>" + rs2.getInt(1) + "</td><td>" + rs2.getString(2) + "</td><td>" + rs2.getInt(3)+"</td></tr>"); 
	out.println("</table></body></html>"); 
} 
	catch(Exception e) { 
		out.println("Exception generated: "+e); 
}  %>	




