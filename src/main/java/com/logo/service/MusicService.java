package com.logo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logo.action.MusicAction;
import com.logo.model.Album;
import com.logo.model.ChartMusic;
import com.logo.model.Music;
import com.logo.model.User;
import com.logo.model.UserListen;

@Service
public class MusicService {

	@Autowired
	MusicAction musicAction;

	public ArrayList<Album> newAlbumView() {
		List<Album> albums = musicAction.selectNewAlbums();
		return (ArrayList<Album>) albums;
	}

	public ArrayList<Music> topChartView() {
		List<Music> musics = musicAction.selectTopChart();
		return (ArrayList<Music>) musics;
	}

	public ArrayList<UserListen> userChartListenView(User user) {
		List<UserListen> userListens = musicAction.selectUserListen(user);
		return (ArrayList<UserListen>) userListens;
	}

	public ArrayList<Music> userChartMusicView(User user) {
		// TODO Auto-generated method stub
		List<Music> musics = musicAction.selectUserMusic(user);
		return (ArrayList<Music>) musics;
	}

	public void listenUpdate(String m_name, String u_id) {
		// TODO Auto-generated method stub
		musicAction.insertListen(m_name,u_id);
	}

}
