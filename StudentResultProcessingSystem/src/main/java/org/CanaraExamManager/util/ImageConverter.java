package org.CanaraExamManager.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

import org.CanaraExamManager.bean.LoginBean;



public class ImageConverter {

	public void base64Converter(LoginBean loginBean) throws SQLException, IOException {
		
		Blob blob = loginBean.getUserImage();
		InputStream inputStream = blob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		
		while ((bytesRead = inputStream.read(buffer)) != -1) {
		    outputStream.write(buffer, 0, bytesRead);
		}
		 
		byte[] imageBytes = outputStream.toByteArray();
		 
		String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		loginBean.setUserImageString(base64Image);
		 
		inputStream.close();
		outputStream.close();

	}
	
}
