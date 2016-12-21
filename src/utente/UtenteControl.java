package utente;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UtenteControl
 */
public class UtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UtenteModel model;
	static {
		model = new UtenteModelDM();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UtenteControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String azione = request.getParameter("azione");
		if (azione.equalsIgnoreCase("registrati")) {
			String email = request.getParameter("email");
			request.removeAttribute("done");
			try {
				request.setAttribute("done", model.Email(email));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String password = request.getParameter("password");
			int cap = Integer.valueOf(request.getParameter("cap"));
			String via = request.getParameter("via");
			int civico = Integer.valueOf(request.getParameter("civico"));
			String citta = request.getParameter("citta");
			String provincia = request.getParameter("provincia");
			Date data_nascita = Date.valueOf(request.getParameter("data_nascita"));
			UtenteBean bean = new UtenteBean();
			bean.setEmail(email);
			bean.setNome(nome);
			bean.setCognome(cognome);
			bean.setPassword(password);
			bean.setCap(cap);
			bean.setVia(via);
			bean.setCivico(civico);
			bean.setCitta(citta);
			bean.setProvincia(provincia);
			bean.setData_nascita(data_nascita);
			try {
				if (model.Email(email).equals("false"))
					model.doSave(bean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registrazione.jsp");
			dispatcher.forward(request, response);
		}
		
	
		if (azione.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			//response.resetBuffer();
			if ((email != null) && (password != null)) {
				try {
					if (model.login(email, password).equals("true")) {
						String redirectedPage = "/product2";
						response.sendRedirect(request.getContextPath() + redirectedPage);
						request.getSession().setAttribute("email", email);
					} else {
						response.sendRedirect("login.jsp?done=no");
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		else if(azione.equalsIgnoreCase("logout")){
	        request.getSession().invalidate();
	        String redirectedPage="/product2";
	        response.sendRedirect(request.getContextPath() + redirectedPage);
			}
		else if(azione.equalsIgnoreCase("leggi")){
			String email = (String)request.getParameter("email");
			request.removeAttribute("utente");
			try {
				request.setAttribute("utente", model.LeggiUtente(email));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher2 = getServletContext().getRequestDispatcher("/modificadati.jsp");
			dispatcher2.forward(request, response);
		}
		else if(azione.equalsIgnoreCase("update")){
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String password = request.getParameter("password");
			int cap = Integer.valueOf(request.getParameter("cap"));
			String via = request.getParameter("via");
			int civico = Integer.valueOf(request.getParameter("civico"));
			String citta = request.getParameter("citta");
			String provincia = request.getParameter("provincia");
			Date data_nascita = Date.valueOf(request.getParameter("data_nascita"));
			String email = (String) request.getSession().getAttribute("email");
			UtenteBean bean = new UtenteBean();
			bean.setEmail(email);
			bean.setNome(nome);
			bean.setCognome(cognome);
			bean.setPassword(password);
			bean.setCap(cap);
			bean.setVia(via);
			bean.setCivico(civico);
			bean.setCitta(citta);
			bean.setProvincia(provincia);
			bean.setData_nascita(data_nascita);
			try {
				response.sendRedirect(request.getContextPath() +"/areautente.jsp?esito=yes");
				model.doUpdate(bean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
