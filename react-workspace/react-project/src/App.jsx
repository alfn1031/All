import "./App.css";
import Chap01 from "./pages/Chap01";
import Chap02 from "./pages/Chap02";
import Chap03 from "./pages/Chap03";
import { Routes, Route } from "react-router-dom";
import Header from "./pages/common/Header/Header";
import Footer from "./pages/common/Footer/Footer";
import Chap04 from "./pages/Chap04";
import Chap05 from "./pages/Chap05";
import NoticeList from "./pages/Notice/NoticeList/NoticeList";
import ReplyList from "./pages/Reply/ReplyList";
import MemberList from "./pages/Member/MemberList";
import MemberDetail from "./pages/Member/MemberDetail";
import Foods from "./pages/Busan/List/Foods";
import Food from "./pages/Busan/Detail/food";

function App() {
  return (
    <>
      <Header />
      <Routes>
        <Route path="/" element={<h1>여기는 메인</h1>} />

        <Route path="//busans/:id" element={<Food />} />
        <Route path="/busans" element={<Foods />} />
        <Route path="/notices" element={<NoticeList />} />
        <Route path="/replies" element={<ReplyList />} />
        <Route path="/members" element={<MemberList />} />
        <Route path="/members/:id" element={<MemberDetail />} />
        <Route path="/chap01" element={<Chap01 />} />
        <Route path="/chap02" element={<Chap02 />} />
        <Route path="/chap03" element={<Chap03 />} />
        <Route path="/chap04" element={<Chap04 />} />
        <Route path="/chap05" element={<Chap05 />} />
        <Route path="*" element={<h1>존재하지 않는 페이지입니다</h1>} />
      </Routes>
      <Footer />
    </>
  );
}

export default App;
