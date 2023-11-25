package ecommerce.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/filter")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String categoryvalue;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			try (PrintWriter out = response.getWriter()) {
				 categoryvalue = request.getParameter("filter-value");
				 Product fil = new Product();
					fil.setFilter(categoryvalue);
					response.sendRedirect("index.jsp");
				 
			} 

		}
	}


