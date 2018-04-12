package com.luv2code.demo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.luv2code.demo.entity.Course;
import com.luv2code.demo.entity.Instructor;
import com.luv2code.demo.entity.InstructorDetail;
import com.luv2code.demo.entity.Review;
import com.luv2code.demo.entity.Student;

public class CreateCourseStudentDemo {
	
	
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
			
			Course tempCourse = new Course("German language and culture");
			session.save(tempCourse);
			
			Student student1 = new Student("Hakan","Caymaz","hakan@mail.com");
			Student student2 = new Student("Cagri","Caymaz","cagri@mail.com");
			
			tempCourse.addStudent(student1);
			tempCourse.addStudent(student2);
			
			session.save(student1);
			session.save(student2);

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
