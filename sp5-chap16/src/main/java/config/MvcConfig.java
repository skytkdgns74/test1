package config;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import interceptor.AuthCheckInterceptor;

@Configuration
@EnableWebMvc	//스프링 MVC설정 활성화
public class MvcConfig implements WebMvcConfigurer {

	@Override	//DispatcherServlet의 매핑 경로를 / 로 주었을 때, JSP/HTML/CSS등을 올바르게 처리하기 위한 설정 추가.
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override	// JSP를 이용해서 컨트롤러의 실행 결과를 보여주기 위한 설정.
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/main").setViewName("main");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor())
				.addPathPatterns("/edit/**")
				.excludePathPatterns("/edit/help/**");
	}

	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}

	@Override
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		ObjectMapper objectMapper = Jackson2ObjectMapperBuilder
				.json()
				.featuresToDisable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
				//.serializerByType(LocalDateTime.class, new LocalDateTimeSerializer(formatter))
				//.deserializerByType(LocalDateTime.class, new LocalDateTimeDeserializer(formatter))
				//.simpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.build();
		converters.add(0, new MappingJackson2HttpMessageConverter(objectMapper));
	}
}
