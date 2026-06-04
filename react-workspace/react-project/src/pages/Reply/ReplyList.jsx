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

const ReplyList = () => {
  // 무엇을 작성해야하나요? => 스프링 부트 서버로 요청을 보내는 코드
  const [notices, setNotices] = useState([]);

  useEffect(() => {
    /*
    fetch("http://localhost/api/notices")
      .then((response) => response.json())
      .then((data) => console.log(data));
      */
    axios.get("http://localhost/api/replies").then((data) => {
      // console.log(data);
      setNotices(data.data);
    });
  }, []);

  return (
    <>
      <StyledWrap>
        <StyledTitle>댓글 목록</StyledTitle>

        <InnerWrap>
          {notices.length === 0 ? (
            <div>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
              <StyledCard></StyledCard>
            </div>
          ) : (
            notices.map((e) => {
              return (
                <StyledCard>
                  <StyledNo>{e.replyNo}번 공지</StyledNo>
                  <StyledNoticeTitle>{e.replyContent}</StyledNoticeTitle>
                  <StyledWriter>{e.replyWriter}</StyledWriter>
                </StyledCard>
              );
            })
          )}
        </InnerWrap>
      </StyledWrap>
    </>
  );
};

export default ReplyList;
