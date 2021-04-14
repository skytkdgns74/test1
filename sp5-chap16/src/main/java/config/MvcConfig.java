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
	public void configureDefaultServletHandling(	//configureDefaultServletHandling : DefaultServletHttpRequestHandler/SimpleUrlHandlerMapping 두 빈 객체를 추가
			//DefaultServletHttpRequestHandler : 클라이언트의 모든 요청을 WAS가 제공하는 디폴트 서블릿에 전달.  ex) "/index.html" -> DefaultServletHttpRequestHandler -> 디폴트서블릿
			// 디폴트 서블릿 -> SimpleUrlHandelerMapping ->모든경로 ("/**")를 DefaultServletHttp RequestHandler를 이용해서 처리
			DefaultServletHandlerConfigurer configurer) {	//SimpleUrlHandlerMapping를 등록하는 메소드(DefaultServletHandlerConfigurer : 등록하는 우선순위 가장 낮음. 별도 설정이 없는 모든 요청경로를 디폴트 서블릿이 처리하게 된다.)
		configurer.enable();
	}

	@Override	// JSP를 이용해서 컨트롤러의 실행 결과를 보여주기 위한 설정. view/jsp사용위해 사용
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
