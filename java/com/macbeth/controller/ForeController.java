package com.macbeth.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.macbeth.pojo.*;
import com.macbeth.service.*;
import com.macbeth.utils.Page;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ForeController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    PropertyValueService propertyValueService;
    @Autowired
    UserService userService;
    @Autowired
    ReviewService reviewService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    OrderService orderService;

    @RequestMapping("foreHome")
    public String home(Model model) {
        List<Category> categories = categoryService.list();
        List<Product> products = null;
        try {
            products = productService.list().subList(0, 4);
        } catch (IndexOutOfBoundsException e) {
            System.out.println(e.getMessage());
        }

        model.addAttribute("cs", categories);
        model.addAttribute("ps", products);
        return "fore/home";
    }

    @RequestMapping("foreShopList")
    public String shopList(Model model, Page page) {
        page.setCount(8);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> products = productService.list();
        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);

        model.addAttribute("page", page);
        model.addAttribute("ps", products);
        return "fore/shopList";
    }

    @RequestMapping("foreShopCategoryList")
    public String shopList(Model model, Page page, int cid) {
        page.setCount(8);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> products = productService.list(cid);
        model.addAttribute("category", categoryService.getCategory(cid));
        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);

        model.addAttribute("page", page);
        model.addAttribute("ps", products);
        return "fore/shopList";
    }

    @RequestMapping("foreProductDetail")
    public String productDetail(int pid, Model model) {
        Product product = productService.get(pid);
        List<PropertyValue> propertyValues = propertyValueService.list(pid);
        List<Review> reviews = reviewService.list(pid);
        productService.setSaleAndReviewNumber(product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("p", product);
        model.addAttribute("propertyValues", propertyValues);

        return "fore/productDetail";
    }

    @RequestMapping("foreShopCart")
    public String shopCart(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        model.addAttribute("orderItems", orderItems);
        return "fore/shopCart";
    }

    @RequestMapping(value = "foreRegister", method = RequestMethod.GET)
    public String register() {
        return "fore/register";
    }

    @RequestMapping(value = "foreRegister", method = RequestMethod.POST)
    public String register(User user, Model model, HttpSession session) {
        //转义用户名和密码
        String name = HtmlUtils.htmlEscape(user.getName());
        String password = HtmlUtils.htmlEscape(user.getPassword());
        user.setName(name);
        user.setPassword(password);
        if (userService.isExist(name)) {
            model.addAttribute("msg", "用户名已存在");
            model.addAttribute("user", null);
            return "fore/register";
        }
        userService.add(user);
        session.setAttribute("user", user);
        return "redirect:/foreHome";
    }

    @RequestMapping("foreCheckRegisterAjax")
    @ResponseBody
    public String checkRegisterAjax(@RequestParam("name") String name) {
        name = HtmlUtils.htmlEscape(name);
        if (userService.isExist(name)) {
            return "fail";
        }
        return "success";

    }

    @RequestMapping(value = "foreLoginAjax")
    @ResponseBody
    public String loginAjax(@RequestParam("name") String name,
                            @RequestParam("password") String password, HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        password = HtmlUtils.htmlEscape(password);
        User user = userService.get(name, password);
        if (user != null) {
            return "success";
        } else {
            return "failed";
        }

    }

    @RequestMapping(value = "foreLogin", method = RequestMethod.GET)
    public String login() {
        return "fore/login";
    }

    @RequestMapping(value = "foreLogin", method = RequestMethod.POST)
    public String login(@RequestParam("name") String name, @RequestParam("password") String password,
                        Model model, HttpSession session) {
        //转义name和password
        name = HtmlUtils.htmlEscape(name);
        password = HtmlUtils.htmlEscape(password);

        if (userService.isExist(name)) {
            User user = userService.get(name, password);
            if (user == null) {
                model.addAttribute("msg", "用户密码错误");
                model.addAttribute("name", name);
                return "fore/login";
            } else {
                session.setAttribute("user", user);
                return "redirect:/foreHome";
            }
        } else {
            model.addAttribute("msg", "用户不存在");
            return "fore/login";
        }

    }

    @RequestMapping("foreCheckLogin")
    @ResponseBody
    public String foreCheckLogin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "fail";
        }
        return "success";
    }

    @RequestMapping("foreLogout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/foreHome";
    }

    //直接购买，只购买一种商品
    @RequestMapping("foreBuyOne")
    public String buy(int pid, int num, HttpSession session) {
        Product product = productService.get(pid);
        User user = (User) session.getAttribute("user");
        int oiid = 0;
        /*判断购物车里是否有相同商品*/
        Boolean found = false;
        List<OrderItem> orderItemList = orderItemService.listByUser(user.getId());
        for (OrderItem oi : orderItemList) {
            if (oi.getPid() == pid) {
                oi.setNumber(oi.getNumber() + num);
                orderItemService.update(oi);
                found = true;
                oiid = oi.getId();
                break;
            }
        }
        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setNumber(num);
            orderItem.setPid(product.getId());
            orderItem.setUid(user.getId());

            orderItemService.add(orderItem);
            oiid = orderItem.getId();
        }


        return "redirect:foreBuy?oiid=" + oiid;
    }

    @RequestMapping("foreBuy")
    public String buy(Model model, String[] oiid, HttpSession session) {
        Float total = 0F;
        List<OrderItem> orderItems = new ArrayList<>();
        for (String strid : oiid
                ) {
            int id = Integer.parseInt(strid);
            OrderItem oi = orderItemService.get(id);
            total += oi.getNumber() * oi.getProduct().getPrice();
            orderItems.add(oi);
        }
        session.setAttribute("orderItems", orderItems);
        model.addAttribute("total", total);
        return "fore/buy";
    }

    @RequestMapping("foreProductSearch")
    public String productSearch(String keyword, Model model, Page page) {
        page.setCount(8);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> products = productService.searchProduct(keyword);
        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);
        model.addAttribute("page", page);
        model.addAttribute("ps", products);
        model.addAttribute("keyword", keyword);
        return "fore/searchResult";
    }

    @RequestMapping("foreShopCartItemDelete")
    public String shopCartItemDelete(int oid) {
        orderItemService.delete(oid);
        return "redirect:/foreShopCart";
    }

    @RequestMapping("foreAddCart")
    public String addCart(int pid, int num, HttpSession session, Model model) {
        Product product = productService.get(pid);
        User user = (User) session.getAttribute("user");
        boolean found = false;
        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        for (OrderItem oi : orderItems
                ) {
            if (oi.getPid() == pid) {
                oi.setNumber(oi.getNumber() + num);
                orderItemService.update(oi);
                found = true;
                break;
            }
        }
        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setNumber(num);
            orderItem.setPid(pid);
            orderItem.setUid(user.getId());
            orderItemService.add(orderItem);
        }
        return null;
    }

    @RequestMapping(value = "foreCreateOrder")
    public String createOrder(HttpSession session, Order order, Model model) {
        User user = (User) session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt();
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setStatus(orderService.waitPay);
        order.setUid(user.getId());
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("orderItems");
        float total = orderService.add(order, ois);
        return "redirect:foreAliPay?oid=" + order.getId() + "&total=" + total;

    }

    @RequestMapping("foreAliPay")
    public String aliPay(Model model, int oid, float total) {
        model.addAttribute("oid", oid);
        model.addAttribute("total", total);
        return "fore/aliPay";
    }

    @RequestMapping("forePayed")
    public String payed(int oid, float total, Model model) {
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("o", order);
        return "fore/payed";
    }

    @RequestMapping("foreFAQ")
    public String faq() {
        return "fore/faq";
    }

    @RequestMapping("foreMyHome")
    public String myHome(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> os = orderService.list(user.getId(), OrderService.delete);

        orderItemService.fill(os);

        model.addAttribute("os", os);
        return "fore/myHome";
    }

    @RequestMapping("foreReview")
    public String review(Model model, int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        Product p = o.getOrderItems().get(0).getProduct();
        productService.setSaleAndReviewNumber(p);
        model.addAttribute("p", p);
        model.addAttribute("o", o);
        return "fore/review";
    }

    @RequestMapping("foreConfirmPay")
    public String confirmPay(int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        return "redirect:/foreMyHome";
    }
}
