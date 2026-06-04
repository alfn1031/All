import { useEffect, useState } from "react";
import {
  RestaurantDetailMap,
  RestaurantWrap,
  RestaurantTitle,
  RestaurantDetailDescription,
  RestaurantDetailOther,
  RestaurantMoreButton,
  RestaurantDetailImg,
} from "../styles/FoodStyles";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";
import Review from "../Review/Review";

const Food = () => {
  const { id } = useParams();
  const navi = useNavigate();
  const [food, setFood] = useState({
    title: "",
    img: "",
    description: "",
    adress: "",
    usageTime: "",
    lat: "",
    lng: "",
  });
  const [content, setContent] = useState("");
  const [rating, setRating] = useState("");
  const [success, setSuccess] = useState(true);

  const contentHandler = (e) => {
    setContent(e.target.value);
  };
  const ratingHandler = (e) => {
    setRating(e.target.value);
  };

  const submitHandler = (e) => {
    e.preventDefault();

    if (content.trim() === "") {
      alert("내용을 입력하세요");
      return;
    }

    if (!Number(rating) || Number(rating) < 1 || Number(rating) > 5) {
      alert("별점은 1~5 사이의 숫자만 입력해주십시오");
      return;
    }

    axios
      .post(`http://localhost/api/busans/${id}/reviews`, {
        content: content,
        rating: rating,
      })
      .then((result) => {
        console.log(result);
        if (result.status === 201) {
          setContent("");
          setRating("1");
          alert("리뷰 작성에 성공했습니다");
          setSuccess((success) => !success);
        }
      });
  };

  useEffect(() => {
    axios.get(`http://localhost/api/busans/${id}`).then((result) => {
      // console.log(result);
      const food = result.data.getFoodKr.item[0];
      console.log(food);
      setFood({
        title: food.MAIN_TITLE,
        img: food.MAIN_IMG_NORMAL,
        description: food.ITEMCNTNTS,
        adress: food.ADDR1,
        usageTime: food.USAGE_DAY_WEEK_AND_TIME,
        lat: food.LAT,
        lng: food.LNG,
      });
    });
  }, []);

  useEffect(() => {
    if (food.lat === "") return;
    var container = document.getElementById("map");
    var options = {
      center: new kakao.maps.LatLng(food.lat, food.lng),
      level: 3,
    };
    var map = new kakao.maps.Map(container, options);
  }, [food.lat]);

  return (
    <>
      <RestaurantWrap>
        <RestaurantTitle>{food.title}</RestaurantTitle>
        <RestaurantDetailImg src={food.img} />
        <RestaurantDetailDescription>
          {food.description}
        </RestaurantDetailDescription>
        <RestaurantDetailOther>{food.address}</RestaurantDetailOther>
        <RestaurantDetailOther>{food.usageTime}</RestaurantDetailOther>
        <RestaurantDetailMap id="map"></RestaurantDetailMap>
        <RestaurantMoreButton onClick={() => navi(-1)}>
          뒤로가기
        </RestaurantMoreButton>
      </RestaurantWrap>
      <div
        style={{
          width: "80%",
          margin: "auto",
          height: "120px",
          border: "1px solid black",
          borderRadius: "20px",
        }}
      >
        <form onSubmit={submitHandler}>
          후기 작성 :{" "}
          <input
            type="text"
            placeholder="음식은 어떠셨나요? 후기를 남겨주세요."
            onChange={contentHandler}
            value={content}
          />
          <hr />
          별점 선택 :{" "}
          <input
            onChange={ratingHandler}
            type="number"
            max="5"
            placeholder="별점을 남겨주세요"
            onChange={ratingHandler}
            value={rating}
          />
          <hr />
          <button style={{ border: "1px solid black" }}>후기 남기기</button>
        </form>
      </div>

      <Review id={id} success={success} />
    </>
  );
};

export default Food;
