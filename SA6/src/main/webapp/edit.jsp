<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<meta charset="utf-8">
<title>Lista de agendamentos - Editar</title>
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
		<h1>Editar meus agendamentos</h1>
		<br>
		<form name="frmClient" action="update">
			<table>
				<tr>
					<th class="th">Id</th>
					<td><input type="text" name="id" readonly class="Caixa1"
						value="<%out.print(request.getAttribute("id"));%>"></td>
				</tr>
				<tr>
					<th class="th">Data</th>
					<td><input type="text" name="date" class="Caixa1"
						value="<%out.print(request.getAttribute("date"));%>"></td>
				</tr>
				<tr>
					<th>Horário</th>
					<td><input type="text" name="time" class="Caixa1"
						value="<%out.print(request.getAttribute("time"));%>"></td>
				</tr>
			</table>
			<br> <input type="button" value="Salvar" class="btn btn-primary"
				onclick="validator()"> <a href="main"
				class="btn btn-secondary">Voltar</a>
		</form>
	</div>
	<script src="scripts/validator.js"></script>
	<script src="scripts/confirmation.js"></script>
</body>
</html>


