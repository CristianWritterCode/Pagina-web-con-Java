<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<%

	String correo=request.getParameter("correo");
	String contraseña=request.getParameter("contraseña");

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection miConexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbdd_pagwebjava","root","");
	
	PreparedStatement c_preparada=miConexion.prepareStatement("SELECT * FROM REGISTROUSUARIO WHERE CORREO=? AND CONTRASEÑA=?");
	
	c_preparada.setString(1, correo);
	c_preparada.setString(2, contraseña);
	
	ResultSet miResultset=c_preparada.executeQuery();
	
	if (miResultset.absolute(1)) {
        out.println("Usuario autorizado");
    } else{
        out.println("No hay usuario con esos datos");
    }

%>

</body>
</html>