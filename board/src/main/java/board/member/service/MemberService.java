package board.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.member.dto.MemberDto;
import board.member.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;

	public List<MemberDto> selectMemberList() {

		return memberMapper.selectMemberList();
	}

	public void deleteMember(int memberidx) {

		memberMapper.deleteMember(memberidx);

	}

	public void insertMember(MemberDto memberDto) {
		memberMapper.insertMember(memberDto);
	}

	public MemberDto selectMemberOne(int memberidx) {

		return memberMapper.selectMemberOne(memberidx);
	}

	public void updateMember(MemberDto memberDto) {
		memberMapper.updateMember(memberDto);
	}

	public MemberDto getSelectId() {


		return memberMapper.getSelectId();
	}

	public int checkId(String memberemail)throws Exception {

		int result = memberMapper.checkId(memberemail);

		return result;
	}

	public MemberDto login(MemberDto memberDto) {


		return memberMapper.login(memberDto);
	}

	public MemberDto loginAdmin(MemberDto adminDto) {


		return memberMapper.loginAdmin(adminDto);
	}




}
