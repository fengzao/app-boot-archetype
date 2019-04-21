package org.cokebook.xyz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;

/**
 * @author fengzao
 * @date 2019/4/11 17:54
 */
@SpringBootApplication
@PropertySource("classpath:application.properties")
@ImportResource("classpath:/spring/*-spring.xml")
public class Bootstrap {

    public static void main(String[] args) {
        SpringApplication.run(Bootstrap.class, args);
    }

}
