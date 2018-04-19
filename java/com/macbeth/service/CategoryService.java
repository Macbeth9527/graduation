package com.macbeth.service;


import com.macbeth.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> list();

    void addCategory(Category category);

    void delCategory(int id);

    Category getCategory(int id);

    void updateCategory(Category category);
}
