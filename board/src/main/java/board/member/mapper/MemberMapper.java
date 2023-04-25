package board.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import board.member.dto.MemberDto;


@Mapper
public interface MemberMapper {


	public List<MemberDto> selectMemberList();

	public void deleteMember(int memberidx);

	public void insertMember(MemberDto memberDto);

	public MemberDto selectMemberOne(int memberidx);

	public void updateMember(MemberDto memberDto);

	public MemberDto getSelectId();

	public int checkId(String memberemail)throws Exception;

	public MemberDto login(MemberDto memberDto);

	public MemberDto loginAdmin(MemberDto adminDto);


}




