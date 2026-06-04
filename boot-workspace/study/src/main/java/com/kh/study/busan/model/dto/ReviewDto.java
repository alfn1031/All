package com.kh.study.busan.model.dto;

import java.sql.Date;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class ReviewDto {
	/*
	 * @Size(min=, max=) 문자열길이 체크 / 컬렉션 크기 범위
	 * @Pattern(regexp=) 정규표현식 => @Pattern(regexp="^010-\\d{4}\\d{4}$")
	 * @Email 이ㅔ링형식체크
	 * @Positive 양수냐
	 * @Negative 음수냐
	 */
	private Long ucSeq;
	// @NotNull => Null 못들어온다 / "" 들어올 수 있다 / "   " 들어올 수 있다 => 모든 타입에 사용 가능
	// @NotEmprty => Null 못들어온다 / "" 들어올 수 있다 / "   " 들어올 수 없다 => String, Collection, Map, 배열
	// @NotBlank => Null 못들어온다 / "" 들어올 수 없다 / "   " 들어올 수 없다 => String 적용
	// NotBlank <==> content.trim().length() == 0??
	@NotBlank(message = "내용은 필수 작성 요소입니다")
	private String content;
	@NotNull(message = "별점은 필수 작성 요소입니다")
	@Min(value = 1, message="별점은 1점 이상이여야합니다.")
	@Max(value = 5, message="별점은 5점 이하여야합니다.")
	private Integer rating;
	private Date createDate;
	
	public ReviewDto() {
		super();
	}
	public Long getUcSeq() {
		return ucSeq;
	}
	public void setUcSeq(Long ucSeq) {
		this.ucSeq = ucSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public ReviewDto(Long ucSeq, String content, Integer rating, Date createDate) {
		super();
		this.ucSeq = ucSeq;
		this.content = content;
		this.rating = rating;
		this.createDate = createDate;
	}

}
