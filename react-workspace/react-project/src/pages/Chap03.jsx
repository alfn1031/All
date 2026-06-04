// AJAX요청을 보내서 공지사항 목록을 조회해왔음
import { styled } from "styled-components";

const StyledDiv = styled.div`
  width: 100%;
  height: 120ps;
  border: 1px solid light gray;
  margin: auto;
  padding: 17px;
  color: white;
  background-color: ${(props) => (props.color ? props.color : "black")};
`;

const notices = [
  {
    noticeNo: "1",
    noticeTitle: "공지사항",
    noticeWriter: "admin",
    color: "yellow",
  },
  {
    noticeNo: "2",
    noticeTitle: "공지사항2",
    noticeWriter: "어드민",
    color: "green",
  },
  {
    noticeNo: "3",
    noticeTitle: "공지사항3",
    noticeWriter: "관리자",
  },
];

const NoticeInfo = (props) => {
  console.log(props);
  // 구조분해
  const { noticeTitle, noticeNo, noticeWriter, color } = props.notice;
  return (
    <StyledDiv color={color}>
      <h3>공지사항 제목 : {props.notice.noticeTitle} </h3>
      <strong> {noticeNo} </strong> | <label>{noticeWriter} </label>
    </StyledDiv>
  );
};

const PropPrint = (props) => {
  // props.num = 2;
  // props는 읽기 전용이기 떄문에 자식 컴포넌트에서 값을 변경하려고 해서는 안됨
  console.log(props);
};

const Chap03 = () => {
  if (notices.length == 0) {
    return <h1>조회 결과가 존재하지 않습니다.</h1>;
  }
  return (
    <>
      <PropPrint num={1} />
      {/* 1절
      <StyledDiv>
        <h3>공지사항 제목 : {notices[0].noticeTitle} </h3>
        <strong>{notices[0].noticeNo}</strong>
        <label>작성자 : {notices[0].noticeWriter}</label>
        <label>공지사항 번호 : {notices[0].noticeNo}</label>
        <label>제목 : {notices[0].noticeTitle}</label>
      </StyledDiv>

      <StyledDiv>
        <h3>공지사항 제목 : {notices[1].noticeTitle} </h3>
        <strong>{notices[1].noticeNo}</strong>
        <label>작성자 : {notices[1].noticeWriter}</label>
      </StyledDiv>

      <StyledDiv>
        <h3>공지사항 제목 : {notices[2].noticeTitle} </h3>
        <strong>{notices[2].noticeNo}</strong>
        <label>작성자 : {notices[2].noticeWriter}</label>
      </StyledDiv>
        */}

      {/* <NoticeInfo {...notices[2]} /> */}
      {/*
      <NoticeInfo notice={notices[0]} />
      <NoticeInfo notice={notices[1]} />
      <NoticeInfo notice={notices[2]} />
      */}
      {notices ? (
        notices.map((e) => <NoticeInfo notice={e} key={e.noticeNo} />)
      ) : (
        <h1>조회결과가 존재하지 않습니다.</h1>
      )}
      
      <hr />
      <p>
        React의 사용목적 : 웹 애플리케이션의 UI(화면) == MVC(View) <br />
        1. 화면 보여주기 <br />
        2. 필요한 값 입력받기 <br />
        3. 값 검증 <br />
        4. 요청 보내기 <br />
        5. 요청 결과 출력 <br />
      </p>
    </>
  );
};

export default Chap03;
