package com.luv2code.demo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.luv2code.demo.entity.Course;
import com.luv2code.demo.entity.Instructor;
import com.luv2code.demo.entity.InstructorDetail;
import com.luv2code.demo.entity.Review;
import com.luv2code.demo.entity.Student;

public class AddCoursesForStudentDemo {

	public static void main(String[] args) {
		
			SessionFactory factory = new Configuration()
										.configure("hibernate.cfg.xml")
										.addAnnotatedClass(Instructor.class)
										.addAnnotatedClass(InstructorDetail.class)
										.addAnnotatedClass(Course.class)
										.addAnnotatedClass(Review.class)
										.addAnnotatedClass(Student.class)
										.buildSessionFactory();
			
			Session session = factory.getCurrentSession();
			
			try {
				session.beginTransaction();
				
				int hakanId=3;
				Student hakan = session.get(Student.class,hakanId);
				
				Course course1= new Course(	"English grammer and speaking ");
				Course course2= new Course("German grammer and speaking");
				
				hakan.addCourse(course1);
				hakan.addCourse(course2);
				
				session.save(course1);
				session.save(course2);
				
				session.getTransaction().commit();			
			}
			catch(Exception exp) {
				exp.printStackTrace();
			}
			finally {
				session.close();
				factory.close();
			}
	}
} 
