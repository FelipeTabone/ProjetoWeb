package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dao;
import model.JavaBeans;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = { "/controller", "/main", "/insert", "/select", "/update", "/delete" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Dao dao = new Dao();
	JavaBeans client = new JavaBeans();

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if (action.equals("/main")) {
			Clients(request, response);
		} else if (action.equals("/insert")) {
			Create(request, response);
		} else if (action.equals("/select")) {
			List(request, response);
		} else if (action.equals("/update")) {
			UpdateClient(request, response);
		} else if (action.equals("/delete")) {
			DeleteClient(request, response);
		} else {
			response.sendRedirect("index.html");
		}
	}

	protected void Clients(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<JavaBeans> list = dao.listClients();
		request.setAttribute("Clients", list);
		RequestDispatcher rd = request.getRequestDispatcher("client.jsp");
		rd.forward(request, response);
	}

	protected void List(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			client.setId(id);
			dao.getClientById(client);

			request.setAttribute("id", client.getId());
			request.setAttribute("name", client.getName());
			request.setAttribute("personType", client.getPersonType());
			request.setAttribute("address", client.getAddress());
			request.setAttribute("registration", client.getRegistration());
			request.setAttribute("enrollmentModality", client.getEnrollmentModality());
			RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException e) {
			id = 0;
		}
	}

	protected void Create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int registration;
		try {
			String getRegistration = request.getParameter("registration");
			registration = Integer.parseInt(getRegistration);
			client.setName(request.getParameter("name"));
			client.setPersonType(request.getParameter("personType"));
			client.setAddress(request.getParameter("address"));
			client.setRegistration(registration);
			client.setEnrollmentModality(request.getParameter("enrollmentModality"));

			dao.insertClient(client);
			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			registration = 0;
		}
	}

	protected void UpdateClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int registration;
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			client.setId(id);

			String getRegistration = request.getParameter("registration");
			registration = Integer.parseInt(getRegistration);
			client.setName(request.getParameter("name"));
			client.setPersonType(request.getParameter("personType"));
			client.setAddress(request.getParameter("address"));
			client.setRegistration(registration);
			client.setEnrollmentModality(request.getParameter("enrollmentModality"));
			dao.updateClient(client);
			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			registration = 0;
			id = 0;
		}

	}

	protected void DeleteClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			client.setId(id);
			dao.deleteClient(client);
			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			id = 0;
		}
	}
}
