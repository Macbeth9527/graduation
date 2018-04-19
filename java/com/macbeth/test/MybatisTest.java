package com.macbeth.test;

import com.macbeth.mapper.CategoryMapper;
import com.macbeth.pojo.Category;
import com.macbeth.service.CategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {

    @Autowired
    CategoryMapper categoryMapper;

    @Test
    public void listAll(){

        List<Category> list = null;

        for (Category category: list
             ) {
            System.out.println(category.getName());

        }

    }
}
