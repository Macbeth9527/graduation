package com.macbeth.service;

import com.macbeth.pojo.Property;

import java.util.List;

public interface PropertyService {
    void addProperty(Property property);
    void delProperty(int id);
    void updateProperty(Property property);
    Property getProperty(int id);
    List<Property> listProperty(int categoryID);
}
