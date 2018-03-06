package com.liqiwei.soft.adminserver.common.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(value = Exception.class)
    public String handleException(Exception e){
		
		return BaseResponse.successJson();
	}
}
