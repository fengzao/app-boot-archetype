package org.cokebook.xyz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author
 * @date 2019/4/11 18:00
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class BootstrapTest {

    @Autowired
    private ApplicationContext applicationContext;

    @Test
    public void test_start() {
        Bootstrap bootstrap = applicationContext.getBean(Bootstrap.class);
    }

}
