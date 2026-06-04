import {
  StyledWrap,
  StyledTitle,
  InnerWrap,
  StyledCard,
  StyledNo,
  StyledNoticeTitle,
  StyledWriter,
} from "../Notice/NoticeList/NoticeList.style";
import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const MemberList = () => {
  const [members, setMembers] = useState([]);
  const navi = useNavigate();

  useEffect(() => {
    axios.get("http://localhost/api/members").then((result) => {
      setMembers(result.data);
    });
  }, []);

  return (
    <>
      <StyledWrap>
        <StyledTitle>회원 목록</StyledTitle>

        <InnerWrap>
          {members.length === 0 ? (
            <div>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
            </div>
          ) : (
            members.map((e) => {
              return (
                <div onClick={() => navi(`/members/${e.userId}`)}>
                  <StyledNo>{e.userId}</StyledNo>
                  <StyledNoticeTitle>{e.userName} 님</StyledNoticeTitle>
                  <StyledWriter>{e.email}</StyledWriter>
                </div>
              );
            })
          )}
        </InnerWrap>
      </StyledWrap>
    </>
  );
};

export default MemberList;
