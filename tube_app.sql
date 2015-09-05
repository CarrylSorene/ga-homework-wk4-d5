drop table tube_videos;
create table tube_videos (
id serial8 primary key,
title varchar (200),
url text,
description varchar (500),
genre varchar (100)
);