package site.xinghui.pblog_sb.config;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.validator.HibernateValidator;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.FormatterRegistry;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import site.xinghui.pblog_sb.converter.String2EnumConverterFactory;
import site.xinghui.pblog_sb.interceptor.AuthorizeInteceptor;
import site.xinghui.pblog_sb.interceptor.ErrorInteceptor;
import site.xinghui.pblog_sb.interceptor.ForeInteceptor;

@Configuration
// @ConfigurationProperties(prefix = "spring.messagesource")
public class WebMvcConfig implements WebMvcConfigurer {

	public static final Map<String, String> FOREMAP = new HashMap<>();
	public static final Map<String, String> ADMINMAP = new HashMap<>();

	static {
		FOREMAP.put("registerPage", "fore/register");
		FOREMAP.put("loginPage", "fore/login");
		FOREMAP.put("editUserInfoPage", "fore/editUserInfo");
	}
	// @Value("${spring.messagesource.basenames}")
	// private String basenames;
	// @Value("${spring.messagesource.defaultEncoding}")
	// private String defaultEncoding;
	// @Value("${spring.messagesource.useCodeAsDefaultMessage}")
	// private boolean useCodeAsDefaultMessage;
	// private MessageSource messageSource;
	// private Validator validatorFactoryBean;

	/* 视图控制器（跳转页面） */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		for (String key : FOREMAP.keySet()) {
			registry.addViewController(key).setViewName(FOREMAP.get(key));
		}
		WebMvcConfigurer.super.addViewControllers(registry);
	}

	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverterFactory(string2EnumConverterFactory());
	}

	@Override
	public Validator getValidator() {
		return validator();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(foreInteceptor()).addPathPatterns("/fore*").addPathPatterns("/fore/**");
		registry.addInterceptor(errorInteceptor()).addPathPatterns("/error");
		WebMvcConfigurer.super.addInterceptors(registry);
	}

	@Bean
	public ForeInteceptor foreInteceptor() {
		return new ForeInteceptor();
	}

	@Bean
	public ErrorInteceptor errorInteceptor() {
		return new ErrorInteceptor();
	}

	@Bean
	public AuthorizeInteceptor authorizeInteceptor() {
		return new AuthorizeInteceptor();
	}

	@Bean
	public String2EnumConverterFactory string2EnumConverterFactory() {
		String2EnumConverterFactory string2EnumConverterFactory = new String2EnumConverterFactory();
		return string2EnumConverterFactory;
	}

	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("validator/validationMessages");
		messageSource.setDefaultEncoding(StandardCharsets.UTF_8.name());
		messageSource.setUseCodeAsDefaultMessage(false);
		messageSource.setCacheSeconds(120);
		return messageSource;
	}

	@Bean
	public LocalValidatorFactoryBean validator() {
		LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
		localValidatorFactoryBean.setProviderClass(HibernateValidator.class);
		localValidatorFactoryBean.setValidationMessageSource(messageSource());
		return localValidatorFactoryBean;
	}

	// @Bean
	// public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws
	// Exception {
	// SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
	// sqlSessionFactory.setDataSource(dataSource);
	// sqlSessionFactory.setVfs(SpringBootVFS.class);
	// return sqlSessionFactory.getObject();
	// }

}
