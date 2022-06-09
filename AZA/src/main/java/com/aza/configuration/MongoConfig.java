package com.aza.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoClientConfiguration;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

@Configuration
public class MongoConfig/* extends AbstractMongoClientConfiguration*/{

//	@Value("${spring.data.mongodb.username}")
//	private String userName;
//	
//	@Value("${spring.data.mongo.db.password}")
//	private String password;
	
//	@Value("${spring.data.mongo.db.uri}")
//	private String uri;
//	
////	@Override
////	protected String getDatabaseName() {
////		return database;
////	}
//
//	public MongoConfig() {
//		System.out.println(uri);
//	}
//	
//	@Bean
//	public MongoDatabase mongoDb() {
//		MongoClient client = MongoClients.create(uri);
//		MongoDatabase db = client.getDatabase(uri);
//		
//		return db;
//	}
	

//	@Override
//	public MongoClient mongoClient() throws Exception {
//		
//		
//		MongoCredential credential = MongoCredential.createCredential(userName, database, password.toCharArray());
//		MongoClient client = new MongoClients(new ServerAddress("localhost", 27017), Arrays.asList(credential));
//	}
	
	
	
}
