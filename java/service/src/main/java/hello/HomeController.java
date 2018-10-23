package hello;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HomeController {
  @RequestMapping("/hello")
  public String index() {
    return "Greetings for K8sLand!";
  }

  @RequestMapping("/health")
  public String health() {
    return "OK";
  }
}