package com.kh.semi.board.model.service;

import java.security.InvalidParameterException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.auth.model.vo.CustomUserDetails;
import com.kh.semi.board.model.dao.BoardMapper;
import com.kh.semi.board.model.dto.BoardDto;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.exception.CustomAuthenticationException;
import com.kh.semi.file.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor

public class BoardService {
	
	private final BoardMapper boardMapper;
	private final FileService fileService;

	public void save(BoardDto board, MultipartFile file, CustomUserDetails user) {
		Board b = Board.builder()
					   .boardTitle(board.getBoardTitle())
					   .boardContent(board.getBoardContent())
					   .boardWriter(user.getUsername())
					   .fileUrl(storeIfPresent(file))
					   .build();
		boardMapper.save(b);
		
	}
	
	private String storeIfPresent(MultipartFile file) {
		return (file != null && !file.isEmpty()) ? fileService.store(file) : null;
	}

	public List<BoardDto> findAll(int page) {
		RowBounds rb = new RowBounds(page * 3, 3); // RowBounds 완전 별로임... offset써야지
		return boardMapper.findAll(rb);
	}
	
	public BoardDto findByBoardNo(Long boardNo) {
		/*
		BoardDto board = boardMapper.findByBoardNo(boardNo);
		if(board == null) {
			throw new InvalidParameterException("유효하지않은 접근입니다");
		}
		return board;
		*/
		return getBoardOrThrow(boardNo);
	}
	
	private BoardDto getBoardOrThrow(Long boardNo) {
		BoardDto board = boardMapper.findByBoardNo(boardNo);
		if(board == null) {
			throw new InvalidParameterException("유효하지않은 접근입니다");
		}
		return board;
	}

	public void update(BoardDto board, MultipartFile file, CustomUserDetails user, Long boardNo) {
		validateUser(boardNo, user.getUsername());
		
		if(file != null && !file.isEmpty()) {
			String filePath = fileService.store(file);
			board.setFileUrl(filePath);
		}
	}
	
	public void deleteByBordNo(CustomUserDetails user, Long boardNo) {
		validateUser(boardNo, user.getUsername());
		boardMapper.deleteByBoardNo(boardNo);
	}
	
	private void validateUser(Long boardNo, String username) {
		BoardDto board = getBoardOrThrow(boardNo);
		if(!board.getBoardWriter().equals(username)) {
			throw new CustomAuthenticationException("작성자가 일치하지 않습니다");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
