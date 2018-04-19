package com.macbeth.service.impl;

import com.macbeth.mapper.CategoryMapper;
import com.macbeth.mapper.ProductMapper;
import com.macbeth.pojo.Category;
import com.macbeth.pojo.Product;
import com.macbeth.pojo.ProductExample;
import com.macbeth.pojo.ProductImage;
import com.macbeth.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    ProductImageService productImageService;

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    ReviewService reviewService;

    @Override
    public void add(Product p) {
        productMapper.insert(p);
    }

    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void update(Product p) {
        productMapper.updateByPrimaryKeySelective(p);

    }

    @Override
    public Product get(int id) {
        Product product = productMapper.selectByPrimaryKey(id);
        setCategory(product);
        setFirstProductImage(product);
        return product;
    }



    @Override
    public List<Product> list(int cid) {
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        List result = productMapper.selectByExample(example);
        setCategory(result);
        setFirstProductImage(result);
        return result;
    }
    @Override
    public List<Product> list() {
        ProductExample example = new ProductExample();
        example.setOrderByClause("id desc");
        List result = productMapper.selectByExample(example);
        setCategory(result);
        setFirstProductImage(result);
        return result;
    }
    @Override
    public List<Product> searchProduct(String keyword) {
        ProductExample example = new ProductExample();
        example.createCriteria().andNameLike("%"+keyword+"%");
        example.setOrderByClause("id desc");
        List<Product> list = productMapper.selectByExample(example);

        setFirstProductImage(list);
        setCategory(list);

        return list;
    }





    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }

    public void setFirstProductImage(List<Product> ps) {
        for (Product p : ps) {
            setFirstProductImage(p);
        }
    }

    @Override
    public void setSaleAndReviewNumber(Product product) {
        int pid = product.getId();
        product.setReviewCount(reviewService.getCount(pid));
        product.setSaleCount(orderItemService.getSaleCount(pid));

    }

    @Override
    public void setSaleAndReviewNumber(List<Product> products) {
        for (Product product : products
                ) {
            setSaleAndReviewNumber(product);
        }

    }

    public void setCategory(List<Product> ps){
        for (Product p : ps)
            setCategory(p);
    }
    public void setCategory(Product p){
        int cid = p.getCid();
        Category c = categoryService.getCategory(cid);
        p.setCategory(c);
    }


}
