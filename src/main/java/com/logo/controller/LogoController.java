package com.logo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.logo.action.MusicAction;
import com.logo.model.Album;
import com.logo.model.ChartMusic;
import com.logo.model.Music;
import com.logo.model.PlayList;
import com.logo.model.User;
import com.logo.model.UserListen;
import com.logo.service.MusicService;

@Controller
public class LogoController {
	@Autowired
	MusicAction musicAction;

	@Autowired
	MusicService musicService;

	@Autowired
	HttpSession session;

	@RequestMapping("/sample")
	public String sampleMethod() {
		System.out.println("성공");
		return "/WEB-INF/pages/sample.jsp";
	}

	@RequestMapping("/index")
	public String indexMethod() {
		return "/WEB-INF/pages/index.jsp";
	}

	@RequestMapping("login")
	public String loginMethod() {
		return "/WEB-INF/pages/login.jsp";
	}

	@RequestMapping("join")
	public String joinMethod() {
		return "/WEB-INF/pages/join.jsp";
	}

	@RequestMapping("loging")
	public String logingMethod() {
		return "/WEB-INF/pages/logingIn.jsp";
	}
	
	@RequestMapping(value = "listen", method = RequestMethod.POST)
	public void listenUpdate(@RequestParam String m_name) {
		String u_id = (String)session.getAttribute("userID");
		musicService.listenUpdate(m_name,u_id);
	}

	@RequestMapping("/main")
	public String musicMainMethod(Model model) {
		// 유저 전체 공용 데이터 DTO
		ArrayList<Album> newAlbums = null; // 신규 출시 앨범 목록
		ArrayList<Music> topChart = null; // 실시간차트 TOP 100

		// 유저 개인 데이터
		ArrayList<UserListen> userChartListen = null; // 유저 그래프 데이터 (음악 청취 수)
		ArrayList<Music> userChartMusic = null; // 유저 그래프 음악 데이터
		ArrayList<PlayList> userPlaylist = null; // 유저 플레이리스트
		User user = new User();

		newAlbums = musicService.newAlbumView();
		topChart = musicService.topChartView();

		if (session.getAttribute("userID") != null) {
			String u_id = (String) session.getAttribute("userID");
			user.setU_id(u_id);

			userChartListen = musicService.userChartListenView(user);
			if (userChartListen.size() > 0) {

				userChartMusic = musicService.userChartMusicView(user);

				model.addAttribute("chartInfo", userChartListen);
				model.addAttribute("chartMusic", userChartMusic);
				model.addAttribute("viewChart", 1);
			} else {
				model.addAttribute("viewChart", 0);
			}

		} else {
			model.addAttribute("viewChart", 0);
		}

		model.addAttribute("newAlbums", newAlbums);
		model.addAttribute("topChart", topChart);

		return "/WEB-INF/pages/musicMain.jsp";
	}

}
