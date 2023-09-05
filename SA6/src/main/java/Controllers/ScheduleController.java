package Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dao;
import model.JavaBeans;
import model.ModelLogin;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = { "/controller", "/main", "/insert", "/select", "/update", "/delete", "/login" })
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Dao dao = new Dao();
	JavaBeans schedule = new JavaBeans();

	public ScheduleController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if(action.equals("/login")) {
			Login(request, response);
		}else if (action.equals("/main")) {
			Schedule(request, response);
		} else if (action.equals("/insert")) {
			Create(request, response);
		} else if (action.equals("/select")) {
			List(request, response);
		} else if (action.equals("/update")) {
			UpdateClient(request, response);
		} else if (action.equals("/delete")) {
			DeleteSchedule(request, response);
		} else {
			response.sendRedirect("index.html");
		}
	}

	protected void Schedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<JavaBeans> list = dao.ListSchedule();
		request.setAttribute("Schedules", list);
		RequestDispatcher rd = request.getRequestDispatcher("client.jsp");
		rd.forward(request, response);
	}

	protected void Create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			schedule.setDate(request.getParameter("date"));
			schedule.setTime(request.getParameter("time"));

			System.out.print(schedule);
			dao.InsertSchedule(schedule);

			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			schedule = null;
		}
	}

	protected void List(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			schedule.setId(id);
			dao.GetScheduleById(schedule);

			request.setAttribute("id", schedule.getId());
			request.setAttribute("date", schedule.getDate());
			request.setAttribute("time", schedule.getTime());
			RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException e) {
			id = 0;
		}
	}

	protected void UpdateClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			schedule.setId(id);

			schedule.setDate(request.getParameter("date"));
			schedule.setTime(request.getParameter("time"));
			dao.UpdateSchedule(schedule);
			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			
		}
	}
	
	protected void DeleteSchedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id;
		try {
			String idParam = request.getParameter("id");
			id = Integer.parseInt(idParam);
			schedule.setId(id);
			dao.DeleteSchedule(schedule);
			response.sendRedirect("main");
		} catch (NumberFormatException e) {
			id = 0;
		}
	}

	protected void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		if (user != null && !user.isEmpty() && password != null && !password.isEmpty()) {
			ModelLogin usuario1 = new ModelLogin();
			usuario1.setUser(user);
			usuario1.setPassword(password);
			
			request.getSession().setAttribute(user, usuario1.getUser());
			RequestDispatcher redirecionar = request.getRequestDispatcher("schedule/index.html");
			redirecionar.forward(request, response);
		}else {
			RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			request.setAttribute("mensagem", "Informe o Usu�rio e Senha corretamenet!!!");
			redirecionar.forward(request, response);
		}
	}
	
}