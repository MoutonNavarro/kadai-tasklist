package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import models.validators.TaskValidator;
import utils.DBUtil;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null || _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            //Get task ID from the session scope then get only pointed one from the database
            Task t = em.find(Task.class, (Integer)(request.getSession().getAttribute("message_id")));

            //Overwrite each field by content of the form.

            String content = request.getParameter("content");
            t.setContent(content);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            t.setUpdated_at(currentTime);

            // If error(s) detected when run validation then return edit form
            List<String> errors = TaskValidator.validate(t);
            if (errors.size() > 0) {
                em.close();

                //Set default value at the form, and send error message
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("task", t);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/tasks/edit.jsp");
                rd.forward(request, response);
            }else {
                // Update database
                em.getTransaction().begin();
                em.getTransaction().commit();
                request.getSession().setAttribute("flush", "Update successful");
                em.close();

                // Delete data that no longer needed on the session scope
                request.getSession().removeAttribute("task_id");

                //Redirect to index page
                response.sendRedirect(request.getContextPath() + "/index");
            }
        }

    }

}
