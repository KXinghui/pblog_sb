package site.xinghui.pblog_sb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication /* (exclude = DataSourceAutoConfiguration.class) */
@MapperScan(basePackages = "site.xinghui.pblog_sb.mapper")
public class PblogSbApplication {

	public static void main(String[] args) {
		SpringApplication.run(PblogSbApplication.class, args);
	}
}
