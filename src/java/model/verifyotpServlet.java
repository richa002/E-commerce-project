
package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class verifyotpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {

        final String err = "/error.jsp";
        final String succ = "/confirmotp.jsp";
   Random rand=new Random();
  int otp= rand.nextInt(9999-1000+1)+1000;
  String otpmsg=Integer.toString(otp);
        String from = "richa.luthra2011@gmail.com";
        String to ="richa.luthra2011@gmail.com";
        String subject = "OTP";
        String message =otpmsg;
        String login ="richa.luthra2011";
        String password ="naisha@canada002";

        RequestDispatcher dispatcher = request.getRequestDispatcher(succ);

        try {
            Properties props = new Properties();            
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            
            Authenticator auth = new SMTPAuthenticator(login, password);

            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);
            msg.setText(message);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);

        } catch (AuthenticationFailedException ex) {
            
            request.setAttribute("ErrorMessage", "Authentication failed");

            dispatcher = request.getRequestDispatcher(err);

        } catch (AddressException ex) {
            request.setAttribute("ErrorMessage", "Wrong email address");

            dispatcher = request.getRequestDispatcher(err);

        } catch (MessagingException ex) {
            request.setAttribute("ErrorMessage", ex.getMessage());

            dispatcher = request.getRequestDispatcher(err);
        }
        HttpSession session= request.getSession();
request.setAttribute("otpsent","yes");
session.setAttribute("otp",message);
PrintWriter out=response.getWriter();
out.println(request.getParameter("bphone"));
       dispatcher.forward(request, response);
    }

    private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
