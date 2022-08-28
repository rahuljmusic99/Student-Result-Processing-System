package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;

public class UpdateDataDao {
	
	public String updateStudentData(StudentStaffDataBean studentDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String programmeId = "";
		String classId = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT A.programme_id,B.class_name,B.class_id,B.class_year FROM (programme A "
											+ "INNER JOIN class B ON A.programme_id = B.programme_id) "
											+ "WHERE A.programme_id = "+studentDataBean.getProgramme().trim()+" "
											+ "AND B.class_name = '"+studentDataBean.getclass().trim()+"' "
											+ "AND B.class_year = "+studentDataBean.getClassYear().trim()+" ");
				while(resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id").trim();
					classId = resultSet.getString("class_id").trim();
				}
				
					if(programmeId!="" && classId!="") {
						
						resultSet = null;
						resultSet = statement.executeQuery("SELECT * FROM student WHERE reg_no =  "+studentDataBean.getRegNo()+"");
						
						if(resultSet.next() == true) { //check whether student with that register number already exists
							
							query = "UPDATE student SET reg_no = ?, first_name = ?, last_name = ?, gender = ?, dob = ?,email = ?,"
									+ "phone = ?, address = ?,birth_place = ?,birth_district = ?,birth_state = ?,"
									+ "pincode = ?, programme_id = ?, class_id = ?, joining_year = ?, semester = ?, status = ? "
									+ "WHERE reg_no = "+studentDataBean.getRegNo().trim()+"";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1,studentDataBean.getRegNo().trim());//1
							preparedStatement.setString(2,studentDataBean.getfirstName().replaceAll("\\s+"," ").trim());//2
							preparedStatement.setString(3,studentDataBean.getLastName().replaceAll("\\s+"," ").trim());//3
							preparedStatement.setString(4,studentDataBean.getGender().trim());//4
							preparedStatement.setString(5,studentDataBean.getDOB());//5
							preparedStatement.setString(6,studentDataBean.getEmail().trim());//6
							preparedStatement.setString(7,studentDataBean.getPhone().trim());//7
							preparedStatement.setString(8,studentDataBean.getAddress().replaceAll("\\s+"," ").trim());//8
							preparedStatement.setString(9,studentDataBean.getCity().replaceAll("\\s+"," ").trim());//9
							preparedStatement.setString(10,studentDataBean.getDistrict().replaceAll("\\s+"," ").trim());//10
							preparedStatement.setString(11,studentDataBean.getState().replaceAll("\\s+"," ").trim());//11
							preparedStatement.setString(12,studentDataBean.getPinCode().trim());//12
							preparedStatement.setString(13,programmeId);//13
							preparedStatement.setString(14,classId);//14
							preparedStatement.setString(15,studentDataBean.getYear().trim());//15
							preparedStatement.setString(16,studentDataBean.getCurrentSemester().trim());//16
							preparedStatement.setString(17,"true");//17
							
							preparedStatement.execute();
							
						}else {
							
							return "Student with the Register Number "+studentDataBean.getRegNo()+" Does Not Exists";
						}
					
					}else {
						
						return "No such Programme/Class Found";
					}
				
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESSUPDATE";
	}
	
	
	
//	Method for updating Staff Data
	
	public String updateStaffData(StudentStaffDataBean staffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		
		try {
			
			con = DBConnection.createConnection();
				query = "UPDATE staff SET first_name = ?, last_name = ?, gender = ?, email = ?,"
						+ "phone = ?, address = ?, programme_id = ?, staff_status = ?, staff_id = ?, role = ? "
						+ "WHERE staff_id = "+staffDataBean.getTemp().trim()+"";
				preparedStatement = con.prepareStatement(query);
				
				preparedStatement.setString(1, staffDataBean.getfirstName().trim());//1
				preparedStatement.setString(2, staffDataBean.getLastName().trim());//2
				preparedStatement.setString(3, staffDataBean.getGender().trim());//3
				preparedStatement.setString(4, staffDataBean.getEmail().trim());//4
				preparedStatement.setString(5, staffDataBean.getPhone().trim());//5
				preparedStatement.setString(6, staffDataBean.getAddress().replaceAll("\\s+"," ").trim());//6
				preparedStatement.setString(7, staffDataBean.getProgramme().trim());//7
				preparedStatement.setString(8, "true");//8
				preparedStatement.setString(9, staffDataBean.getStaffId().trim());//9
				preparedStatement.setString(10, staffDataBean.getRole().trim());
				
				preparedStatement.execute();
					
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESSUPDATE";
	}
	
	
	
	
//	Method for updating Programme Data	
	
public String updateProgrammeData(ProgrammeCourseClassBean programmeDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		
		try {
				con = DBConnection.createConnection();
					query = "UPDATE programme SET programme_name = ?, programme_duration = ?, programme_sem = ? "
							+ "WHERE programme_id = "+programmeDataBean.getProgrammeId().trim()+"";
					preparedStatement = con.prepareStatement(query);
					
					preparedStatement.setString(1, (programmeDataBean.getProgrammeName().toUpperCase()).replaceAll("\\s+"," ").trim());//1
					preparedStatement.setString(2, programmeDataBean.getProgrammeDuration().trim());//2
					preparedStatement.setString(3, programmeDataBean.getSemester().trim());//3
					
					preparedStatement.execute();
					
						
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESSUPDATE";
	}




//Method for updating Course Data

	public String updateCourseData(ProgrammeCourseClassBean courseDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			con = DBConnection.createConnection();
							
							query = "UPDATE course SET course_code = ?,course_name = ?,course_type = ?,course_group = ?,course_sem = ?,max_marks = ?, "
									+ "min_marks = ?, max_IA = ? WHERE course_code = '"+courseDataBean.getTemp().replaceAll("\\s+"," ").trim()+"'";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1, (courseDataBean.getCourseCode().toUpperCase()).replaceAll("\\s+"," ").trim());
							preparedStatement.setString(2, (courseDataBean.getCourseName().toUpperCase()).replaceAll("\\s+"," ").trim());
							preparedStatement.setString(3, courseDataBean.getCourseType().trim());
							preparedStatement.setString(4, courseDataBean.getCourseGroup().trim());
							preparedStatement.setString(5, courseDataBean.getSemester().trim());
							preparedStatement.setString(6, courseDataBean.getMaxMarks().trim());
							preparedStatement.setString(7, courseDataBean.getMinMarks().trim());
							preparedStatement.setString(8, courseDataBean.getMaxIA().trim());
							
							preparedStatement.execute();

			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	

	
	
	
//Method for updating class data
	
	public String updateClassData(ProgrammeCourseClassBean classDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String programmeId = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_name = '"+(classDataBean.getProgrammeName().toUpperCase()).trim()+"'");
				
				while (resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id").trim();
				}
				if(programmeId != "") {
							
							resultSet = null;
							resultSet = statement.executeQuery("SELECT * FROM class WHERE class_name = '"+classDataBean.getClassName().toUpperCase()+"' "
															+ "AND class_year = "+classDataBean.getClassYear()+"");
							
							if(resultSet.next()==false) {
								
								query = "UPDATE class SET class_name = ?, programme_id = ?, class_year = ? WHERE class_id = "+classDataBean.getClassId().trim()+"";
								preparedStatement = con.prepareStatement(query);
								
								preparedStatement.setString(1, (classDataBean.getClassName().toUpperCase()).trim());
								preparedStatement.setString(2, programmeId);
								preparedStatement.setString(3, classDataBean.getClassYear().trim());
							
								preparedStatement.execute();
							}else {
								
								return "Class "+classDataBean.getClassName()+" "+classDataBean.getClassYear()+" Year Already Exists";
								
							}
							
						}else {
							
							return "Programme '"+(classDataBean.getProgrammeName().toUpperCase()).trim()+"' 'Programme ID: "+programmeId+"' Already Exists";
						}
					
				
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESSUPDATE";
	}
}
