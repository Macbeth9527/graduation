package com.macbeth.controller;

import com.macbeth.pojo.Product;
import com.macbeth.pojo.ProductImage;
import com.macbeth.service.ProductImageService;
import com.macbeth.service.ProductService;
import com.macbeth.utils.ImageUtil;
import com.macbeth.utils.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductImageController {
    @Autowired
    ProductService productService;

    @Autowired
    ProductImageService productImageService;

    @RequestMapping(value = "admin_productImage_add")
    public String add(ProductImage pi, HttpSession session, UploadedImageFile uploadedImageFile) {
        productImageService.add(pi);
        String fileName = pi.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;
        if (productImageService.type_single.equals(pi.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
        } else {
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
        }
        File file = new File(imageFolder, fileName);
        file.getParentFile().mkdirs();
        try {
            uploadedImageFile.getImage().transferTo(file);
            BufferedImage image = ImageUtil.change2jpg(file);
            ImageIO.write(image, "jpg", file);
            if (productImageService.type_single.equals(pi.getType())) {
                File f_small = new File(imageFolder_small, fileName);
                File f_middle = new File(imageFolder_middle, fileName);
                ImageUtil.resizeImage(file, 56, 56, f_small);
                ImageUtil.resizeImage(file, 217, 190, f_middle);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:admin_productImage_list?pid=" + pi.getPid();
    }

    @RequestMapping(value = "admin_productImage_delete")
    public String delete(int id ,HttpSession session){
        ProductImage pi = productImageService.get(id);
        String fileName = pi.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;
        if (productImageService.type_single.equals(pi.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
            File imageFile = new File(imageFolder,fileName);
            File imageFile_small = new File(imageFolder_small,fileName);
            File imageFile_middle = new File(imageFolder_middle,fileName);
            imageFile.delete();
            imageFile_small.delete();
            imageFile_middle.delete();
        } else {
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
            File imageFile = new File(imageFolder,fileName);
            imageFile.delete();

        }
        productImageService.delete(id);


        return "redirect:admin_productImage_list?pid=" + pi.getPid();
    }

    @RequestMapping("admin_productImage_list")
    public String list(int pid, Model model) {
        Product p = productService.get(pid);
        List<ProductImage> pisSingle = productImageService.list(pid, ProductImageService.type_single);
        List<ProductImage> pisDetail = productImageService.list(pid, ProductImageService.type_detail);

        model.addAttribute("p", p);
        model.addAttribute("pisSingle", pisSingle);
        model.addAttribute("pisDetail", pisDetail);

        return "admin/listProductImage";
    }


}