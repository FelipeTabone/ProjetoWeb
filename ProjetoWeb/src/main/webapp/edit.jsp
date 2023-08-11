<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="style02.css">
<title>Lista de clientes - Editar</title>
<link rel="stylesheet" href="style02.css">
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

form {
	margin-bottom: 20px;
}

table {
	margin-bottom: 20px;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 10px;
	border: 1px solid #000000;
}

th {
	background-color: #333;
}

input[type="text"] {
	padding: 8px;
	border: 1px solid #000000;
	border-radius: 4px;
	transition: border-color 0.3s;
}

input[type="text"]:focus {
	outline: none;
	border-color: #0000FF;
}

input[type="button"] {
	padding: 10px 20px;
	background-color: #0000FF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="button"]:hover {
	background-color: #0000FF;
}

/* Estilo do botão "Cadastrar" */
.Botao1 {
	display: inline-block;
	margin-top: 10px;
}

/* Estilo das células da tabela */
table td {
	border-bottom: 1px solid #000000;
}

/* Estilo das células da última linha da tabela */
table tr:last-child td {
	border-bottom: none;
}

.botaoNovoCliente {
	text-decoration: none;
	background-color: rgb(0, 255, 0);
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
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
		<h1>Editar cliente</h1>
		<form name="frmClient" action="update">
			<table>
				<tr>
					<th class="th">Id</th>
					<td><input type="text" name="id" readonly class="Caixa1"
						value="<%out.print(request.getAttribute("id"));%>"></td>
				</tr>
				<tr>
					<th class="th">Nome</th>
					<td><input type="text" name="name" class="Caixa1"
						value="<%out.print(request.getAttribute("name"));%>"></td>
				</tr>
				<tr>
					<th>Tipo pessoa</th>
					<td><input type="text" name="personType" readonly
						class="Caixa1"
						value="<%out.print(request.getAttribute("personType"));%>"></td>
				</tr>
				<tr>
					<th>Endereço</th>
					<td><input type="text" name="address" class="Caixa1"
						value="<%out.print(request.getAttribute("address"));%>"></td>
				</tr>
				<tr>
					<th>Matricula</th>
					<td><input type="text" name="registration" readonly
						class="Caixa1"
						value="<%out.print(request.getAttribute("registration"));%>"></td>
				</tr>
				<tr>
					<th>Tipo da matricula</th>
					<td><input type="text" name="enrollmentModality"
						class="Caixa1"
						value="<%out.print(request.getAttribute("enrollmentModality"));%>"></td>
				</tr>
				<tr>
			</table>
			<input type="button" value="Salvar" class="botaoNovoCliente"
				onclick="validator()">
		</form>
	</div>
	<script src="scripts/validator.js"></script>
	<div class="matrix-animation"></div>
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