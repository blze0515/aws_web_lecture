package com.ezen.springboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.springboard.common.FileUtils;
import com.ezen.springboard.service.board.BoardService;
import com.ezen.springboard.vo.BoardFileVO;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.PageVO;
import com.ezen.springboard.vo.UserVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	/*
	 * 클라이언트가 이벤트를 발생시키면 요청이 발생되고 
	 * 컨트롤러에서 @RequestMapping으로 매핑된 매핑주소와 요청주소가 같으면
	 * 해당 메소드를 실행한다.
	 * 해당 메소드안에서는 DB접근이 필요할 때는 Service의 메소드를 호출하여
	 * ServiceImpl -> DAO -> Mapper까지 실행한다.
	 * DB접근이 필요없는 경우는 해당 메소드에서 바로 jsp(화면단)을 리턴한다.
	 * 화면에서 요청발생 -> Controller -> Service -> ServiceImpl -> DAO -> Mapper
	 * DB에서 가져올 데이터가 있을 경우에는 위 순서의 역순으로 진행
	 * */
//	@RequestMapping("login.do")
//	public void login() {
//		boardService.login();
//	}
	//게시글 목록 화면으로 이동
	@RequestMapping("/getBoardList.do")
	public String getBoardList(Model model, @RequestParam Map<String, String> paramMap
			, Criteria cri) {
		List<BoardVO> boardList = boardService.getBoardList(paramMap, cri);
		
		model.addAttribute("boardList", boardList);
		
		if(paramMap.get("searchCondition") != null && !paramMap.get("searchCondition").equals(""))
			model.addAttribute("searchCondition", paramMap.get("searchCondition"));
		
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals(""))
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		
		int total = boardService.getBoardTotalCnt(paramMap);
		
		System.out.println(total);
		model.addAttribute("pageVO", new PageVO(cri, total));
		
		return "board/getBoardList";
	}
	
	//게시글 목록 가져오는 로직처리(Ajax)
//	@PostMapping(value="/getBoardList.do", produces="application/text; charset=UTF-8")
//	@ResponseBody
//	public String getBoardList() throws JsonProcessingException{
//		ObjectMapper mapper = new ObjectMapper();
//		
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		List<BoardVO> boardList = boardService.getBoardList();
//		
//		returnMap.put("boardList", boardList);
//		
//		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(returnMap);
//		
//		return jsonStr;
//	}
	
	//게시글 등록 화면으로 이동
	@GetMapping("/insertBoard.do")
	public String insertBoardView(HttpSession session) {
		//로그인한 유저의 정보가 세션에 없을 때 로그인 화면으로 이동
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "redirect:/user/login.do";
		}
		
		return "board/insertBoard";
	}
	
	//게시글 등록
	@PostMapping("/insertBoard.do")
	public String insertBoard(BoardVO boardVO, MultipartFile[] uploadFiles,
			HttpServletRequest request) throws IOException {
		
		
		List<BoardFileVO> fileList = new ArrayList<BoardFileVO>();
		
		//파일업로드 기능 구현
		if(uploadFiles.length > 0) {
			//업로드 폴더 지정
			//request.getSession().getServletContext().getRealPath("/"): WAS의 루트패스
			//workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\_025_SpringBoard_FileUpload
			String attachPath = request.getSession().getServletContext().getRealPath("/") 
					+ "/upload/";
			
			File directory = new File(attachPath);
			
			//해당 폴더가 존재하지 않으면 폴더 생성
			if(!directory.exists()) {
				directory.mkdir();
			}
			
			//multipartFile 배열에서 파일들을 꺼내 DB 형식에 맞게 변경한다.
			for(int i = 0; i < uploadFiles.length; i++) {
				MultipartFile file = uploadFiles[i];
				
				//getOriginalFileName() : 업로드한 파일의 파일명 
				if(!file.getOriginalFilename().equals("") &&
				   file.getOriginalFilename() != null) {
					BoardFileVO boardFile = new BoardFileVO();
					
					boardFile = FileUtils.parseFileInfo(file, attachPath);
					
					fileList.add(boardFile);
				}
			}
		}
		//첨부파일에 boardNo를 매핑하기 위해서
		//insert후 boardNo(insert된 게시글의 boardNo)를 리턴하여 사용한다.
		boardService.insertBoard(boardVO, fileList);
		
		//등록 후 게시글 목록으로 이동
		return "redirect:/board/insertBoard.do";
	}
	
	//게시글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) {
		BoardVO board = boardService.getBoard(boardNo);
		//첨부파일 리스트 조회
		List<BoardFileVO> fileList = boardService.getBoardFileList(boardNo);		
		
		model.addAttribute("board", board);
		model.addAttribute("boardFileList", fileList);
		
		return "board/getBoard";
	}
	
	//조회수 증가
	@RequestMapping("/updateBoardCnt.do")
	public String updateBoardCnt(@RequestParam("boardNo") int boardNo) {
		//조회수 증가
		boardService.updateBoardCnt(boardNo);
		
		return "redirect:/board/getBoard.do?boardNo=" + boardNo;
	}
	
	//게시글 수정
	@PostMapping("/updateBoard.do")
	public String updateBoard(BoardVO boardVO, MultipartFile[] uploadFiles,
			MultipartFile[] changedFiles, HttpServletRequest request,
			@RequestParam("originFiles") String originFiles) throws IOException {
		System.out.println("originFiles========================" + originFiles);
		
		//JSON String 데이터를 List로 변경
		List<BoardFileVO> originFileList = new ObjectMapper().readValue(originFiles, 
				new TypeReference<List<BoardFileVO>>(){});
		
		String attachPath = request.getSession().getServletContext().getRealPath("/") 
				+ "/upload/";
		
		File directory = new File(attachPath);
		
		//해당 폴더가 존재하지 않으면 폴더 생성
		if(!directory.exists()) {
			directory.mkdir();
		}
		
		//수정되거나 삭제되거나 추가된 파일정보가 담기는 List
		List<BoardFileVO> uFileList = new ArrayList<BoardFileVO>();
		
		for(int i = 0; i < originFileList.size(); i++) {
			if(originFileList.get(i).getBoardFileStatus().equals("U")) {
				for(int j = 0; j < changedFiles.length; j++) {
					if(originFileList.get(i).getNewFileNm().equals(changedFiles[j].getOriginalFilename())) {
						BoardFileVO boardFileVO = new BoardFileVO();
						
						MultipartFile file = changedFiles[j];
						
						boardFileVO = FileUtils.parseFileInfo(file, attachPath);
						
						//수정될 내용 추가하는 부분은 따로 작성
						boardFileVO.setBoardNo(originFileList.get(i).getBoardNo());
						boardFileVO.setBoardFileNo(originFileList.get(i).getBoardFileNo());
						boardFileVO.setBoardFileStatus("U");
						
						uFileList.add(boardFileVO);
					}
				}
			} else if(originFileList.get(i).getBoardFileStatus().equals("D")) {
				BoardFileVO boardFileVO = new BoardFileVO();
				
				boardFileVO.setBoardNo(originFileList.get(i).getBoardNo());
				boardFileVO.setBoardFileNo(originFileList.get(i).getBoardFileNo());
				boardFileVO.setBoardFileStatus("D");
				
				//실제 파일 삭제 처리
				//현재 예제에서는 업로드경로가 같아서 attachPath로 사용했지만
				//업로드 경로가 달라질 경우 화면에서 받아온 파일경로로 사용한다.
				File dFile = new File(attachPath + originFileList.get(i).getBoardFileNm());
				dFile.delete();
				
				uFileList.add(boardFileVO);
			}
		}
		
		if(uploadFiles.length > 0) {
			for(int i = 0; i < uploadFiles.length; i++) {
				MultipartFile file = uploadFiles[i];
				
				if(!file.getOriginalFilename().equals("") &&
					file.getOriginalFilename() != null) {
					BoardFileVO boardFileVO = new BoardFileVO();
					
					boardFileVO = FileUtils.parseFileInfo(file, attachPath);
					
					boardFileVO.setBoardNo(boardVO.getBoardNo());
					boardFileVO.setBoardFileStatus("I");
					
					uFileList.add(boardFileVO);
				}
			}
		}
		
		boardService.updateBoard(boardVO, uFileList);
		
		return "redirect:/board/getBoard.do?boardNo=" + boardVO.getBoardNo();
	}
	
	//게시글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(@RequestParam("boardNo") int boardNo) {
		boardService.deleteBoard(boardNo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
