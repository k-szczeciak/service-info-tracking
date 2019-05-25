package pl.com.szczeciak.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class initalView {

@GetMapping("/home")
    public String initialView(){

    return "home";
}
}
