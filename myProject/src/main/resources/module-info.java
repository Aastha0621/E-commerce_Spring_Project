module JtProject {
	exports com.myProject.myProject.dao;
	exports com.myProject.myProject;
	exports com.myProject.myProject.configuration;
	exports com.myProject.myProject.controller;
	exports com.myProject.myProject.models;
	exports com.myProject.myProject.services;

	requires java.desktop;
	requires java.naming;
	requires java.persistence;
	requires java.sql;
	requires net.bytebuddy;
	requires org.apache.tomcat.embed.core;
	requires org.hibernate.orm.core;
	requires spring.beans;
	requires spring.boot;
	requires spring.boot.autoconfigure;
	requires spring.context;
	requires spring.core;
	requires spring.jdbc;
	requires spring.orm;
	requires spring.security.config;
	requires spring.security.core;
	requires spring.security.crypto;
	requires spring.security.web;
	requires spring.tx;
	requires spring.web;
	requires spring.webmvc;
}