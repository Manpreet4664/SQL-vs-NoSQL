package demo;
import java.io.IOException;
import java.net.UnknownHostException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class implementation to handle the button clicks of the jsp
 */
@WebServlet("/HandleSubmit")
public class HandleSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HandleSubmit() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String radio = request.getParameter("database");
		String projectRefrence = request.getParameter("projectReference");

		try {
			if ("mysql".equalsIgnoreCase(radio)
					&& (null != projectRefrence && !"-1".equalsIgnoreCase(projectRefrence))) {
				request.setAttribute("radioValue", radio);
				request.setAttribute("projectReference", projectRefrence);
				request.getRequestDispatcher("fetchMySqlData.jsp").forward(request, response);
			} else if ("mongodb".equalsIgnoreCase(radio)
					&& (null != projectRefrence && !"-1".equalsIgnoreCase(projectRefrence))) {
				request.setAttribute("radioValue", radio);
				request.setAttribute("projectReference", projectRefrence);
				request.getRequestDispatcher("fetchMongoDbData.jsp").forward(request, response);
			} else {
				response.sendRedirect("errorPage.jsp");
			}
		} catch (UnknownHostException e) {
			e.getMessage();
		}
	}
}
