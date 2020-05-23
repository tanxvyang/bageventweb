package com.baige.controller;

import com.baige.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping("/user")
public class UserController {
     @Autowired
   private UserService userService;
    @RequestMapping(value = "savePerson", method = RequestMethod.GET)
    @ResponseBody
    public String savePerson(){
        userService.saveUser();
        return "success!";
    }

   // @RequestMapping(value = "test", method = RequestMethod.GET)
   //  public String hello(){
   //  //返回 views/test.jsp
   //      return  "test";
   //  }
   //
   //  @RequestMapping(value = "/springtest", method = RequestMethod.GET)
   //  public String springTest(){
   //      return userService.test();
   //  }
}