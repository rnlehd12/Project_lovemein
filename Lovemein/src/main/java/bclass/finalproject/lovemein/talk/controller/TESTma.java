
<insert id = "createRoom">
insert into CHATROOM (USER_user_id , TUTOR_USER_user_id, CLASS_class_id) 
values(#{USER_user_id}, #{TUTOR_USER_user_id} , #{CLASS_class_id} )


</insert>


<select id ="isRoom" resultType = "ChatRoomVO">

select * from CHATROOM WHERE USER_user_id = #{USER_user_id} and TUTOR_USER_user_id = #{TUTOR_USER_user_id} 
and CLASS_class_id = #{CLASS_class_id} 
</select>

<insert id = "insertMessage">
insert into MESSAGE (message_sender , message_receiver, message_content, 
CHATROOM_chatroom_id, USER_user_id , TUTOR_USER_user_id, CLASS_class_id)
values (#{message_sender}, #{message_receiver}, #{message_content} , #{CHATROOM_chatroom_id} , #{USER_user_id},
#{TUTOR_USER_user_id} , #{CLASS_class_id})
</insert>

<select id = "getPartner" resultType = "MessageVO">
SELECT USER_user_id from MESSAGE where TUTOR_USER_user_id = #{TUTOR_USER_user_id} and CLASS_class_id = #{CLASS_class_id}
</select>
<select id = "getProfile" resultType = "String">
select user_profileImagePath from USER WHERE user_id = #{user_id}
</select>

<select id = "getName" resultType = "String">
select user_name from USER where user_id = #{user_id}
</select>

<select id = "getMessageList" resultType = "MessageVO">
select m.* , user_name, user_profileImagePath from MESSAGE m left outer join USER u on m.message_sender = u.user_id where CHATROOM_chatroom_id = #{CHATROOM_chatroom_id}

</select>

<select id = "getRoomList" resultType = "ChatRoomVO">
select * from CHATROOM where USER_user_id = #{USER_user_id}
</select>
<select id = "getRoomList2" resultType = "ChatRoomVO">
select * from CHATROOM where TUTOR_USER_user_id = #{TUTOR_USER_user_id}
</select>

<select id = "getRecentMessage" resultType = "MessageVO">

select m.* , class_name, class_id , TUTOR_tutor_id from MESSAGE m left outer join CLASS c on m.CLASS_class_id = c.class_id 
where CHATROOM_chatroom_id = #{CHATROOM_chatroom_id} order by message_id desc limit 1;


</select>


<select id = "getTutorId" resultType = "String">
select tutor_id from TUTOR where USER_user_id = #{USER_user_id}
</select>

<update id ="updateReadTime">
update MESSAGE set message_readTime = NOW() where TUTOR_USER_user_id = #{TUTOR_USER_user_id} AND CLASS_class_id = #{CLASS_class_id} AND message_readTime = message_sendTime and message_sender = TUTOR_USER_user_id and USER_user_id = #{USER_user_id};
</update>
<update id ="updateReadTimeTutor">
update MESSAGE set message_readTime = NOW() where TUTOR_USER_user_id = #{TUTOR_USER_user_id} AND CLASS_class_id = #{CLASS_class_id} AND message_readTime = message_sendTime and message_sender = USER_user_id and USER_user_id = #{USER_user_id};

</update>


<select id = "getUnReadCount" resultType = "int">

select count(*) from MESSAGE where USER_user_id = #{USER_user_id} and TUTOR_USER_user_id = #{TUTOR_USER_user_id} AND CLASS_class_id = #{CLASS_class_id} AND message_readTime = message_sendTime and message_sender = TUTOR_USER_user_id;

</select>
<select id = "getUnReadCountTutor" resultType = "int">

select count(*) from MESSAGE where TUTOR_USER_user_id =#{TUTOR_USER_user_id} and CLASS_class_id = #{CLASS_class_id} AND message_readTime = message_sendTime and message_sender = USER_user_id and USER_user_id = #{USER_user_id};

</select>

<select id = "getAllCount" resultType = "int">
select count(*) from MESSAGE WHERE (TUTOR_USER_user_id = #{TUTOR_USER_user_id} and message_readTime = message_sendTime and message_sender != #{USER_user_id}) or (USER_user_id = #{USER_user_id} and message_readTime = message_sendTime and message_sender != #{USER_user_id}); 

</select>
