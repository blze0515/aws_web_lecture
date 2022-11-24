package com.ezen.springboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.service.board.BoardService;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.PageVO;
import com.ezen.springboard.vo.UserVO;

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
	public String insertBoard(BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		
		//등록 후 게시글 목록으로 이동
		return "redirect:/board/getBoardList.do";
	}
	
	//게시글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) {
		BoardVO board = boardService.getBoard(boardNo);
		
		model.addAttribute("board", board);
		
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
	public String updateBoard(BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		
		return "redirect:/board/getBoard.do?boardNo=" + boardVO.getBoardNo();
	}
	
	//게시글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(@RequestParam("boardNo") int boardNo) {
		boardService.deleteBoard(boardNo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
