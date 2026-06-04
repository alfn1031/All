package com.kh.study.busan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.study.busan.model.dto.ReviewDto;
import com.kh.study.busan.model.dto.UpdateReviewDto;
import com.kh.study.busan.model.service.BusanService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;

@Tag(name="부산 맛집 API", description="맛집 조회 및 리뷰 API")
@Validated
@RestController
@CrossOrigin("*")
@RequestMapping("/api/busans")
public class BusanController {
	/*
	 * 불편함 -> 해결책
	 * 
	 * RESTAPI 구현
	 * POSTMAN 사용
	 * API명제 작성
	 * Swagger 사용
	 * 직접 유효성 검사
	 * Spring-Validater-Stater를 사용한 표준성 검사
	 * 전역 예외처리기 구현
	 * 에러 응답형식 표준화
	 * 
	 * 실습 ->
	 * 
	 * react 우리 만든거 부산 맛집 컴포넌트에
	 * 리뷰 수정하기 / 리뷰 삭제하기 컴포넌트 수거해서 앞단이랑 붙여서 동작시키기
	 * +
	 * 사용자 예외 몇 개 내가 생각해서 만들어서 글로벌 예외처리기에 추가하고 예외가 잘 처리되는지 확인하기
	 */
	@Autowired
	private BusanService service;
	
	@Operation(summary="맛집 목록 조회", description="페이지 단위로 조회")
	@GetMapping
	public String getRes(
			@Parameter(description="페이지 번호", example="1")
			@RequestParam(name="page", defaultValue = "1") @Valid @Min(1) int page) {
		return service.getRes(page);
	}
	
	@Operation(summary="맛집 상세 조회")
	@ApiResponses({
		@ApiResponse(responseCode="200", description="조회성공"),
		@ApiResponse(responseCode="404", description="맛집이 없음")
	})
	@GetMapping("/{seq}")
	public String getDetail(
			@Parameter(description="맛집 식별자", example="70")
			@PathVariable(name="seq") int seq) {
		return service.getDetail(seq);
	}
	
	@PostMapping("/{seq}/reviews")
	public ResponseEntity<?> save(@PathVariable(value="seq") Long ucSeq, @Valid @RequestBody ReviewDto review){
		service.save(ucSeq, review);
		return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
	@GetMapping("/{seq}/reviews")
	public ResponseEntity<List<ReviewDto>> findBySeq(@PathVariable(value="seq") Long ucSeq) {
		List<ReviewDto> reviews = service.findBySeq(ucSeq);
		return ResponseEntity.ok(reviews);
	}
	
	// 리뷰를 수정하는 기능 + 리뷰를 삭제하는 기능
	// @PutMapping => 전체 수정 => 요청받을 때 DTO모든 필드에 값이 존재해야함
	// @PatchMapping => 부분 수정 => 요청받을 때 DTO 바꾸고싶은 필드만 값이 존제헤도 됨
	@ApiResponses({
		@ApiResponse(responseCode="200", description="업데이트 성공"),
		@ApiResponse(responseCode="404", description="리뷰가 존재하지 않음")
	})
	@PatchMapping("/{seq}/reviews")
	public ResponseEntity<Void> update(@PathVariable(value="seq") Long ucSeq,
									   @RequestBody UpdateReviewDto urd){
		
		// Method : Patch
		
		// /api/buans/70/reviews
		
		// { "content" : "바꾸고싶은내용",
		//	 "updateContent" : "바꾸고싶은내용" )
		service.update(ucSeq, urd);
		
		return ResponseEntity.ok().build();
	}
	
	// @DeleteMapping => 삭제
	// /api/busans/70/reviews/리뷰번호
	@DeleteMapping("/{seq}/reviews")
	public ResponseEntity<Void> delete(@PathVariable(value="seq") Long ucSeq,
										@RequestBody UpdateReviewDto urd){
		
		// Method : DELETE
		// { content : "관련내용" }
		service.delete(ucSeq, urd);
		return ResponseEntity.noContent().build();
	}
	
	// 생성 201 CREATED, 삭제 204 NO CONTENT, 조회 / 수정 200 OK
	
	
	
	
	
	
	
	
	
	
	
}
