package com.acorn.day2.api;

import com.acorn.day2.api.CarrotDAO;
import com.acorn.day2.api.CarrotDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;
import java.util.List;

@Controller
public class RegisterController {

    @Autowired
    private CarrotDAO carrotDAO;

    @GetMapping("/register-form")
    public String showRegisterForm(Model model) {
        model.addAttribute("carrot", new CarrotDTO());
        return "register-form";
    }

    @PostMapping("/register")
    public ResponseEntity<String> processRegistration(@RequestBody CarrotDTO carrot, Model model) throws JsonProcessingException {
        try {
            boolean success = carrotDAO.RegisterCarrot(carrot.getId(), carrot.getPrice(), carrot.getInfo(), carrot.getNewTime());
            if (success) {
                model.addAttribute("carrotList", carrotDAO.selectAll());
                // 새로 등록된 당근 정보를 JSON으로 변환하여 응답
                ObjectMapper objectMapper = new ObjectMapper();
                String json = objectMapper.writeValueAsString(carrot);
                return ResponseEntity.ok(json);
            } else {
                // Registration failed일 때도 200 OK로 응답 (상태 코드 변경)
                return ResponseEntity.ok("Registration failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Registration failed일 때도 200 OK로 응답 (상태 코드 변경)
            return ResponseEntity.ok("Registration failed");
        }
    }
}