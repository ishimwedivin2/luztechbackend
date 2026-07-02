package com.luztechnology.config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpaForwardController {

    @GetMapping({
            "/",
            "/home",
            "/login",
            "/register",
            "/forgot-password",
            "/reset-password",
            "/shop",
            "/cart",
            "/checkout",
            "/wishlist",
            "/profile",
            "/customer",
            "/support",
            "/support/tickets/{ticketId}",
            "/product/{productId}",
            "/inventory",
            "/admin",
            "/admin/{tab}",
            "/admin/finance/{subtab}",
            "/employee",
            "/employee/{tab}",
            "/support-agent",
            "/support-agent/{tab}"
    })
    public String forwardFrontendRoutes() {
        return "forward:/index.html";
    }
}
