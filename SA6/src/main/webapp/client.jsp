<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.JavaBeans"%>
<%
@SuppressWarnings("unchecked")
ArrayList<JavaBeans> list = (ArrayList<JavaBeans>) request.getAttribute("Schedules");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Clientes</title>
<link rel="stylesheet" href="style02.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h1 class="display-5" style="color: #3498db;">
			MaxSystem
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-award-fill" viewBox="0 0 16 16">
				<path
					d="m8 0 1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z" />
				<path
					d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
			</svg>
		</h1>
		<i class="bi bi-universal-access"></i>
	</div>
	<hr>
	<div class="container">
		<h1 class="title">Meus agendamentos</h1>
		<br>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Data</th>
					<th scope="col">Horário</th>
					<th scope="col">Opções</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getDate()%></td>
					<td><%=list.get(i).getTime()%></td>
					<td><a href="select?id=<%=list.get(i).getId()%>"
						class="btn btn-primary">Editar</a> <a
						href="javascript: confimation(<%=list.get(i).getId()%>)"
						class="btn btn-danger">Excluir</a></td>
				</tr>
				<%
				}

				}
				%>
			</tbody>
		</table>
		<a href="new.html" class="btn btn-primary">Novo agendamento</a>
		<a href="javascript:history.back()" class="btn btn-secondary">Voltar</a>
	</div>
	<script src="scripts/confirmation.js"></script>
</body>
</html>