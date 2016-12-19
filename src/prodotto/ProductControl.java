package prodotto;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class procuctControl2
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	static ProductModel model;
	
	static {
		model = new ProductModelDM();
}
    public ProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,ServletException, IOException {
		String action = request.getParameter("action");
		if(action!=null){
		if(action.equalsIgnoreCase("prodotto")){
		String id = request.getParameter("nomeProdotto");
		request.removeAttribute("prodotto");
		try {
			request.setAttribute("prodotto", model.doRetrieveByKey(id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/prodotto.jsp");
		dispatcher.forward(request, response);
	}
		else if(action.equalsIgnoreCase("prodotti")){
			try {
				request.setAttribute("prodotti2", model.doRetrieveAll());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher2 = getServletContext().getRequestDispatcher("/catalogo.jsp");
			dispatcher2.forward(request, response);
		}
		
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
			
			
}
}




