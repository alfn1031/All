import axios from "axios";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const ReplyDetail = () => {
  const { reply } = useParams();

  const [reply, setReply] = useState({
    replyNo: "",
    refBno: "",
    replyWriter: "",
    replyContent: "",
    createDate: "",
    state: "",
  });

  const [load, isLoad] = useState(false);

  useEffect(() =>
    axios.get(`http://localhost/api/replies/${reply}`).then((res) => {
      console.log(res.data);
      const obj = res.data;
      setReply({
        replyNo: obj.replyNo,
        refBno: obj.refBno,
        replyWriter: obj.replyWriter,
        replyContent: obj.replyContent,
        createDate: obj.createDate,
        state: obj.state,
      });
      isLoad(true);
    }),
  );
};
