package hello;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HomeController {
    @RequestMapping("/hello")
    public String index() {
        return "CHANGE_ME -- add a cool greeting!";
    }

    // CHANGE_ME - Add /heath endpoint
}