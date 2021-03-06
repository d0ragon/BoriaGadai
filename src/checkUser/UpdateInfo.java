package checkUser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Fteller.db.managers.UserAccountManager;
import authorization.Hasher;
import authorization.User;

/**
 * Servlet implementation class UpdateInfo
 */
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String passwordOld = request.getParameter("passwordOld");
		String passwordNew = request.getParameter("passwordNew");
		String date = request.getParameter("birthdate");
		
		String gender = request.getParameter("gender");
		String info = request.getParameter("info");
		HttpSession sess = request.getSession();
		User user = (User) sess.getAttribute("user");
		ServletContext context = getServletContext();
		UserAccountManager manager = (UserAccountManager) context.getAttribute("accountManager");

		String errorMessage = "success";
		if (passwordOld != "") {
			String hashedPassword = Hasher.generate_hash(passwordOld);
			boolean validPassword = manager.authenticateUser(user.getEmail(),
					hashedPassword);
			if (validPassword) {
				if (passwordNew.length() > 4) {
					String hashedPasswordNew = Hasher.generate_hash(passwordNew);
					manager.changeFirstName(user, name);
					manager.changeLastName(user, surname);
					manager.changeHashedPassword(user, hashedPasswordNew);
					manager.changeBirthdate(user, date);
					manager.changeGender(user, gender);
					manager.changeInfo(user, info);
					manager.changeUserName(user, username);
				} else {
					errorMessage = "shortPass";
				}
			} else {
				errorMessage = "invalidPass";
			}
		} else {
			manager.changeFirstName(user, name);
			manager.changeLastName(user, surname);
			manager.changeBirthdate(user, date);
			manager.changeGender(user, gender);
			manager.changeInfo(user, info);
			manager.changeUserName(user, username);
		}
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(errorMessage);
		out.close();
	}

}
