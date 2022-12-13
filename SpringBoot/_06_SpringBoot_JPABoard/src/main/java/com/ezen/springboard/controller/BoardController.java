package com.ezen.springboard.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.springboard.common.FileUtils;
import com.ezen.springboard.dto.BoardDTO;
import com.ezen.springboard.dto.BoardFileDTO;
import com.ezen.springboard.dto.ResponseDTO;
import com.ezen.springboard.dto.UserDTO;
import com.ezen.springboard.entity.Board;
import com.ezen.springboard.entity.BoardFile;
import com.ezen.springboard.service.board.BoardService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public ModelAndView getBoardList(BoardDTO boardDTO,
			Pageable pageable) {
		Board board = Board.builder()
						   .boardTitle(boardDTO.getBoardTitle())
						   .boardContent(boardDTO.getBoardContent())
						   .boardWriter(boardDTO.getBoardWriter())
						   .searchCondition(boardDTO.getSearchCondition())
						   .searchKeyword(boardDTO.getSearchKeyword())
						   .build();
		
		List<Board> boardList = boardService.getBoardList(board);
		
		Page<Board> pageBoardList = boardService.getPageBoardList(board, pageable);
		
		Page<BoardDTO> pageBoardDTOList = pageBoardList.map(pageBoard -> 
															BoardDTO.builder()
																	.boardNo(pageBoard.getBoardNo())
																	.boardTitle(pageBoard.getBoardTitle())
																	.boardContent(pageBoard.getBoardContent())
																	.boardWriter(pageBoard.getBoardWriter())
																	.boardRegdate(board.getBoardRegdate() == null ?
																		   	null :
																		   	board.getBoardRegdate().toString())
																	.boardCnt(pageBoard.getBoardCnt())
																	.build()
															);
		
		List<BoardDTO> getBoardList = new ArrayList<BoardDTO>();
		
		for(int i = 0; i < boardList.size(); i++) {
			BoardDTO returnBoard = BoardDTO.builder()
										   .boardNo(boardList.get(i).getBoardNo())
										   .boardTitle(boardList.get(i).getBoardTitle())
										   .boardContent(boardList.get(i).getBoardContent())
										   .boardWriter(boardList.get(i).getBoardWriter())
										   .boardRegdate(
												   boardList.get(i).getBoardRegdate() == null ?
												   null :
												   boardList.get(i).getBoardRegdate().toString())
										   .boardCnt(boardList.get(i).getBoardCnt())
										   .build();
			getBoardList.add(returnBoard);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/getBoardList.html");
		mv.addObject("getBoardList", getBoardList);
		
		return mv;
	}
	
	@GetMapping("/updateBoardCnt/{boardNo}")
	public void updateBoardCnt(@PathVariable int boardNo,
			HttpServletResponse response) throws IOException {
		boardService.updateBoardCnt(boardNo);
		
		response.sendRedirect("/board/board/" + boardNo);
	}
	
	@GetMapping("/board/{boardNo}")
	public ModelAndView getBoard(@PathVariable int boardNo) {
		Board board = boardService.getBoard(boardNo);
		
		BoardDTO boardDTO = BoardDTO.builder()
									.boardNo(board.getBoardNo())
									.boardTitle(board.getBoardTitle())
									.boardContent(board.getBoardContent())
									.boardWriter(board.getBoardWriter())
									.boardRegdate(board.getBoardRegdate() == null ?
											   	null :
											   	board.getBoardRegdate().toString())
									.boardCnt(board.getBoardCnt())
									.build();
		
		List<BoardFile> boardFileList = boardService.getBoardFileList(boardNo);
		
		List<BoardFileDTO> boardFileDTOList = new ArrayList<BoardFileDTO>();
		
		for(BoardFile boardFile : boardFileList) {
			BoardFileDTO boardFileDTO = BoardFileDTO.builder()
													.boardNo(boardNo)
													.boardFileNo(boardFile.getBoardFileNo())
													.boardFileNm(boardFile.getBoardFileNm())
													.boardOriginFileNm(boardFile.getBoardOriginFileNm())
													.boardFilePath(boardFile.getBoardFilePath())
													.boardFileRegdate(boardFile.getBoardFileRegdate().toString())
													.boardFileCate(boardFile.getBoardFileCate())
													.build();
			
			boardFileDTOList.add(boardFileDTO);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/getBoard.html");
		mv.addObject("getBoard", boardDTO);
		mv.addObject("boardFileList", boardFileDTOList);
		//mv.addObject("boardNo", boardNo);
		
		return mv;
	}
	
	@Transactional //쿼리가 실행된 후 바로 트랜잭션을 호출
	@PutMapping("/board")
	public ResponseEntity<?> updateBoard(BoardDTO boardDTO, 
			HttpServletResponse response, MultipartFile[] uploadFiles,
			MultipartFile[] changedFiles, HttpServletRequest request,
			@RequestParam("originFiles") String originFiles) throws IOException {
		ResponseDTO<Map<String, Object>> responseDTO = new ResponseDTO<>();
		
		List<BoardFileDTO> originFileList = new ObjectMapper().readValue(originFiles,
													new TypeReference<List<BoardFileDTO>>() {});
		
		String attachPath = request.getSession().getServletContext().getRealPath("/") +
				"/upload/";
		
		File directory = new File(attachPath);
		
		if(!directory.exists()) {
			directory.mkdir();
		}
		
		//DB에서 수정, 삭제, 추가 될 파일 정보를 담는 리스트
		List<BoardFile> uFileList = new ArrayList<BoardFile>();
		
		try {
			Board board = Board.builder()
							   .boardNo(boardDTO.getBoardNo())
							   .boardTitle(boardDTO.getBoardTitle())
							   .boardContent(boardDTO.getBoardContent())
							   .boardWriter(boardDTO.getBoardWriter())
							   .boardRegdate(
									   boardDTO.getBoardRegdate() == null ||
									   boardDTO.getBoardRegdate().equals("") ?
									   null :
									   LocalDateTime.parse(boardDTO.getBoardRegdate()))
							   .boardCnt(boardDTO.getBoardCnt())
							   .build();
			
			//파일 처리
			for(int i = 0; i < originFileList.size(); i++) {
				//수정되는 파일 처리
				if(originFileList.get(i).getBoardFileStatus().equals("U")) {
					for(int j = 0; j < changedFiles.length; j++) {
						if(originFileList.get(i).getNewFileNm().equals(
								changedFiles[j].getOriginalFilename())) {
							BoardFile boardFile = new BoardFile();
							
							MultipartFile file = changedFiles[j];
							
							boardFile = FileUtils.parseFileInfo(file, attachPath);
							
							boardFile.setBoard(board);
							boardFile.setBoardFileNo(originFileList.get(i).getBoardFileNo());
							boardFile.setBoardFileStatus("U");
							
							uFileList.add(boardFile);
						}
					}
				//삭제되는 파일 처리
				} else if(originFileList.get(i).getBoardFileStatus().equals("D")) {
					BoardFile boardFile = new BoardFile();
					
					boardFile.setBoard(board);
					boardFile.setBoardFileNo(originFileList.get(i).getBoardFileNo());
					boardFile.setBoardFileStatus("D");
					
					//실제 파일 삭제
					File dFile = new File(attachPath + originFileList.get(i).getBoardFileNm());
					dFile.delete();
					
					uFileList.add(boardFile);
				}
			}
			//추가된 파일 처리
			if(uploadFiles.length > 0) {
				for(int i = 0; i < uploadFiles.length; i++) {
					MultipartFile file = uploadFiles[i];
					
					if(file.getOriginalFilename() != null &&
						!file.getOriginalFilename().equals("")) {
						BoardFile boardFile = new BoardFile();
						
						boardFile = FileUtils.parseFileInfo(file, attachPath);
						
						boardFile.setBoard(board);
						boardFile.setBoardFileStatus("I");
						
						uFileList.add(boardFile);
					}
				}
			}
			
			boardService.updateBoard(board, uFileList);
			
			//board = boardService.getBoard(boardDTO.getBoardNo());
			
			BoardDTO returnBoard = BoardDTO.builder()
										   .boardNo(board.getBoardNo())
										   .boardTitle(board.getBoardTitle())
										   .boardContent(board.getBoardContent())
										   .boardWriter(board.getBoardWriter())
										   .boardRegdate(board.getBoardRegdate() == null ?
												   		null :
													   	board.getBoardRegdate().toString())
										   .boardCnt(board.getBoardCnt())
										   .build();
			
			List<BoardFile> boardFileList = boardService.getBoardFileList(board.getBoardNo());
			
			List<BoardFileDTO> boardFileDTOList = new ArrayList<BoardFileDTO>();
			
			for(BoardFile boardFile : boardFileList) {
				BoardFileDTO boardFileDTO = BoardFileDTO.builder()
												.boardNo(board.getBoardNo())
												.boardFileNo(boardFile.getBoardFileNo())
												.boardFileNm(boardFile.getBoardFileNm())
												.boardOriginFileNm(boardFile.getBoardOriginFileNm())
												.boardFilePath(boardFile.getBoardFilePath())
												.boardFileRegdate(boardFile.getBoardFileRegdate().toString())
												.boardFileCate(boardFile.getBoardFileCate())
												.build();
				
				boardFileDTOList.add(boardFileDTO);
			}
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			returnMap.put("getBoard", returnBoard);
			returnMap.put("boardFileList", boardFileDTOList);
			
			responseDTO.setItem(returnMap);
			
			return ResponseEntity.ok().body(responseDTO);			
		} catch(Exception e) {
			responseDTO.setErrorMessage(e.getMessage());
			
			return ResponseEntity.badRequest().body(responseDTO);	
		}
		//response.sendRedirect("/board/board/" + boardDTO.getBoardNo());
	}
	
	@DeleteMapping("/board")
	public void deleteBoard(@RequestParam("boardNo") int boardNo) {
		boardService.deleteBoard(boardNo);
	}
	
	@GetMapping("/insertBoard")
	public ModelAndView insertBoardView(HttpSession session) throws IOException {
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		
		ModelAndView mv = new ModelAndView();
		
		if(loginUser == null) {
			mv.setViewName("user/login.html");
		} else {		
			mv.setViewName("board/insertBoard.html");
		}
		return mv;
	}
	
	//insertBoard
	@PostMapping("/board")
	public void insertBoard(BoardDTO boardDTO, MultipartFile[] uploadFiles, 
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		Board board = Board.builder()
						   .boardTitle(boardDTO.getBoardTitle())
						   .boardContent(boardDTO.getBoardContent())
						   .boardWriter(boardDTO.getBoardWriter())
						   .boardRegdate(LocalDateTime.now())
						   .build();
		
		//DB에 입력될 파일 정보 리스트
		List<BoardFile> uploadFileList = new ArrayList<BoardFile>();
		
		if(uploadFiles.length > 0) {
			String attachPath = request.getSession().getServletContext().getRealPath("/")
					+ "/upload/";
			
			System.out.println("attachPath====================" + attachPath);
			
			File directory = new File(attachPath);
			
			if(!directory.exists()) {
				directory.mkdir();
			}
			
			//multipartFile 형식의 데이터를 DB 테이블에 맞는 구조로 변경
			for(int i = 0; i < uploadFiles.length; i++) {
				MultipartFile file = uploadFiles[i];
				
				if(!file.getOriginalFilename().equals("") &&
					file.getOriginalFilename() != null) {
					BoardFile boardFile = new BoardFile();
					
					boardFile = FileUtils.parseFileInfo(file, attachPath);
					System.out.println(boardFile.getBoardOriginFileNm());
					uploadFileList.add(boardFile);
				}
			}
		}
		
		boardService.insertBoard(board, uploadFileList);
		
		response.sendRedirect("/board/boardList");
	}
	
	@GetMapping("/pageBoardListApi")
	public ResponseEntity<?> getPageBoardList(Board board, Pageable pageable) {
		ResponseDTO<Page<BoardDTO>> responseDTO = new ResponseDTO<>();
		
		try {
			Page<Board> pageBoardList = boardService.getPageBoardList(board, pageable);
			
			Page<BoardDTO> pageBoardDTOList = pageBoardList.map(pageBoard -> 
																BoardDTO.builder()
																		.boardNo(pageBoard.getBoardNo())
																		.boardTitle(pageBoard.getBoardTitle())
																		.boardContent(pageBoard.getBoardContent())
																		.boardWriter(pageBoard.getBoardWriter())
																		.boardRegdate(board.getBoardRegdate() == null ?
																			   	null :
																			   	board.getBoardRegdate().toString())
																		.boardCnt(pageBoard.getBoardCnt())
																		.build()
																);
			responseDTO.setItem(pageBoardDTOList);
			
			return ResponseEntity.ok().body(responseDTO);
		} catch(Exception e) {
			responseDTO.setErrorMessage(e.getMessage());
			return ResponseEntity.badRequest().body(responseDTO);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
