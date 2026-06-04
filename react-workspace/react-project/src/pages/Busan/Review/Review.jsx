import { useState, useEffect } from "react";
import axios from "axios";

const Review = (props) => {
  // console.log(props.id);
  const [review, setReview] = useState([]);
  

  useEffect(() => {
    axios
      .get(`http://localhost/api/busans/${props.id}/reviews`)
      .then((result) => {
        // console.log(result);
        setReview([...result.data]);
      });
  }, [props.success]);

  return (
    <>
      {review.lenght != 0 ? (
        review.map((e, i) => (
            <div style={{width:"80%", margin:"auto"}} key={i}>
                <hr />
                <h4>{e.content}</h4>
                <h5>{e.createDate}</h5>
                <h5>별점 : {e.rating}</h5>
            </div>
         ))
       ) : (
         <h2>아직 리뷰가 존재하지 않습니다.</h2>
      )}
    </>
  );
};

export default Review;
