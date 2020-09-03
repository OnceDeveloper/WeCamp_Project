package com.wecamp.auth;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutionException;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.wecamp.model.Member;

public class SnsLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm a z")
	private Date date;
	
	public SnsLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
						.apiSecret(sns.getClientSecret())
						.callback(sns.getRedirectUrl())
						.scope("profile")
						.build(sns.getApi20Instance());
		this.sns = sns;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public Member getUserProfile(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		System.out.println("#>accessToken : "+accessToken.getAccessToken());
		Member member = parseJson(response.getBody());
		member.setAccessToken(accessToken.getAccessToken());
		return member;
	}
	
	private Member parseJson(String body) throws IOException {
		Member member = new Member();
		System.out.println("#>body : "+body);
		
		ObjectMapper mapper = new ObjectMapper();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm a z");
		mapper.setDateFormat(df);
		JsonNode rootNode = mapper.readTree(body);
		
		
		if(this.sns.isNaver()) {
			JsonNode responseNode = rootNode.get("response");
			member.setEmail(responseNode.get("email").asText());
			member.setName(responseNode.get("name").asText());
			member.setNickname(responseNode.get("nickname").asText());
			//member.setBirth(responseNode.get("birth"));
			//System.out.println("#> birth : "+responseNode.get("birthday"));
		}
		return member;
	}
}
