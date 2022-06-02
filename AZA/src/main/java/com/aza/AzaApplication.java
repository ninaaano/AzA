package com.aza;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
@PropertySource("classpath:application.properties")
@ImportResource(value= {/*"config/context-aspect.xml",*/
						"classpath:config/context-common.xml",
						"classpath:config/context-mybatis.xml", 
						"classpath:config/context-transaction.xml" })
@Configuration
public class AzaApplication {

	public static void main(String[] args) {
		System.out.println("AzaApplication 시작");
		SpringApplication.run(AzaApplication.class, args);
	}

}
