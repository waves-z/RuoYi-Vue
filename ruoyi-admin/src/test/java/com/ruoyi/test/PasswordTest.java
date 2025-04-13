package com.ruoyi.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.junit.Test;

public class PasswordTest {
    @Test
    public void testPassword() {
        String encodedPassword = "$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2";
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        
        // 尝试一些常见的密码组合
        String[] commonPasswords = {
            "admin123",
            "password",
            "123456",
            "admin",
            "ruoyi",
            "admin123456",
            "123456789",
            "qwerty",
            "password123",
            "admin@123"
        };
        
        for (String password : commonPasswords) {
            if (encoder.matches(password, encodedPassword)) {
                System.out.println("找到匹配的密码: " + password);
                return;
            }
        }
        
        System.out.println("未找到匹配的密码");
    }
} 