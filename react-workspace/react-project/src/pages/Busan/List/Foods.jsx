import {
  RestaurantTitle,
  RestaurantWrap,
  RestaurantList,
  RestaurantCard,
  RestaurantImg,
  RestaurantName,
  RestaurantMoreButton,
} from "../styles/FoodStyles";
import axios from "axios";
import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";

const Foods = () => {
  // 스프링 서버로 요청을 보내는 코드
  const [page, setPage] = useState(1);
  const [foods, setFoods] = useState([]);
  const [hasMore, setHasMore] = useState(true);
  const navi = useNavigate();

  useEffect(() => {
    axios.get(`http://localhost/api/busans?page=${page}`).then((result) => {
      // console.log(result);
      const res = result.data.getFoodKr.item;
      // console.log(res);
      setFoods([...foods, ...res]);
      if (res.lenght < 6) {
        setHasMore(false);
      }
    });
  }, [page]);

  const buttonHandler = () => {
    setPage((page) => page + 1);
  };

  return (
    <>
      <RestaurantWrap>
        <RestaurantTitle>음식점 구경하기</RestaurantTitle>

        <RestaurantList>
          {foods.length === 0 ? (
            <div>
              <RestaurantCard>
                <RestaurantImg></RestaurantImg>
                <RestaurantName>식당이름</RestaurantName>
              </RestaurantCard>
            </div>
          ) : (
            foods.map((e) => (
              <RestaurantCard
                key={e.UC_SEQ}
                onClick={() => navi(`/busans/${e.UC_SEQ}`)}
              >
                <RestaurantImg src={e.MAIN_IMG_THUMB} />
                <RestaurantName>{e.MAIN_TITLE}</RestaurantName>
              </RestaurantCard>
            ))
          )}
          {hasMore && (
            <RestaurantMoreButton onClick={buttonHandler}>
              뒤로가기
            </RestaurantMoreButton>
          )}
        </RestaurantList>
      </RestaurantWrap>
     
    </>
  );
};

export default Foods;
