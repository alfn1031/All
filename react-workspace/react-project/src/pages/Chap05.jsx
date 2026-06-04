import { useState } from "react";

const Chap05 = () => {
  const [text, setText] = useState("");
  const [message, setMessage] = useState("값을 입력해보세요");

  const textHandler = (e) => {
    // console.log(e.target.value);
    setText(e.target.value);
    setMessage(e.target.value.length > 10 ? "글의 길이가 너무 깁니다." : message);
  };

  return (
    <>
      <h3>입력값 받기</h3>
      <br />
      <br />
      <input type="text" onChange={textHandler} />
      <br />
      <br />
      <label>사용자가 입력한 값 : {text}</label>
      <br />
      <br />
      <label>안내 메시지 : {message}</label>
    </>
  );
};

export default Chap05;
