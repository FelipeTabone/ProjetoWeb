package Controllers;

import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AuthenticationController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String usuarioLogado = (String) session.getAttribute("user");
		String urlAcessada = req.getServletPath();
		
		if (usuarioLogado == null && !urlAcessada.equals("/SchedulerGym/login")) {
			RequestDispatcher redireciona = request.getRequestDispatcher("index.jsp?url=" + urlAcessada);
			request.setAttribute("mensagem", "Por Favor, realizar login!!!");
			redireciona.forward(request, response);
			return;
		}else {
			chain.doFilter(request, response);
		}		
	}
}
