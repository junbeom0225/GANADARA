package com.gana.dara.mapper;





import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.AbstractDataSource;
/*
@Configuration
@MapperScan(sqlSessionFactoryRef="coreSqlSessionFactory")*/
public class CoreRepositoryConfig {
	/*
	@Bean(name="coreSqlSessionFactory")
	@Primary
	public SqlSessionFactory coreSqlSessionFactory(@Qualifier("coreDatasource") DataSource coreDatasource,
		      ApplicationContext applicationContext) throws Exception {
		    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		    sqlSessionFactoryBean.setDataSource(coreDatasource);
		    sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config.xml"));
		    // 문제의 주범 및 해결책
		    sqlSessionFactoryBean.setVfs(SpringBootVFS.class); 
		    //
		    return sqlSessionFactoryBean.getObject();
		  }
		

*/
}
