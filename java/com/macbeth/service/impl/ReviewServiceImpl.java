package com.macbeth.service.impl;

import com.macbeth.mapper.ReviewMapper;
import com.macbeth.pojo.Review;
import com.macbeth.pojo.ReviewExample;
import com.macbeth.pojo.User;
import com.macbeth.service.ReviewService;
import com.macbeth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    ReviewMapper reviewMapper;

    @Autowired
    UserService userService;

    @Override
    public void add(Review review) {
        reviewMapper.insert(review);
    }

    @Override
    public void delete(int id) {
        reviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Review get(int id) {
        return reviewMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Review review) {
        reviewMapper.updateByPrimaryKeySelective(review);

    }

    @Override
    public List<Review> list(int pid) {
        ReviewExample reviewExample = new ReviewExample();
        reviewExample.createCriteria().andPidEqualTo(pid);
        reviewExample.setOrderByClause("id desc");
        List<Review> reviews = reviewMapper.selectByExample(reviewExample);
        setUser(reviews);

        return reviews;
    }

    @Override
    public int getCount(int pid) {
        return list(pid).size();
    }

    private void setUser(Review review){
        int uid = review.getUid();
        User user = userService.get(uid);
        review.setUser(user);
    }
    public void setUser(List<Review> reviews){
        for (Review review : reviews
                ) {
            setUser(review);
        }
    }
}
