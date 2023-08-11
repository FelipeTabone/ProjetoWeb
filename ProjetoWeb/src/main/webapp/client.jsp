<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.JavaBeans"%>
<%
@SuppressWarnings("unchecked")
ArrayList<JavaBeans> list = (ArrayList<JavaBeans>) request.getAttribute("Clients");
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
<style>
* {
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	color: #fff;
	text-align: center;
}

.botaoNovoCliente {
	text-decoration: none;
	background-color: #0000FF;
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
}

.divButton {
	margin-top: 1rem;
	height: 3rem;
	margin-left: 71rem;
}

.divButton {
	margin-top: 1rem;
	height: 3rem;
	margin-left: 71rem;
}

.botao2 {
	text-decoration: none;
	background-color: #d51213;
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
}

.botao1 {
	text-decoration: none;
	background-color: #66bbff;
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
}

.title {
	margin-right: 71rem;
	font-size: 32px;
	margin-bottom: 20px;
	color: #000000;
}

body {
	background-color: #e3f2fd;
	overflow: hidden;
	position: relative;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="display-5" style="color: #3498db;">
			ShoesHappy
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-award-fill" viewBox="0 0 16 16">
				<path
					d="m8 0 1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z" />
				<path
					d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
			</svg>
		</h1>
		<i class="bi bi-universal-access"></i>
		<nav class="navbar" style="background-color: #e3f2fd;">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.html">Inicio</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="nav-link" href="new.html">Cadastrar cliente</a></li>
						<li class="nav-item"><a class="nav-link" href="main">Clientes</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<hr>
	<br>
	<div class="container">
		<br>
		<h1 class="title">Clientes</h1>
		<div class="divButton">
			<a href="new.html" class="botaoNovoCliente">Novo cliente</a>
		</div>
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Nome</th>
					<th scope="col">Tipo pessoa</th>
					<th scope="col">Endereço</th>
					<th scope="col">Matricula</th>
					<th scope="col">Tipo da matricula</th>
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
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getPersonType()%></td>
					<td><%=list.get(i).getAddress()%></td>
					<td><%=list.get(i).getRegistration()%></td>
					<td><%=list.get(i).getEnrollmentModality()%></td>
					<td><a href="select?id=<%=list.get(i).getId()%>"
						class="botao1">Editar</a> <a
						href="javascript: confimation(<%=list.get(i).getId()%>)"
						class="botao2">Excluir</a></td>
				</tr>
				<%
				}

				}
				%>
			</tbody>
		</table>
	</div>
	<div class="matrix-animation"></div>
	<script src="scripts/confirmation.js"></script>
	<script>
		// creating the canvas element
		const canvas = document.createElement("canvas");
		const context = canvas.getContext("2d");

		// setting the canvas size
		const width = (canvas.width = window.innerWidth);
		const height = (canvas.height = window.innerHeight);

		// defining how many columns to print based on canvas width and font size
		const columns = width / fontSize;

		// creating an array of drops to each column
		const drops = [];

		// starting every drop at a y=1 position
		for (let x = 0; x < columns; x++) {
			drops[x] = 1;
		}

		// drawing the characters
		function draw() {
			// painting the background
			// the trick here is to use opacity
			// so it will fade out with time
			context.fillStyle = "rgba(0, 0, 0, 0.05)";
			context.fillRect(0, 0, width, height);

			// defining font styles (color and font family/size)
			context.fillStyle = "#0F0";
			context.font = `${fontSize}px arial`;

			// drawing the characters
			for (let i = 0; i < drops.length; i++) {
				// get a random letter from the array
				const text = letters[Math.floor(Math.random() * letters.length)];

				// drawing the character
				context.fillText(text, i * fontSize, drops[i] * fontSize);

				// moving the drop to the beginning of the canvas when it reaches the bottom
				// or when the random expression is true in order to make the rain randomly
				if (drops[i] * fontSize > height && Math.random() > 0.975) {
					drops[i] = 0;
				}

				// moving the drop in the Y coordinate
				drops[i]++;
			}

			// recursive call to draw frame by frame
			window.requestAnimationFrame(draw);
		}

		draw();
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>