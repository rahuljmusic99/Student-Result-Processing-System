package org.CanaraExamManager.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

import org.CanaraExamManager.bean.LoginBean;

public class ImageConverter {

	public void base64Convetion(LoginBean loginBean) {
		
//		
///		Blob blob = loginBean.getUserImage;
//		InputStream inputStream = blob.getBinaryStream();
//		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//		byte[] buffer = new byte[4096];
//		int bytesRead = -1;
//		 
//		while ((bytesRead = inputStream.read(buffer)) != -1) {
//		    outputStream.write(buffer, 0, bytesRead);
//		}
//		 
//		byte[] imageBytes = outputStream.toByteArray();
//		 
//		String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//		 
//		inputStream.close();
//		outputStream.close();		
//		
//		loginBean.setUserImageString();
	}
}
