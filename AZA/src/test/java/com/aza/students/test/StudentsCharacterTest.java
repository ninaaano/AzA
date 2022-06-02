package com.aza.students.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService2;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
@SpringBootTest
public class StudentsCharacterTest {
	
	@Autowired
	@Qualifier("studentsServiceImpl2")
	private StudentsService2 studentsService;
	
	@Test
	public void testGetCharacter() throws Exception{
		
		Students students = new Students();
		
		students = studentsService.getStudentsCharacter(1002);
		Assert.assertEquals("student21", students.getStudentId());
		
	}
}
