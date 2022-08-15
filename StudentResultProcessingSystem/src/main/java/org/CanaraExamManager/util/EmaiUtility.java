package org.CanaraExamManager.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Date;
import java.util.Properties;



public class EmaiUtility {
	
	public static String sendEmail(String toAddress,String subject, String message) throws AddressException, MessagingException {
		
		final String userName = "rahuljmusic99@gmail.com"; 
		final String password = "asfwfqrevulpffrj";
		String host = "smtp.gmail.com";
		String port = "587";
		
		//Set SMTP Server Properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		//Create a new session with and authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
		
		Session session = Session.getInstance(properties,auth);
		
		Message msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setContent(message,"text/html");
		
		//Send the email
		Transport.send(msg);
		
		
		return "SUCCESS";
	}
}
