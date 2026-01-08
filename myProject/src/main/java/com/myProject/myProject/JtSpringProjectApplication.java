package com.myProject.myProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
public class myProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(myProjectApplication.class, args);
	}

}
