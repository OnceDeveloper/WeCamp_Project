package once.md.mapper;

import java.util.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import once.md.domain.Board;
import once.md.domain.BoardVo;
import once.md.persistence.DataSourceTests;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTests {
	@Autowired
	private BoardMapper2 boardMapper;
	
	@Test
	public void testSelectPerPage() {
		BoardVo boardVo = new BoardVo("", 1, 3);
		List<Board> list = boardMapper.selectByWriter(boardVo);
		log.info("#testSelectPerPage() ȣ��");
		for(Board board:list) {
			log.info("#seq : "+board.getSeq() +", #writer : " +board.getWriter());
		}
	}
	
	
	@Test
	public void testSelectCount() {
		log.info("#testSelectCount() count : "+boardMapper.selectCount());
	}
	
	@Test
	public void testSelectBySeq() {
		int seq=2;
		Board board = boardMapper.selectBySeq(seq);
		log.info("#testSelectBySeq() board: "+board);
	}
	
	@Test
	public void testSelectByWriter() {
		BoardVo boardVo = new BoardVo("��",2,2);
		List<Board> list = boardMapper.selectByWriter(boardVo);
		log.info("#testSelectByWriter() ȣ��");
		for(Board board:list) {
			log.info("#seq : "+board.getSeq() +", #writer : " +board.getWriter());
		}
	}
	
	@Test
	public void testInsert() {
		Board board = new Board(-1, "��","��","��","��",null);
		boardMapper.insert(board);
		log.info("#testInsert() ����");
	}
	
	@Test
	public void testUpdate() {
		Board board = new Board(10, "", "��1", "��1", "��1", null);
		boardMapper.update(board);
		log.info("#testUpdate() ����");
	}
	
	@Test
	public void testDelete() {
		boardMapper.delete(10);
		log.info("#testDelete() ����");
	}
	
}
