package com.helena_app.backend.utils;

import org.springframework.stereotype.Component;

@Component
public class JwtTokenUtil {

    @Value("${jwt.secret}");
    private String jwtSecret;
    


    
}
