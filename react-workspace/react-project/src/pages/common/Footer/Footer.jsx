import React from 'react';

const FooterAnimationStyles = () => (
  <style>{`
    @keyframes footerFloat {
      0% { transform: translateY(0px); }
      50% { transform: translateY(-5px); }
      100% { transform: translateY(0px); }
    }
    .footer-floating {
      animation: footerFloat 3s ease-in-out infinite;
    }
    .footer-icon-hover {
      cursor: pointer;
      display: inline-block;
      transition: transform 0.2s ease;
    }
    .footer-icon-hover:hover {
      transform: scale(1.2) rotate(5deg);
    }
  `}</style>
);

export default function CuteFooter() {
  const theme = {
    pink: '#FFC5D3',
    blue: '#C5D9F9',
    text: '#6A567A',
  };

  return (
    <footer style={{
      background: `linear-gradient(90deg, ${theme.blue} 0%, ${theme.pink} 100%)`,
      padding: '40px 20px 30px 20px',
      borderRadius: '35px 35px 0 0',
      boxShadow: '0 -8px 24px rgba(220, 190, 210, 0.2)',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      gap: '20px',
      width: '100%',
      boxSizing: 'border-box',
      fontFamily: 'sans-serif'
    }}>
      <FooterAnimationStyles />

      {/* 아기자기 데코 아이콘 */}
      <div style={{ display: 'flex', gap: '25px', fontSize: '24px' }}>
        <span className="footer-icon-hover">👩‍🌾</span>
        <span className="footer-floating" style={{ fontSize: '28px', display: 'inline-block' }}>⭐</span>
        <span className="footer-icon-hover">🐟</span>
      </div>

      {/* 감성 문구 */}
      <div style={{ 
        fontSize: '15px', 
        fontWeight: 'bold', 
        color: theme.text, 
        letterSpacing: '1.5px',
        textTransform: 'uppercase',
        display: 'flex',
        alignItems: 'center',
        gap: '6px'
      }}>
        Always with Love <span className="footer-floating" style={{display:'inline-block'}}>💖</span>
      </div>

      {/* 연한 구분선 */}
      <div style={{ width: '50px', height: '3px', backgroundColor: 'rgba(106, 86, 122, 0.15)', borderRadius: '2px' }} />

      {/* 카피라이트 */}
      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '4px' }}>
        <p style={{ margin: 0, fontSize: '12px', fontWeight: '500', color: 'rgba(106, 86, 122, 0.8)' }}>
          © 2026 Fluffy Tails Inc. All rights reserved.
        </p>
        <p style={{ margin: 0, fontSize: '11px', color: 'rgba(106, 86, 122, 0.5)', fontStyle: 'italic' }}>
          Hand-coded with care ✨
        </p>
      </div>
    </footer>
  );
}