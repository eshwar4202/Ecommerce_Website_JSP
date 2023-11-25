package ecommerce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class RemoveFilterServlet
 */
@WebServlet("/remove-filter")
public class RemoveFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			Product.RemoveFilter();
			response.sendRedirect("index.jsp");
			
			
		} 
	}

	

}
