package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;

public class InsertDataDao {
	
//	Method for inserting Student Data
	
	public String insertStudentData(StudentStaffDataBean studentDataBean) {
		
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
			resultSet = statement.executeQuery("SELECT A.programme_id,B.class_name,B.class_id,B.class_year FROM (programme A "
											+ "INNER JOIN class B ON A.programme_id = B.programme_id) "
											+ "WHERE A.programme_id = "+studentDataBean.getProgramme().trim()+" "
											+ "AND B.class_name = '"+studentDataBean.getclass().trim()+"' "
											+ "AND B.class_year = "+studentDataBean.getClassYear().trim()+" ");
				while(resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id");
					classId = resultSet.getString("class_id");
				}
				
					if(programmeId!="" && classId!="") {
						
						resultSet = null;
						resultSet = statement.executeQuery("SELECT * FROM student WHERE reg_no =  "+studentDataBean.getRegNo()+"");
						
						if(resultSet.next() == false) { //check whether student with that register number already exists
							
							query = "INSERT INTO student(reg_no,first_name,last_name,gender,dob,email,phone,address,"
									+ "birth_place,birth_district,birth_state,pincode,password,programme_id,class_id,"
									+ "joining_year,semester,status)"
									+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1,studentDataBean.getRegNo().trim());//1
							preparedStatement.setString(2,studentDataBean.getfirstName().trim());//2
							preparedStatement.setString(3,studentDataBean.getLastName().trim());//3
							preparedStatement.setString(4,studentDataBean.getGender().trim());//4
							preparedStatement.setString(5,studentDataBean.getDOB().trim());//5
							preparedStatement.setString(6,studentDataBean.getEmail().trim());//6
							preparedStatement.setString(7,studentDataBean.getPhone().trim());//7
							preparedStatement.setString(8,studentDataBean.getAddress().trim());//8
							preparedStatement.setString(9,studentDataBean.getCity().trim());//9
							preparedStatement.setString(10,studentDataBean.getDistrict().trim());//10
							preparedStatement.setString(11,studentDataBean.getState().trim());//11
							preparedStatement.setString(12,studentDataBean.getPinCode().trim());//12
							preparedStatement.setString(13,studentDataBean.getPassword().trim());//13
							preparedStatement.setString(14,programmeId.trim());//14
							preparedStatement.setString(15,classId.trim());//15
							preparedStatement.setString(16,studentDataBean.getYear().trim());//16
							preparedStatement.setString(17,studentDataBean.getCurrentSemester().trim());//17
							preparedStatement.setString(18,"true");//18
							
							preparedStatement.execute();
							
						}else {
							
							return "Student with the Register Number "+studentDataBean.getRegNo()+" Already Exists";
						}
					
					}else {
						
						return "No such Programme/Class Found";
					}
				
		} catch (Exception e) {
			
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
	
//	Method for inserting Staff Data
	
	public String insertStaffData(StudentStaffDataBean staffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM staff WHERE staff_id = "+staffDataBean.getStaffId()+"");
			if(resultSet.next() == false) {//check whether staff with that staff id already exists
				
				query = "INSERT INTO staff(staff_id,first_name,last_name,gender,email,phone,address,"
						+ "password,programme_id,staff_status,role)"
						+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
				preparedStatement = con.prepareStatement(query);
				
				preparedStatement.setString(1, staffDataBean.getStaffId().trim());//1
				preparedStatement.setString(2, staffDataBean.getfirstName().trim());//2
				preparedStatement.setString(3, staffDataBean.getLastName().trim());//3
				preparedStatement.setString(4, staffDataBean.getGender().trim());//4
				preparedStatement.setString(5, staffDataBean.getEmail().trim());//5
				preparedStatement.setString(6, staffDataBean.getPhone().trim());//6
				preparedStatement.setString(7, staffDataBean.getAddress().trim());//7
				preparedStatement.setString(8, staffDataBean.getPassword().trim());//8
				preparedStatement.setString(9, staffDataBean.getProgramme().trim());//9
				preparedStatement.setString(10, "true");//10
				preparedStatement.setString(11, staffDataBean.getRole().trim());
				
				preparedStatement.execute();
					
				
			}else {
				
				return "Staff with Staff.ID "+staffDataBean.getStaffId()+" Already Exists";
				
			}
					
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
	
	
//	Method for inserting Programme Data	
	
public String insertProgrammeData(ProgrammeCourseClassBean programmeDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_id = "+programmeDataBean.getProgrammeId()+"");
			if(resultSet.next() == false) {//check whether programme with that programme id already exists
				
				resultSet = null;
				resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_name = '"+programmeDataBean.getProgrammeName().toUpperCase()+"'");
				
				if(resultSet.next() == false) {
					
					query = "INSERT INTO programme(programme_id,programme_name,programme_duration,programme_sem)"
							+"VALUES(?,?,?,?)";
					preparedStatement = con.prepareStatement(query);
					
					preparedStatement.setString(1, programmeDataBean.getProgrammeId().trim());//1
					preparedStatement.setString(2, (programmeDataBean.getProgrammeName().toUpperCase()).trim());
					preparedStatement.setString(3, programmeDataBean.getProgrammeDuration().trim());
					preparedStatement.setString(4, programmeDataBean.getSemester().trim());
					
					preparedStatement.execute();
					
				}else {
					System.out.println(programmeDataBean.getProgrammeName());
					return "Programme with Programme Name "+programmeDataBean.getProgrammeName().toUpperCase()+" Already Exists";
					
				}
				
			}else {
				
				return "Programme with Programme.ID "+programmeDataBean.getProgrammeId()+" Already Exists";
			}
					
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}




//Method for inserting Course Data

	public String insertCourseData(ProgrammeCourseClassBean courseDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();	
				
				resultSet = statement.executeQuery("SELECT * FROM course WHERE course_code =  '"+courseDataBean.getCourseCode()+"'");

					if(resultSet.next() == false) { //check whether course with that courseCode already exists
							
							String groupNumber = "";
							
							switch(courseDataBean.getCourseGroup().trim()) {
								
							case "Group 1 Core Course":
								groupNumber = "1";
								break;
								
							case "Group 2 Elective Course":
								groupNumber = "2";
								break;
								
							case "Group 3 a)Compulsary Foundation":
								groupNumber = "3.1";
								break;
								
							case "Group 3 b)Elective Foundation":
								groupNumber = "3.2";
								break;
								
							case "Group 4":
								groupNumber = "4";
								
							default:
								groupNumber = "0";
							}
						
							query = "INSERT INTO course(course_code,course_name,course_type,course_group,course_sem,max_marks,"
									+ "min_marks,max_IA,programme_id,course_group_number)"
									+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1, (courseDataBean.getCourseCode().toUpperCase()).trim());
							preparedStatement.setString(2, (courseDataBean.getCourseName().toUpperCase()).trim());
							preparedStatement.setString(3, courseDataBean.getCourseType().trim());
							preparedStatement.setString(4, courseDataBean.getCourseGroup().trim());
							preparedStatement.setString(5, courseDataBean.getSemester().trim());
							preparedStatement.setString(6, courseDataBean.getMaxMarks().trim());
							preparedStatement.setString(7, courseDataBean.getMinMarks().trim());
							preparedStatement.setString(8, courseDataBean.getMaxIA().trim());
							preparedStatement.setString(9, courseDataBean.getProgrammeId().trim());
							preparedStatement.setString(10,groupNumber.trim());
							
							preparedStatement.execute();
						
					}else {
						
						return "Course with the Course Code "+courseDataBean.getCourseCode()+" Already Exists";
					}
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	

	
	
	
//Method for inserting class data
	
	public String insertClassData(ProgrammeCourseClassBean classDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String programmeId = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_name = '"+classDataBean.getProgrammeName().toUpperCase()+"'");
				
				System.out.println(classDataBean.getProgrammeName());
				while (resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id");
				}
				if(programmeId != "") {
					
					resultSet = null;
					resultSet = statement.executeQuery("SELECT * FROM class WHERE class_id =  "+classDataBean.getClassId()+"");
					
					
					if(resultSet.next()==false) { //check whether class with that class ID already exists
							
							resultSet = null;
							resultSet = statement.executeQuery("SELECT * FROM class WHERE class_name = '"+classDataBean.getClassName().toUpperCase()+"' "
															+ "AND class_year = "+classDataBean.getClassYear().trim()+"");
							
							if(resultSet.next()==false) {
								
								query = "INSERT INTO class(class_id,class_name,programme_id,class_year)"
										+ "VALUES(?,?,?,?)";
								preparedStatement = con.prepareStatement(query);
								
								preparedStatement.setString(1, classDataBean.getClassId().trim());
								preparedStatement.setString(2, classDataBean.getClassName().toUpperCase().trim());
								preparedStatement.setString(3, programmeId.trim());
								preparedStatement.setString(4, classDataBean.getClassYear().trim());
							
								preparedStatement.execute();
							}else {
								
								return "Class "+classDataBean.getClassName()+" "+classDataBean.getClassYear()+" Year Already Exists";
								
							}
							
						}else {
							
							return "Class with the Class.ID "+classDataBean.getClassId()+" Already Exists";
						}
					
					
				}else {
					
					return "No Such Programme Exists";
					
				}
				
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
}
