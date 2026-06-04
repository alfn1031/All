package com.kh.study.exception;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.kh.study.busan.controller.BusanController;
import com.kh.study.util.ErrorResponse;

@RestControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ErrorResponse> handleValidation(MethodArgumentNotValidException e){
		Map<String, String> errors = new HashMap();
		// System.out.println(e.getBindingResult().getFieldErrorCount());
		e.getBindingResult().getFieldErrors().forEach(err -> errors.put(err.getField(), err.getDefaultMessage()));
		ErrorResponse er = new ErrorResponse(4, "잘못된 파라미터", errors);
		return ResponseEntity.badRequest().body(er);
	}
	
	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<ErrorResponse> handleNotFound(ResourceNotFoundException e) {
		ErrorResponse er = new ErrorResponse(44, e.getMessage(), null);
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(er);
	}
	

	
	
	
	
	
}
