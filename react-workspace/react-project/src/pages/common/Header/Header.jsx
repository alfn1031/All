import React from 'react';
import { useNavigate } from 'react-router-dom'; // 👈 이동 기능을 위해 꼭 필요해요!

export default function CuteHeader() {
  const navi = useNavigate(); // 👈 이제 onClick했을 때 실제로 페이지가 이동합니다!

  return (
    <header className="sticky top-0 z-50 w-full flex justify-between items-center px-8 py-4 rounded-b-[35px] bg-gradient-to-r from-[#FFC5D3] to-[#C5D9F9] shadow-[0_8px_20px_rgba(220,180,200,0.25)] font-sans">
      
      {/* 🐾 로고 영역 */}
      <div className="flex items-center gap-2 cursor-pointer transition-transform duration-300 hover:scale-110">
        <span className="text-2xl animate-bounce">🐾</span>
        <span className="text-xl font-bold text-[#6A567A] tracking-tight">
          Fluffy Tails
        </span>
      </div>

      {/* ─── 요청하신 온클릭 이동 메뉴 영역 (테일윈드 버전) ─── */}
      <nav className="flex gap-2 flex-wrap">
        <a 
          onClick={() => navi('/notices')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Notice
        </a>

        <a 
          onClick={() => navi('/chap01')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Chap01
        </a>
        
        <a 
          onClick={() => navi('/chap02')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Chap02
        </a>
        
        <a 
          onClick={() => navi('/chap03')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Chap03
        </a>
        
        <a 
          onClick={() => navi('/chap04')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Chap04
        </a>
        
        <a 
          onClick={() => navi('/chap05')} 
          className="cursor-pointer font-bold text-sm px-3 py-1.5 rounded-full bg-white/40 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:rotate-2 hover:bg-white/75 hover:text-[#4A365A]"
        >
          Chap05
        </a>

        <a 
          onClick={() => navi('/busans')} 
          className="cursor-pointer font-bold text-sm px-4 py-1.5 rounded-full bg-white/60 text-[#6A567A] select-none transition-all duration-300 hover:scale-105 hover:-rotate-2 hover:bg-white/90 hover:text-[#4A365A]"
        >
          ✨ 부산 맛집
        </a>
      </nav>
    </header>
  );
}