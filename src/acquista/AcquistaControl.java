package acquista;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AcquistaControl
 */
public class AcquistaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static AcquistaModel model;
	static {
		model = new AcquistaModelDM();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AcquistaControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String azione = request.getParameter("azione");
		if (azione.equalsIgnoreCase("insert")) {
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			String email = (String) request.getSession().getAttribute("email");
			try {
			    response.sendRedirect("http://localhost:8080/FarmaciaAmica/conferma.jsp");
				model.doSave(email, cart);
			    request.getSession().removeAttribute("cart");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (azione.equalsIgnoreCase("leggi")) {
			String email = (String) request.getSession().getAttribute("email");
			try {
				request.setAttribute("prodotti2", model.leggi(email));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ordini.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
