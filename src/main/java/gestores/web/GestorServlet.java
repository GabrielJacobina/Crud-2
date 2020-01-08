package gestores.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gestores.dao.GestorDao;
import gestores.model.Gestor;

/**
 * ControleServlet.java
 */

@WebServlet("/")
public class GestorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GestorDao gestorDao;
	
	public void init() {
		gestorDao = new GestorDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertGestor(request, response);
				break;
			case "/delete":
				deleteGestor(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateGestor(request, response);
				break;
			default:
				listGestor(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listGestor(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Gestor> listGestor = gestorDao.getAllGestor();
		request.setAttribute("listGestor", listGestor);
		RequestDispatcher dispatcher = request.getRequestDispatcher("gestor-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("gestor-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Gestor existingGestor = gestorDao.getGestor(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("gestor-form.jsp");
		request.setAttribute("gestor", existingGestor);
		dispatcher.forward(request, response);

	}

	@SuppressWarnings("unused")
	private void insertGestor(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String matricula = request.getParameter("matricula");
		String datan = request.getParameter("datan").replaceAll("-", "/"); String[] s = datan.split("/");
		String setor = request.getParameter("setor");
		String ndatan = s[2]+"/"+s[1]+"/"+s[0];
		Gestor newGestor = new Gestor(name, matricula, ndatan, setor);
		gestorDao.saveGestor(newGestor);
		response.sendRedirect("list");
	
	}

	private void updateGestor(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String matricula = request.getParameter("matricula");
		String datan = request.getParameter("datan").replaceAll("-", "/"); String[] s = datan.split("/");
		String setor = request.getParameter("setor");
		String ndatan = s[2]+"/"+s[1]+"/"+s[0];
		System.out.println(datan);
		
		Gestor gestor = new Gestor(id, name, matricula, ndatan, setor);
		gestorDao.updateGestor(gestor);
		response.sendRedirect("list");
	}

	private void deleteGestor(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		gestorDao.deleteGestor(id);
		response.sendRedirect("list");
	}
}
