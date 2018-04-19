package com.macbeth.service.impl;

import com.macbeth.mapper.CategoryMapper;
import com.macbeth.pojo.Category;
import com.macbeth.pojo.CategoryExample;
import com.macbeth.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> list() {
        CategoryExample example =new CategoryExample();
        example.setOrderByClause("id desc");
        return categoryMapper.selectByExample(example);
    }

    @Override
    public void addCategory(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void delCategory(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Category getCategory(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateCategory(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);

    }
}
