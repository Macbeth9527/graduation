package com.macbeth.utils;

import org.springframework.web.multipart.MultipartFile;

public class UploadedImageFile {
    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    MultipartFile image;
}
