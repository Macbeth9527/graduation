package com.macbeth.service;

import com.macbeth.pojo.Product;
import com.macbeth.utils.AbstractService;

import java.util.List;

public interface ProductService extends AbstractService<Product>{

    List<Product> list(int cid);
    List<Product> list();
    void setFirstProductImage(Product p);

    void setSaleAndReviewNumber(Product product);

    void setSaleAndReviewNumber(List<Product> products);

    List<Product> searchProduct(String keyword);


}
