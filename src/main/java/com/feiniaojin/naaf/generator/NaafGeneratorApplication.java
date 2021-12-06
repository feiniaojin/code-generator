package com.feiniaojin.naaf.generator;

import com.feiniaojin.naaf.generator.service.NaafGeneratorService;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import javax.annotation.Resource;

/**
 * 请输入类描述
 *
 * @author feiniaojin
 */
@SpringBootApplication
@MapperScans({
    @MapperScan(basePackages = {
        "com.feiniaojin.naaf.generator.dao"
    })
})
public class NaafGeneratorApplication {

    @Resource
    private NaafGeneratorService naafGeneratorService;

    public static void main(String[] args) throws Exception {
        ConfigurableApplicationContext context = SpringApplication.run(NaafGeneratorApplication.class, args);
        context.getBean(NaafGeneratorService.class).generate();
        context.stop();
    }

}

