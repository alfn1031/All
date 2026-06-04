/*
    NO, TITLE, WRITER
*/
import styled from "styled-components";

export const StyledWrap = styled.div`
  width: 100%;
  box-sizing: border-box;
  min-height: 800px;
  height: auto;
  background-color: pink;
`;

export const StyledTitle = styled.h1`
  font-size: 60px;
  color: white;
  font-weight: 800;
  text-align: center;
  margin: 65px 0px;
`;

export const InnerWrap = styled.div`
  width: 70%;
  margin : auto;
  border-radius : 15px
  min-height: 500px;
  height: auto;
  background-color: white;
  border : 10px dotted #C5D9F9;
`;

export const StyledCard = styled.div`
  width: 180px;
  height: 250px;
  margin: 10px 10px;
  padding: 10px;
  box-shadow: 0 8px 20px rgba(220, 180, 200, 0.25);
  border-radius: 18px;
  display: inline-block;
  vertical-align: top;

  &hover {
    cursor: pointer;
    opacity: 0.9;
  }
`;

export const StyledNo = styled.h4`
  font-size: 9x;
  font-weight: 400;
  color: #6A567A;
  margin: 20px;
`;

export const StyledNoticeTitle = styled.h2`
  font-size: 27px;
  font-weight: 600;
  color: #6A567A;
  margin: 20px;
`;

export const StyledWriter = styled.p`
  font-size: 24px;
  font-weight: 800;
  color: #6A567A;
`;
