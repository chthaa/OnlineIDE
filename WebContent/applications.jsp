<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.defult.se.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link href="css/bootstrap.css"" rel="stylesheet"/>
</head>
<body>
	<h1>Applications</h1>

<%
	ApplicationsDAO dao = new ApplicationsDAO();

	//controller {
    String action = request.getParameter("action");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String id = request.getParameter("id");
	Application app = new Application();

	//sends "app" to create in applicationsDAO  | button sets value of action to "create"
	if("create".equals(action)) {
			double priceD = Double.parseDouble(price);
			app = new Application(name, priceD);
		dao.create(app);
		} else if("remove".equals(action)) {
			int idInt = Integer.parseInt(id);
			dao.remove(idInt);
		} else if("select".equals(action)) {
			int idInt = Integer.parseInt(id);
			app = dao.selectOne(idInt);
		} else if("update".equals(action)) {
			int idInt = Integer.parseInt(id);
			double priceD = Double.parseDouble(price);
			app = new Application(name, priceD);
			dao.update(idInt, app); //takes selected id and new data from app
		}
	
	List <Application> applications = dao.selectAll();
	//} could live inside a servlet or a class
%>	
<form action="applications.jsp">
	<input type="hidden" name="id" value="<%= app.getId() %>"/>
	<table class="table">
		<tr>
			<td><input name="name" class="form-control" value="<%= app.getName() %>"/></td>
			<td><input name="price" class="form-control" value="<%= app.getPrice() %>"/></td>
			<td>
				<button class="btn btn-success" name="action" value="create">
					Add
				</button>
				<button class="btn btn-primary" name="action" value="update">
					Update
				</button>
			</td>
		</tr>
<%	for(Application ap:applications) {     //remove or select apps
%>		<tr>
			<td><%= ap.getName() %></td>
			<td><%= ap.getPrice() %></td>
			<td>
				<a class="btn btn-danger" href="applications.jsp?action=remove&id=<%= ap.getId() %>">
					Delete
				</a>
				<a class="btn btn-warning" href="applications.jsp?action=select&id=<%= ap.getId() %>">
					Select
				</a>
			</td>
		</tr>
<% 
	}
%>	</table>

</form>

</body>
</html>