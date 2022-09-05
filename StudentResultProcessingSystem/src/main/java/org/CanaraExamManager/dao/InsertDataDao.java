package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.plugins.tiff.ExifGPSTagSet;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;
import org.eclipse.jdt.internal.compiler.ast.AND_AND_Expression;


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
							preparedStatement.setString(2,studentDataBean.getfirstName().replaceAll("\\s+"," ").trim());//2
							preparedStatement.setString(3,studentDataBean.getLastName().replaceAll("\\s+"," ").trim());//3
							preparedStatement.setString(4,studentDataBean.getGender().trim());//4
							preparedStatement.setString(5,studentDataBean.getDOB().trim());//5
							preparedStatement.setString(6,studentDataBean.getEmail().trim());//6
							preparedStatement.setString(7,studentDataBean.getPhone().trim());//7
							preparedStatement.setString(8,studentDataBean.getAddress().replaceAll("\\s+"," ").trim());//8
							preparedStatement.setString(9,studentDataBean.getCity().replaceAll("\\s+"," ").trim());//9
							preparedStatement.setString(10,studentDataBean.getDistrict().replaceAll("\\s+"," ").trim());//10
							preparedStatement.setString(11,studentDataBean.getState().replaceAll("\\s+"," ").trim());//11
							preparedStatement.setString(12,studentDataBean.getPinCode().trim());//12
							preparedStatement.setString(13,studentDataBean.getPassword().replaceAll("\\s+"," ").trim());//13
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
				preparedStatement.setString(2, staffDataBean.getfirstName().replaceAll("\\s+"," ").trim());//2
				preparedStatement.setString(3, staffDataBean.getLastName().replaceAll("\\s+"," ").trim());//3
				preparedStatement.setString(4, staffDataBean.getGender().trim());//4
				preparedStatement.setString(5, staffDataBean.getEmail().trim());//5
				preparedStatement.setString(6, staffDataBean.getPhone().trim());//6
				preparedStatement.setString(7, staffDataBean.getAddress().replaceAll("\\s+"," ").trim());//7
				preparedStatement.setString(8, staffDataBean.getPassword().replaceAll("\\s+"," ").trim());//8
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
					preparedStatement.setString(2, (programmeDataBean.getProgrammeName().toUpperCase()).replaceAll("\\s+"," ").trim());
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
							
							preparedStatement.setString(1, (courseDataBean.getCourseCode().toUpperCase()).replaceAll("\\s+"," ").trim());
							preparedStatement.setString(2, (courseDataBean.getCourseName().toUpperCase()).replaceAll("\\s+"," ").trim());
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
								preparedStatement.setString(2, (classDataBean.getClassName().toUpperCase()).replaceAll("\\s+"," ").trim());
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
	
	
	public String insertFinalMarks(ResultBean resultBean) {
		
		Connection con = null;
		PreparedStatement statement = null;
		PreparedStatement statement2 = null;
		Statement stmt = null;
		ResultSet resultset = null;
		try {
			
			con = DBConnection.createConnection();
			stmt = con.createStatement();
			for(int i = 0;i<resultBean.getArraySize();i++) {
				resultset = stmt.executeQuery("SELECT * FROM final_marks WHERE reg_no = '"+resultBean.getUserName().trim()+"' AND "
						+ "course_code ='"+resultBean.getCourseCode(i)+"'");
				if(resultset.next() == true) {
					return "Result Data of Register Number: '"+resultBean.getUserName().trim()+"' '"+resultBean.getSemester()+" semester' with CourseCode: '"+resultBean.getCourseCode(i)+"' Already Exists!";
				}
			}
			
			for(int i = 0;i<resultBean.getArraySize();i++) {
				statement = null;
				String result = "";
				String grade = "";
				float gradePoint = 0;
				float gradePointWeightage = 0;
				int obtainedMarks = resultBean.getObtainedMarks(i);
				int internalMarks = resultBean.getIAMarks(i);
				int maxmarks = resultBean.getMaxMarks(i);
				int minMarks = resultBean.getMinMarks(i);
				int maxIA = resultBean.getMaxIA(i);
				int totalMarks = obtainedMarks + internalMarks;
				int totalMax = maxmarks + maxIA;
				if(totalMarks < minMarks) {
					result = "FAIL";
				}else {
					result = "PASS";
				}
				
				if((totalMarks*100/totalMax) >= 95f && (totalMarks*100/totalMax) <= 100f) {
					grade = "OO+";
					gradePoint = 10f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 90f && (totalMarks*100/totalMax) <= 94f) {
					grade = "OO";
					gradePoint = 9.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 85f && (totalMarks*100/totalMax) <= 89f) {
					grade = "OA+";
					gradePoint = 9f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 80f && (totalMarks*100/totalMax) <= 84f) {
					grade = "OA";
					gradePoint = 8.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 75f && (totalMarks*100/totalMax) <= 79f) {
					grade = "AA+";
					gradePoint = 8f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 70f && (totalMarks*100/totalMax) <= 74f) {
					grade = "AA";
					gradePoint = 7.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 65f && (totalMarks*100/totalMax) <= 69f) {
					grade = "AB+";
					gradePoint = 7;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 60f && (totalMarks*100/totalMax) <= 64f) {
					grade = "AB";
					gradePoint = 6.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 55f && (totalMarks*100/totalMax) <= 59f) {
					grade = "BB+";
					gradePoint = 6f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 50f && (totalMarks*100/totalMax) <= 54f) {
					grade = "BB";
					gradePoint = 5.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 45f && (totalMarks*100/totalMax) <= 49f) {
					grade = "BC";
					gradePoint = 5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 40f && (totalMarks*100/totalMax) <= 44f) {
					grade = "CC";
					gradePoint = 4.5f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else if((totalMarks*100/totalMax) >= 35f && (totalMarks*100/totalMax) <= 39f) {
					grade = "PP";
					gradePoint = 4f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}else{
					grade = "FF";
					gradePoint = 0f;
					if(totalMax > 50) {
						gradePointWeightage = gradePoint * 2;
					}else {
						gradePointWeightage = gradePoint;
					}
				}
				statement = con.prepareStatement("INSERT INTO final_marks(reg_no,course_code,programme_id,obtained_marks,IA_marks,total_marks,grade,credit,grade_point,grade_point_weightage,result)"
						+ "VALUES('"+resultBean.getUserName().trim()+"','"+resultBean.getCourseCode(i).trim()+"','"+resultBean.getProgrammeId().trim()+"','"+resultBean.getObtainedMarks(i)+"',"
								+ "'"+resultBean.getIAMarks(i)+"','"+totalMarks+"','"+grade+"','"+resultBean.getCredit(i)+"','"+gradePoint+"','"+gradePointWeightage+"','"+result+"')");
				statement.execute();
			}
				resultset = null;
				resultset = stmt.executeQuery("SELECT * FROM exam_details WHERE reg_no = "+resultBean.getUserName().trim()+" "
						+ "AND semester = "+resultBean.getSemester()+" AND exam_type = 'Semester'");
				if(resultset.next() == false) {
					statement2 = con.prepareStatement("INSERT INTO exam_details(reg_no,semester,exam_type,exam_month,exam_year,result_date)VALUES('"+resultBean.getUserName().trim()+"',"
							+ "'"+resultBean.getSemester()+"','Semester','"+resultBean.getExamMonth().trim()+"','"+resultBean.getExamYear().trim()+"','"+resultBean.getResultDate()+"')");
					statement2.execute();
				}else {
					statement2 = con.prepareStatement("UPDATE exam_details set reg_no = "+resultBean.getUserName().trim()+" ,semester = "+resultBean.getSemester()+",exam_type = 'Semester',"
							+ "exam_month = '"+resultBean.getExamMonth().trim()+"',exam_year = "+resultBean.getExamYear()+" ,result_date = '"+resultBean.getResultDate()+"'");
					statement2.execute();
					
				}
						
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	public String insertFirstInternal(ResultBean resultBean) {
		
		Connection con = null;
		PreparedStatement statement = null;
		PreparedStatement statement2 = null;
		Statement stmt = null;
		ResultSet resultset = null;
		try {
			
			con = DBConnection.createConnection();
			stmt = con.createStatement();
			for(int i = 0;i<resultBean.getArraySize();i++) {
				resultset = stmt.executeQuery("SELECT * FROM first_internal_marks WHERE reg_no = '"+resultBean.getUserName().trim()+"' AND "
						+ "course_code = '"+resultBean.getCourseCode(i)+"'");
				if(resultset.next() == true) {
					return "Result Data of Register Number: '"+resultBean.getUserName().trim()+"' '"+resultBean.getSemester()+" semester' with CourseCode: '"+resultBean.getCourseCode(i)+"' Already Exists!";
				}
			}
			
			for(int i = 0;i<resultBean.getArraySize();i++) {
				statement = null;
				String result = "";
				String grade = "";
				int obtainedMarks = resultBean.getObtainedMarks(i);
				int maxmarks = resultBean.getMaxMarks(i);
				int minMarks = resultBean.getMinMarks(i);
				if(obtainedMarks < minMarks) {
					result = "FAIL";
				}else {
					result = "PASS";
				}
				
				if((obtainedMarks*100/maxmarks) >= 95f && (obtainedMarks*100/maxmarks) <= 100f) {
					grade = "OO+";
					
				}else if((obtainedMarks*100/maxmarks) >= 90f && (obtainedMarks*100/maxmarks) <= 94f) {
					grade = "OO";
					
				}else if((obtainedMarks*100/maxmarks) >= 85f && (obtainedMarks*100/maxmarks) <= 89f) {
					grade = "OA+";
					
				}else if((obtainedMarks*100/maxmarks) >= 80f && (obtainedMarks*100/maxmarks) <= 84f) {
					grade = "OA";
					
				}else if((obtainedMarks*100/maxmarks) >= 75f && (obtainedMarks*100/maxmarks) <= 79f) {
					grade = "AA+";
					
				}else if((obtainedMarks*100/maxmarks) >= 70f && (obtainedMarks*100/maxmarks) <= 74f) {
					grade = "AA";
					
				}else if((obtainedMarks*100/maxmarks) >= 65f && (obtainedMarks*100/maxmarks) <= 69f) {
					grade = "AB+";
					
				}else if((obtainedMarks*100/maxmarks) >= 60f && (obtainedMarks*100/maxmarks) <= 64f) {
					grade = "AB";
					
				}else if((obtainedMarks*100/maxmarks) >= 55f && (obtainedMarks*100/maxmarks) <= 59f) {
					grade = "BB+";
					
				}else if((obtainedMarks*100/maxmarks) >= 50f && (obtainedMarks*100/maxmarks) <= 54f) {
					grade = "BB";
					
				}else if((obtainedMarks*100/maxmarks) >= 45f && (obtainedMarks*100/maxmarks) <= 49f) {
					grade = "BC";
					
				}else if((obtainedMarks*100/maxmarks) >= 40f && (obtainedMarks*100/maxmarks) <= 44f) {
					grade = "CC";
					
				}else if((obtainedMarks*100/maxmarks) >= 35f && (obtainedMarks*100/maxmarks) <= 39f) {
					grade = "PP";
					
				}else{
					grade = "FF";
					
				}
				statement = con.prepareStatement("INSERT INTO first_internal_marks(reg_no,course_code,programme_id,max_marks,min_marks,obtained_marks,grade,result)"
						+ "VALUES('"+resultBean.getUserName().trim()+"','"+resultBean.getCourseCode(i).trim()+"','"+resultBean.getProgrammeId().trim()+"',"+resultBean.getMaxMarks(i)+""
								+ ","+resultBean.getMinMarks(i)+","+resultBean.getObtainedMarks(i)+",'"+grade+"','"+result+"')");
				statement.execute();
			}
				resultset = null;
				resultset = stmt.executeQuery("SELECT * FROM exam_details WHERE reg_no = "+resultBean.getUserName().trim()+" "
						+ "AND semester = "+resultBean.getSemester()+" AND exam_type = 'FirstInternal'");
				if(resultset.next() == false) {
					statement2 = con.prepareStatement("INSERT INTO exam_details(reg_no,semester,exam_type,exam_month,exam_year,result_date)VALUES('"+resultBean.getUserName().trim()+"',"
							+ "'"+resultBean.getSemester()+"','FirstInternal','"+resultBean.getExamMonth().trim()+"','"+resultBean.getExamYear().trim()+"','"+resultBean.getResultDate()+"')");
					statement2.execute();
				}else {
					statement2 = con.prepareStatement("UPDATE exam_details set reg_no = "+resultBean.getUserName().trim()+" ,semester = "+resultBean.getSemester()+",exam_type = 'FirstInternal',"
							+ "exam_month = '"+resultBean.getExamMonth().trim()+"',exam_year = "+resultBean.getExamYear()+" ,result_date = '"+resultBean.getResultDate()+"'");
					statement2.execute();
					
				}
						
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
}
