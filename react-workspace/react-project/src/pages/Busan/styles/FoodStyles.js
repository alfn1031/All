import styled from "styled-components";

export const RestaurantWrap = styled.div`
  width: 100%;
  max-width: 1200px;
  min-height: 1200px;
  margin: 30px auto;
  padding: 24px;
  border-radius: 24px;
  background-color: #18181b;
  box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
`;

export const RestaurantTitle = styled.h1`
  font-size: 48px;
  font-weight: 800;
  color: #fafafa;
  text-align: center;
  letter-spacing: -1px;
  margin: 48px 0;
`;

export const RestaurantList = styled.div`
  /* display: grid; */
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
  margin: auto;
  padding: 12px;
`;

export const RestaurantCard = styled.div`
  padding: 12px;
  border-radius: 16px;
  background-color: #27272a;
  border: 1px solid rgba(255, 255, 255, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;

  &:hover {
    cursor: pointer;
    transform: translateY(-4px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.5);
  }
`;

export const RestaurantImg = styled.img`
  width: 100%;
  height: 180px;
  object-fit: cover;
  border-radius: 12px;
`;

export const RestaurantName = styled.h3`
  font-weight: 700;
  text-align: center;
  font-size: 17px;
  color: #e4e4e7;
  margin: 14px 0 4px;
`;

export const RestaurantMoreButton = styled.div`
  width: 160px;
  height: 44px;
  line-height: 44px;
  text-align: center;
  margin: 40px auto 0;
  border-radius: 22px;
  background-color: #fafafa;
  color: #18181b;
  font-weight: 700;
  font-size: 16px;
  transition: all 0.2s ease;

  &:hover {
    cursor: pointer;
    background-color: transparent;
    color: #fafafa;
    box-shadow: 0 0 0 2px #fafafa inset;
  }
`;

export const RestaurantDetailImg = styled.img`
  width: 100%;
  height: 500px;
  object-fit: cover;
  border-radius: 16px;
`;

export const RestaurantDetailDescription = styled.div`
  font-size: 19px;
  font-weight: 600;
  line-height: 1.7;
  color: #e4e4e7;
  margin: 30px 0;
  padding: 30px;
  background-color: #27272a;
  border-radius: 16px;
`;

export const RestaurantDetailOther = styled.div`
  font-size: 18px;
  text-align: center;
  color: #a1a1aa;
  margin: 15px 0;
`;

export const RestaurantDetailMap = styled.div`
  width: 50%;
  height: 600px;
  margin: auto;
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 16px;
  box-sizing: border-box;
`;