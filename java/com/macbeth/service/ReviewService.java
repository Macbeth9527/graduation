package com.macbeth.service;

import com.macbeth.pojo.Review;

import java.util.List;

public interface ReviewService {

    void add(Review review);

    void delete(int id);

    Review get(int id);

    void update(Review review);

    List<Review> list(int pid);

    int getCount(int pid);


}
