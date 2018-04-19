package com.macbeth.utils;

public interface AbstractService<T> {
    T get(int id);
    void add(T t);
    void update(T t);
    void delete(int id);
}
