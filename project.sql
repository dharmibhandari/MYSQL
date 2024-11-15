-- DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);

DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);

DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);
DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);
DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);
DROP database social_media;
CREATE DATABASE social_media;
USE social_media;


CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE users
ADD email VARCHAR(30) NOT NULL;

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE videos (
  video_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  size FLOAT CHECK (size<10)
  
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
);

CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE hashtags (
  hashtag_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
);

CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
);

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);


INSERT INTO users(username, profile_photo_url, bio,email) VALUES 
("kanavphull","https://pbs.twimg.com/profile_images/1386885117428191232/70SyHOxP_400x400.jpg","Hedonist yet Spiritual || IT at NITJ 2024",'as1mobiles@gmail.com'),
('raj gupta' , '/klsadf893724:f//432' , 'soon to be updated','admin@1shopbuy.com'),
('Sahib Singh' , 'https://pbs.twimg.com/profile_images/1465003815820693506/gbTJoe66_400x400.jpg' ,"Life is a journey, It drives you MAD.|| IT NITJ'24",'12angeldesignworld@gmail.com'),
('Sakshi Warandani' , "https://vader.news/__export/1612817390103/sites/gadgets/img/2021/02/08/ian_somerhalder_vampires.jpg_246448593.jpg" , "NITJ wish me on 23 jan",'deepak@24sevenindia.com'),
("Omnicron Larson", "/sdfvsdf", "Heart Stealer",'101cartinfo@gmail.com'),
("dettol sharma", "/sdfvsdf", "Dettol Stealer",'the.yellow.gold@gmail.com'),
('sunil' , '/yisadf324//' , 'hotel manageemnt ','deepak@24sevenindia.com'),
('sanjay' , '/fduiahj43' , 'football lover','deepak@24sevenindia.com' ),
('Axel Sivert Anker' , '/adaskjnas','Norwegian','gazender.686@gmail.com'),
('Steven','/acdsccsdc', 'living life my way','sravi07@yahoo.com'),
('Jack','https://picsum.photos/100','𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐌𝐲 𝐏𝐫𝐨𝐟𝐢𝐥𝐞','contact@21fools.com'),
('Oliver','https://picsum.photos/101','𝐎𝐟𝐟𝐢𝐜𝐢𝐚𝐥 𝐀𝐜𝐜𝐨𝐮𝐧𝐭','the.yellow.gold@gmail.com'),
('James','https://picsum.photos/102','𝐖𝐢𝐬𝐡 𝐌𝐞 𝐎𝐧 𝟑 𝐎𝐜𝐭𝐨𝐛𝐞𝐫','contact@21fools.com'),
('Charlie','https://picsum.photos/103','aap yha aae kisliye','sravi07@yahoo.com'),
('Harris','https://picsum.photos/104','𝐒𝐚𝐧𝐬𝐤𝐚𝐫𝐢 𝐋𝐚𝐝𝐤𝐚','pawan.modi1@gmail.com'),
('Lewis','https://picsum.photos/105','aapne bulaya isilye','as1mobiles@gmail.com'),
('Leo','https://picsum.photos/106','𝐆𝐲𝐦 𝐋ø𝐯è𝐫','pawan.modi1@gmail.com'),
('Noah','https://picsum.photos/107','aae hai toh kaam bi btiye','sunglasses.24@gmail.com'),
('Alfie','https://picsum.photos/108','𝐒𝐢𝐧𝐠𝐥𝐞','deepak@24sevenindia.com'),
('Rory','https://picsum.photos/109','phle zara aap muskurae','pawan.modi1@gmail.com'),
('Alexander','https://picsum.photos/110','𝐑𝐞𝐬𝐩𝐞𝐜𝐭 𝐅𝐨𝐫 𝐀𝐥𝐥','umesh.agarwal@24x7safebuy.com'),
('Max','https://picsum.photos/111','𝐈𝐧𝐬𝐭𝐚𝐠𝐫𝐚𝐦 𝐊𝐢𝐧𝐠','as1mobiles@gmail.com'),
('Logan','https://picsum.photos/112','𝐂𝐚𝐤𝐞 𝐌𝐮𝐫𝐝𝐞𝐫 𝐎𝐧 𝟏𝟕 𝐉𝐮𝐧𝐞','101cartinfo@gmail.com'),
('Harry','https://picsum.photos/113','hhddsgb','shyamsunder121@gmail.com'),
('Theo','https://picsum.photos/114','♥️𝐏𝐡𝐨𝐭𝐨𝐠𝐫𝐚𝐩𝐡𝐲 ','info@3coinsplus.com'),
('Thomas','https://picsum.photos/115','siudgfibsiugs','wasif1@2dayenterprises.com'),
('Brodie','https://picsum.photos/116','𝐌𝐮𝐬𝐢𝐜 𝐀𝐝𝐝𝐢𝐜𝐭','shyamsunder121@gmail.com'),
('Archie','https://picsum.photos/117','uhiusgfufiusf','wasif1@2dayenterprises.com'),
('Jacob','https://picsum.photos/118',' 𝐒𝐢𝐧𝐠𝐥𝐞 ','mail@3gmobileworld.in'),
('Finlay','https://picsum.photos/119','usdsgbcu','mail@3gmobileworld.in'),
('Finn','https://picsum.photos/120','𝐏𝐫𝐨𝐮𝐝 𝐓𝐨 𝐁𝐞 𝐇𝐢𝐧𝐝𝐮','pawan.modi1@gmail.com'),
('Daniel','https://picsum.photos/121','hucussgcusn','shyamsunder121@gmail.com'),
('Joshua','https://picsum.photos/122','𝐁𝐢𝐠 𝐅𝐚𝐧 𝐎𝐟 𝐌𝐚𝐡𝐚𝐤𝐚𝐥','sunglasses.24@gmail.com'),
('Oscar','https://picsum.photos/123','𝐌𝐫.𝐩𝐞𝐫𝐟𝐞𝐜𝐭','gazender.686@gmail.com'),
('Arthur','https://picsum.photos/124','𝐇𝐚𝐭𝐞 𝐦𝐞 𝐨𝐫 𝐃𝐚𝐭𝐞 𝐦𝐞','.'),
('Hunter','https://picsum.photos/125','𝐩𝐡𝐨𝐭𝐨𝐡𝐨𝐥𝐢𝐤','mail@3gmobileworld.in'),
('Ethan','https://picsum.photos/126','gygyuuy','deepak@24sevenindia.com'),
('Mason','https://picsum.photos/127',' 𝐟𝐨𝐨𝐝𝐲 ','sunglasses.24@gmail.com'),
('Harrison','https://picsum.photos/128','gfytfvy','contact@21fools.com'),
('Freddie','https://picsum.photos/129','𝐬𝐢𝐧𝐠𝐥𝐞','contact@21fools.com'),
('Ollie','https://picsum.photos/130','fytfysguf','mail@3gmobileworld.in'),
('Adam','https://picsum.photos/131','𝐔 𝐰𝐢𝐥𝐥 𝐟𝐢𝐧𝐝 𝐚 𝐛𝐨𝐲 𝐛𝐞𝐭𝐭𝐞𝐫 𝐭𝐡𝐚𝐧 𝐦𝐞 𝐛𝐮𝐭 𝐔 𝐝𝐨𝐧’𝐭 𝐟𝐢𝐧𝐝 𝐛𝐨𝐲 𝐥𝐢𝐤𝐞 𝐦𝐞','sravi07@yahoo.com'),
('William','https://picsum.photos/132','fyasu','admin@1shopbuy.com'),
('Jaxon','https://picsum.photos/133','𝙊𝙛𝙛𝙞𝙘𝙞𝙖𝙡 𝙖𝙘𝙘𝙤𝙪𝙣𝙩','info@3coinsplus.com'),
('Aaron','https://picsum.photos/134','ytyftftyi','gazender.686@gmail.com'),
('Cameron','https://picsum.photos/135','uygdghfios','shyamsunder121@gmail.com'),
('Liam','https://picsum.photos/136','ygyugdysgc','wasif1@2dayenterprises.com'),
('George','https://picsum.photos/137','𝙈𝙪𝙨𝙞𝙘 𝙡𝙤𝙫𝙚𝙧','as1mobiles@gmail.com'),
('Jamie','https://picsum.photos/138','ygsgsogt','pawan.modi1@gmail.com'),
('Callum','https://picsum.photos/139','𝙎𝙥𝙤𝙧𝙩𝙨 𝙡𝙤𝙫𝙚𝙧','mail@3gmobileworld.in');




-- follows Database

INSERT INTO follows(follower_id, followee_id) VALUES (45, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (25, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (17, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 30);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 18);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (3, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 16);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 37);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (41, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (18, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (28, 7);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 12);
INSERT INTO follows(follower_id, followee_id) VALUES (4, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (37, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (5, 48);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (47, 6);
INSERT INTO follows(follower_id, followee_id) VALUES (26, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 42);
INSERT INTO follows(follower_id, followee_id) VALUES (20, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 11);
INSERT INTO follows(follower_id, followee_id) VALUES (34, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (24, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (32, 39);
INSERT INTO follows(follower_id, followee_id) VALUES (27, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (15, 46);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 49);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 20);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (8, 8);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 23);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 13);
INSERT INTO follows(follower_id, followee_id) VALUES (42, 40);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 26);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 17);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (45, 50);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (30, 25);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (12, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (14, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 1);
INSERT INTO follows(follower_id, followee_id) VALUES (48, 10);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (19, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (49, 35);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 34);
INSERT INTO follows(follower_id, followee_id) VALUES (22, 36);
INSERT INTO follows(follower_id, followee_id) VALUES (21, 5);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 9);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 38);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (36, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (44, 15);
INSERT INTO follows(follower_id, followee_id) VALUES (9, 43);
INSERT INTO follows(follower_id, followee_id) VALUES (46, 31);
INSERT INTO follows(follower_id, followee_id) VALUES (33, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (13, 33);
INSERT INTO follows(follower_id, followee_id) VALUES (16, 44);
INSERT INTO follows(follower_id, followee_id) VALUES (11, 45);
INSERT INTO follows(follower_id, followee_id) VALUES (38, 22);
INSERT INTO follows(follower_id, followee_id) VALUES (7, 14);
INSERT INTO follows(follower_id, followee_id) VALUES (23, 27);
INSERT INTO follows(follower_id, followee_id) VALUES (6, 29);
INSERT INTO follows(follower_id, followee_id) VALUES (43, 28);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 19);
INSERT INTO follows(follower_id, followee_id) VALUES (29, 41);
INSERT INTO follows(follower_id, followee_id) VALUES (10, 47);
INSERT INTO follows(follower_id, followee_id) VALUES (35, 2);
INSERT INTO follows(follower_id, followee_id) VALUES (50, 4);
INSERT INTO follows(follower_id, followee_id) VALUES (40, 24);
INSERT INTO follows(follower_id, followee_id) VALUES (2, 32);
INSERT INTO follows(follower_id, followee_id) VALUES (31, 21);
INSERT INTO follows(follower_id, followee_id) VALUES (39, 41);

-- HASHTAGS DATABASE 

INSERT INTO HASHTAGS(hashtag_name) VALUES (' #joinbtsarmy');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #kisaansupport');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #fitnessfreak');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #runforunity');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #studentlivesmatter');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #cancellJEEiit');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #REOPEN colleges');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #party');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #followme');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #christmas');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #socialmedia');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #family');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #festivesale');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #sunnyday');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #enjoy');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #weekendmasti');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #love');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #instagood');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #photooftheday');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #beautiful');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #fashion');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #tbt');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #happy');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #cute');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #followme');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #like4like');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #follow');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #me');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('  #picoftheday');
INSERT INTO HASHTAGS(hashtag_name) VALUES (' #selfie');
INSERT INTO HASHTAGS(hashtag_name) VALUES ('#GOGREEN ');


-- photo Database


INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/100', 26, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/101', 27, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/102', 28, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/103', 29, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/104', 30, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/105', 31, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/106', 32, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/107', 33, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/108', 34, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/109', 35, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/110', 36, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/111', 37, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/112', 38, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/113', 39, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/114', 40, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/115', 41, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/116', 42, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/117', 43, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/118', 44, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/119', 45, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/120', 46, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/121', 47, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/122', 48, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/123', 49, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/124', 50, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/125', 76, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/126', 77, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/127', 78, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/128', 79, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/129', 80, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/130', 81, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/131', 82, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/132', 83, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/133', 84, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/134', 85, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/135', 86, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/136', 87, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/137', 88, 4);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/138', 89, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/139', 90, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/140', 91, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/141', 92, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/142', 93, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/143', 94, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/144', 95, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/145', 96, 1);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/146', 97, 2);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/147', 98, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/148', 99, 3);
INSERT INTO photos(photo_url, post_id, size) VALUE ('https://picsum.photos/149', 100, 2);



-- video Database


INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=1TKJvWbZErY', 1, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=dcgeBa78WE8', 2, 8);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=vOfgVs6blGU', 3, 3);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=gDGbwhoWRBQ', 4, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=UAj7FB-BFGg', 5, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=RzppsLjuSaI', 6, 3);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=E1GLuxJ9mkU', 7, 3);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=tjrFQQjTI6c', 8, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=IwNSd7m2HRg', 9, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=4javFbk9Kn8', 10, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=BuX7TQc4a0E', 11, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=4xx0YqaFalo', 12, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=n3LCQiuQn9o', 13, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=x9bmo0aPd0s', 14, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=UkTWeGJewTQ', 15, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=6GwUPaJh2Jg', 16, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=odHuMbTWIvU', 17, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=XxvEchaofrs', 18, 8);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=3ZvSg5aU23E', 19, 6);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=yBJM2RbLefA', 20, 5);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=q6wb-EWR_lM', 21, 6);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=PcCDzONDVsA', 22, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=2ne9HcY53AY', 23, 8);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=OJeynsIPj9I', 24, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=kRGjTgObzX0', 25, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=btWZo8gUv-o', 51, 3);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=7j338SJZjoM', 52, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=fidBadXy1dw', 53, 5);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=1iem1pT2MkQ', 54, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=4N0ew6JMlss', 55, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=GXCdTSGNcOc', 56, 6);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=JFoJCMXzLLw', 57, 4);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=V-egEzLjnhc', 58, 5);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=6B5UK2GC3gY', 59, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=MVRRN6TABcs', 60, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=1ABkmrZxQkQ', 61, 5);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=cUz49dk86m8', 62, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=36BiplVD_Ng', 63, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=EoGYHDqbabw', 64, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=i1CmuuabIok', 65, 5);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=gurapeu6PBk', 66, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=coHgDPBMLKg', 67, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=racdVMrEghs', 68, 6);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=FKtbZtI0VJ0', 69, 9);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=bWqt7op1VpI', 70, 2);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=V_wXW4J73os', 71, 7);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=sHg9e9a_cYM', 72, 8);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=oaJJvO8Tte8', 73, 1);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=ancKcoTvdYY', 74, 3);
INSERT INTO videos(video_url, post_id, size) VALUE ('https://www.youtube.com/watch?v=n6kEYFPvtBY', 75, 8);


-- post_database


insert into post (post_id,photo_id,video_id,user_id,caption,location) values
(1,15,3,24,'HEY!!','VHA JHA KOI AATA JAATA NI'),
(2,21,47,28,'Live a good story.','The Red Fort, Delhi.'),
(3,45,6,37,'Escape the ordinary.','The Taj Mahal, Agra.'),
(4,7,37,23,'The best is yet to come.','Pangong Lake, Ladakh.'),
(5,4,22,35,'These are days we live for.','Valley of Flowers, Nainital.'),
(6,37,18,36,'Life happens, coffee helps.','Jaisalmer Fort, Jaisalmer.'),
(7,11,12,37,'Short sassy cute & classy.','Ruins of Hampi, Karnataka.'),
(8,50,30,6,'The future is bright.','Ghats at Varanasi, Uttar Pradesh.'),
(9,15,31,7,'Namastay in bed.','Backwaters, Kerala.'),
(10,10,44,44,'I have more issues than vogue.','abhayapuri'),
(11,8,32,5,'Life is short. Smile while you still have teeth.','achabbal'),
(12,9,25,32,'Ah, a perfectly captured selfie!','achalpur'),
(13,4,13,4,'Let’s just be who we are.','achhnera'),
(14,36,12,47,'One bad chapter doesn’t me','adari'),
(15,45,40,30,'Cinderella never asked for a prince.','adalaj'),
(16,39,17,35,'A selfie is worth a thousand words.','adilabad'),
(17,7,31,9,'Born to stand out with selfies.','adityana'),
(18,17,27,13,'I’m sorry I exist, here, a selfie.','pereyaapatna'),
(19,49,48,2,'….','adoni'),
(20,44,30,20,'dfgfsggf','adoor'),
(21,18,8,11,'4545','adyar'),
(22,47,7,38,'007@','adra'),
(23,40,32,4,',,,,','afzalpura'),
(24,45,24,6,'…..','agartala'),
(25,31,27,14,';;;@','agra'),
(26,39,11,14,'.','ahiwara'),
(27,38,7,16,'…','ahmedabad'),
(28,38,14,23,'….....','ahmedgarh'),
(29,41,35,9,'…..','ahmednagar'),
(30,1,9,15,'.///','ahmedpur'),
(31,39,14,21,'???/','aizawl'),
(32,42,3,5,'//""//','ajmer'),
(33,17,45,1,'Selfie on fleek.','ajra'),
(34,2,15,25,'This is how to become a heart breaker.','akaltara'),
(35,2,20,40,'No guts, no story.','akathiyoor'),
(36,24,33,26,'The selfie is the worst judge of beauty.','akhnoor'),
(37,7,15,4,'Nobody’s perfect…but I’m close.','akkalkot'),
(38,46,1,38,'Does this selfie make me look fat?','akola'),
(39,25,25,47,'Rate this selfie from 1-10.','akot'),
(40,49,6,39,'But first… let me take a selfie.','alandha'),
(41,49,45,5,'Gracing your feed with this fabulous selfie.','alandi'),
(42,21,30,47,'Mirror: “You look cute today.” Camera: “LOL, no.”','alang'),
(43,13,39,42,'Life is like a mirror, we get the best results when we smile.','alappuzha'),
(44,18,39,42,'Smile at the world, and she’ll smile back.','aldona'),
(45,35,20,3,'Keep the Smile On!','alibag'),
(46,25,24,7,'Please don’t download my Selfie, you may fall in love with me.','aligarh'),
(47,35,45,18,'Silly girls are the best.','alipurduar'),
(48,45,28,47,'I am not a selfie expert.','allahabad'),
(49,22,9,23,'Life is better when you’re smiling.','almora'),
(50,26,12,7,'I don’t take selfies all the time, just every day.','aalanavara'),
(51,46,10,43,'Be the best version of yourself.','along'),
(52,28,39,3,'Beauty begins the moment you decide to be yourself.','alur'),
(53,38,46,11,'Do more of what makes you happy.','assam'),
(54,14,20,22,'Anti-You.','jammu and kashmir'),
(55,28,17,42,'Sometimes I’m in a selfie mood.','maharashtra'),
(56,29,17,34,'I am not taking a selfie, I am just checking my camera quality.','maharashtra'),
(57,15,36,40,'Animal selfies are the best selfies.','uttar pradesh'),
(58,49,28,40,'Selfie Time!','west bengal'),
(59,36,21,20,'Simplicity is the key to brilliance.','uttar pradesh'),
(60,46,33,37,'There is beauty in simplicity.','uttarakhand'),
(61,22,16,10,'Be obsessively grateful.','karnataka'),
(62,15,37,9,'May your day feel as good as taking this perfect selfie on the first try.','arunachal pradesh'),
(63,9,43,14,'I’m not lazy, just relaxed.','maharashtra'),
(64,33,4,13,'Dinner time is selfie time.','maharashtra'),
(65,50,30,7,'I must have no selfie control.','karnataka'),
(66,4,4,20,'All-natural.','maharashtra'),
(67,13,20,17,'May your day feel as good as taking this perfect selfie on the first try.','gujarat'),
(68,44,42,12,'My favorite part about this selfie is the invisible crown.','kerala'),
(69,16,23,37,'Keep calm and take a selfie.','goa'),
(70,17,39,40,'Some call it arrogant, I call it confidence.','uttar pradesh'),
(71,10,39,29,'I woke up like this; flawless.','gujarat'),
(72,28,14,31,'“Who said I was an angel?”','andhra pradesh'),
(73,20,47,8,'Bout to make me give you a reason to be insecure.','gujarat'),
(74,13,27,37,'Dress like you’re already famous!','karnataka'),
(75,6,21,5,'You’re not fully dressed until you sparkle.','andhra pradesh'),
(76,32,21,19,'Normal is boring for me.','kerala'),
(77,40,15,19,'I am not trying to be cool, It’s what I am.','karnataka'),
(78,3,17,38,'I collect smiles, and then I give them away.','west bengal'),
(79,36,30,29,'A girl should be like a butterfly. Pretty to see, hard to catch.','karnataka'),
(80,25,14,18,'Queen of own world.','tripura'),
(81,41,2,37,'Being sexy is about attitude possessed, not a body type. It’s a state of mind.','uttar pradesh'),
(82,32,32,26,'Sexy is being confident, independent, and having fun.','chhattisgarh'),
(83,15,6,40,'If you cannot do great things, do small things in a great way.','gujarat'),
(84,8,9,29,'She turned her can’t into cans & her dreams into plans.','punjab'),
(85,19,28,27,'Coffee in one hand, Confidence in other.','maharashtra'),
(86,48,30,27,'Short hair, don’t care.','maharashtra'),
(87,40,14,16,'Be your own reason to smile.','mizoram'),
(88,22,18,14,'Seek respect, not attention.','rajasthan'),
(89,49,48,43,'I dress to impress myself.','maharashtra'),
(90,32,12,30,'A smile is the best makeup a girl can wear.','chhattisgarh'),
(91,17,23,3,'She was like a moon, a part of her always stayed hidden.','kerala'),
(92,33,8,11,'Smile with your eyes.','jammu and kashmir'),
(93,19,40,45,'Life is too short to wear boring clothes.','maharashtra'),
(94,49,27,44,'Lift up your head princess, if not the crown falls.','The Red Fort, Delhi.'),
(95,41,3,26,'Dressing well is the best revenge.','The Taj Mahal, Agra.'),
(96,22,4,47,'I don’t worry. I don’t doubt it. I’m daring. I’m a rebel.','Pangong Lake, Ladakh.'),
(97,36,34,7,'Life happens, coffee helps.','Valley of Flowers, Nainital.'),
(98,6,34,50,'You must be bold, brave, and courageous and find a way… to get in the way.','Jaisalmer Fort, Jaisalmer.'),
(99,23,1,30,'Don’t stop when you are tired. Stop when you are done!','Ruins of Hampi, Karnataka.'),
(100,31,45,36,'This is my moment I just feel so alive.','Ghats at Varanasi, Uttar Pradesh.');


-- post_tag Database

INSERT INTO post_tags(post_id, hashtag_id) VALUE (1, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (2, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (3, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (4, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (5, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (6, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (7, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (8, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (9, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (10, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (11, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (12, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (13, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (14, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (15, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (16, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (17, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (18, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (19, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (20, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (21, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (22, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (23, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (24, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (25, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (26, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (27, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (28, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (29, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (30, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (31, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (32, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (33, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (34, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (35, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (36, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (37, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (38, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (39, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (40, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (41, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (42, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (43, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (44, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (45, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (46, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (47, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (48, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (49, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (50, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (51, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (52, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (53, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (54, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (55, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (56, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (57, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (58, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (59, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (60, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (61, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (62, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (63, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (64, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (65, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (66, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (67, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (68, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (69, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (70, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (71, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (72, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (73, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (74, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (75, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (76, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (77, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (78, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (79, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (80, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (81, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (82, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (83, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (84, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (85, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (86, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (87, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (88, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (89, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (90, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (91, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (92, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (93, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (94, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (95, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (96, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (97, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (98, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (99, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (100, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (1, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (2, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (3, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (4, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (5, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (6, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (7, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (8, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (9, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (10, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (11, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (12, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (13, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (14, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (15, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (16, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (17, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (18, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (19, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (20, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (21, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (22, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (23, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (24, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (25, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (26, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (27, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (28, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (29, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (30, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (32, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (33, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (34, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (35, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (37, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (38, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (39, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (40, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (41, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (42, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (43, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (44, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (45, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (46, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (47, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (48, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (49, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (50, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (51, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (52, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (53, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (54, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (55, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (56, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (57, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (58, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (59, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (60, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (61, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (62, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (63, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (64, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (65, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (66, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (67, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (68, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (69, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (70, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (71, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (72, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (73, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (74, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (75, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (76, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (77, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (78, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (79, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (80, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (81, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (82, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (83, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (84, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (85, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (86, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (87, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (90, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (91, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (92, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (93, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (95, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (96, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (98, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (99, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (100, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (1, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (2, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (3, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (4, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (5, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (6, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (7, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (8, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (9, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (10, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (11, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (12, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (13, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (15, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (16, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (17, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (18, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (19, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (20, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (21, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (22, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (24, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (25, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (26, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (27, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (28, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (29, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (32, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (33, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (34, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (35, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (36, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (37, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (38, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (39, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (40, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (41, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (42, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (44, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (45, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (46, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (47, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (48, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (49, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (50, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (51, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (52, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (53, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (54, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (55, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (56, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (57, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (58, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (59, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (60, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (61, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (62, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (63, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (64, 18);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (65, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (67, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (68, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (69, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (70, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (71, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (73, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (74, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (75, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (77, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (78, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (79, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (80, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (81, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (82, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (83, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (84, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (85, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (86, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (88, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (89, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (90, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (91, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (92, 5);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (93, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (94, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (95, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (96, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (97, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (98, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (99, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (100, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (1, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (2, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (3, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (4, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (5, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (7, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (8, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (9, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (10, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (11, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (12, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (13, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (14, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (15, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (16, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (17, 1);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (18, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (19, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (20, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (22, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (23, 9);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (24, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (27, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (28, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (29, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (30, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (31, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (32, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (33, 15);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (34, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (35, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (36, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (38, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (40, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (41, 21);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (42, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (43, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (44, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (45, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (46, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (47, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (48, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (49, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (50, 30);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (51, 6);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (52, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (53, 8);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (54, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (55, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (56, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (57, 25);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (58, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (59, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (60, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (61, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (62, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (63, 28);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (64, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (65, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (66, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (67, 7);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (68, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (69, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (70, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (71, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (73, 23);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (74, 17);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (75, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (76, 26);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (77, 19);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (78, 16);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (79, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (80, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (81, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (82, 4);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (83, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (84, 22);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (85, 20);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (86, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (87, 12);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (88, 14);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (89, 11);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (90, 27);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (91, 2);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (92, 13);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (93, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (94, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (95, 24);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (96, 3);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (97, 10);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (98, 29);
INSERT INTO post_tags(post_id, hashtag_id) VALUE (99, 5);






-- post_likes

INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,60);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,69);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,13);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,72);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,4);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,44);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,57);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,32);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,26);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,39);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,51);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,20);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,71);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,37);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,88);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,22);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,7);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,98);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,38);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (18,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,50);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,81);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,63);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,25);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (13,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (20,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,23);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,29);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (35,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (29,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,46);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,48);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,33);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,100);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,1);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,31);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,64);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (48,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,74);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (22,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,5);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,47);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (41,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (50,12);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (14,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (31,10);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,24);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (37,79);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (10,14);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,21);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,92);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,40);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (26,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,41);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,9);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,93);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,76);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (27,95);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,86);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,52);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (44,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (28,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,59);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (21,8);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,18);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,2);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (45,78);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (23,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,73);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (5,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,3);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,34);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,99);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,36);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (2,42);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,30);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,84);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,82);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (6,75);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (33,87);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,94);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,80);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,55);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,16);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (24,66);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (8,97);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,70);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,19);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (19,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,43);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,90);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (47,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (38,6);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,53);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,15);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (43,56);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (32,35);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (16,61);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,89);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,11);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (49,83);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (36,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (3,85);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (25,67);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (9,27);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (42,91);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (12,77);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (11,28);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (15,96);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (40,49);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (46,65);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (17,45);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (1,17);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (30,62);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (39,68);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (34,58);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (7,54);
INSERT INTO POST_LIKES(user_id,post_id) VALUES (4,8);





#NAME?

INSERT INTO bookmarks(post_id, user_id) VALUE (8, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (92, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (23, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (48, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (82, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (91, 32);
INSERT INTO bookmarks(post_id, user_id) VALUE (71, 5);
INSERT INTO bookmarks(post_id, user_id) VALUE (80, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (80, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (59, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (6, 49);
INSERT INTO bookmarks(post_id, user_id) VALUE (74, 7);
INSERT INTO bookmarks(post_id, user_id) VALUE (45, 18);
INSERT INTO bookmarks(post_id, user_id) VALUE (76, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (44, 17);
INSERT INTO bookmarks(post_id, user_id) VALUE (65, 48);
INSERT INTO bookmarks(post_id, user_id) VALUE (35, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (31, 5);
INSERT INTO bookmarks(post_id, user_id) VALUE (54, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (21, 34);
INSERT INTO bookmarks(post_id, user_id) VALUE (38, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (47, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (68, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (43, 28);
INSERT INTO bookmarks(post_id, user_id) VALUE (77, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (95, 37);
INSERT INTO bookmarks(post_id, user_id) VALUE (67, 45);
INSERT INTO bookmarks(post_id, user_id) VALUE (62, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (66, 42);
INSERT INTO bookmarks(post_id, user_id) VALUE (63, 28);
INSERT INTO bookmarks(post_id, user_id) VALUE (88, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (67, 9);
INSERT INTO bookmarks(post_id, user_id) VALUE (63, 49);
INSERT INTO bookmarks(post_id, user_id) VALUE (19, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (49, 20);
INSERT INTO bookmarks(post_id, user_id) VALUE (16, 36);
INSERT INTO bookmarks(post_id, user_id) VALUE (39, 42);
INSERT INTO bookmarks(post_id, user_id) VALUE (96, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (95, 39);
INSERT INTO bookmarks(post_id, user_id) VALUE (74, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (50, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (53, 7);
INSERT INTO bookmarks(post_id, user_id) VALUE (6, 42);
INSERT INTO bookmarks(post_id, user_id) VALUE (29, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (69, 31);
INSERT INTO bookmarks(post_id, user_id) VALUE (62, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (4, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (53, 23);
INSERT INTO bookmarks(post_id, user_id) VALUE (29, 32);
INSERT INTO bookmarks(post_id, user_id) VALUE (25, 36);
INSERT INTO bookmarks(post_id, user_id) VALUE (18, 25);
INSERT INTO bookmarks(post_id, user_id) VALUE (49, 13);
INSERT INTO bookmarks(post_id, user_id) VALUE (5, 26);
INSERT INTO bookmarks(post_id, user_id) VALUE (17, 11);
INSERT INTO bookmarks(post_id, user_id) VALUE (39, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (91, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (41, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (56, 12);
INSERT INTO bookmarks(post_id, user_id) VALUE (33, 41);
INSERT INTO bookmarks(post_id, user_id) VALUE (64, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (10, 41);
INSERT INTO bookmarks(post_id, user_id) VALUE (77, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (23, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (54, 23);
INSERT INTO bookmarks(post_id, user_id) VALUE (56, 31);
INSERT INTO bookmarks(post_id, user_id) VALUE (98, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (16, 25);
INSERT INTO bookmarks(post_id, user_id) VALUE (13, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (85, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (18, 1);
INSERT INTO bookmarks(post_id, user_id) VALUE (90, 31);
INSERT INTO bookmarks(post_id, user_id) VALUE (58, 9);
INSERT INTO bookmarks(post_id, user_id) VALUE (58, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (99, 14);
INSERT INTO bookmarks(post_id, user_id) VALUE (80, 7);
INSERT INTO bookmarks(post_id, user_id) VALUE (26, 12);
INSERT INTO bookmarks(post_id, user_id) VALUE (95, 4);
INSERT INTO bookmarks(post_id, user_id) VALUE (42, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (85, 10);
INSERT INTO bookmarks(post_id, user_id) VALUE (56, 7);
INSERT INTO bookmarks(post_id, user_id) VALUE (62, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (31, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (20, 13);
INSERT INTO bookmarks(post_id, user_id) VALUE (52, 11);
INSERT INTO bookmarks(post_id, user_id) VALUE (57, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (5, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (41, 34);
INSERT INTO bookmarks(post_id, user_id) VALUE (59, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (17, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (95, 47);
INSERT INTO bookmarks(post_id, user_id) VALUE (52, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (1, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (68, 9);
INSERT INTO bookmarks(post_id, user_id) VALUE (32, 38);
INSERT INTO bookmarks(post_id, user_id) VALUE (24, 24);
INSERT INTO bookmarks(post_id, user_id) VALUE (2, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (89, 31);
INSERT INTO bookmarks(post_id, user_id) VALUE (29, 5);
INSERT INTO bookmarks(post_id, user_id) VALUE (100, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (34, 11);
INSERT INTO bookmarks(post_id, user_id) VALUE (10, 21);
INSERT INTO bookmarks(post_id, user_id) VALUE (14, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (21, 13);
INSERT INTO bookmarks(post_id, user_id) VALUE (96, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (84, 14);
INSERT INTO bookmarks(post_id, user_id) VALUE (58, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (78, 39);
INSERT INTO bookmarks(post_id, user_id) VALUE (45, 9);
INSERT INTO bookmarks(post_id, user_id) VALUE (14, 37);
INSERT INTO bookmarks(post_id, user_id) VALUE (72, 47);
INSERT INTO bookmarks(post_id, user_id) VALUE (56, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (12, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (61, 12);
INSERT INTO bookmarks(post_id, user_id) VALUE (59, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (62, 21);
INSERT INTO bookmarks(post_id, user_id) VALUE (2, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (20, 38);
INSERT INTO bookmarks(post_id, user_id) VALUE (7, 9);
INSERT INTO bookmarks(post_id, user_id) VALUE (67, 47);
INSERT INTO bookmarks(post_id, user_id) VALUE (59, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (59, 21);
INSERT INTO bookmarks(post_id, user_id) VALUE (37, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (57, 49);
INSERT INTO bookmarks(post_id, user_id) VALUE (96, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (45, 37);
INSERT INTO bookmarks(post_id, user_id) VALUE (25, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (65, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (58, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (72, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (71, 42);
INSERT INTO bookmarks(post_id, user_id) VALUE (66, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (31, 19);
INSERT INTO bookmarks(post_id, user_id) VALUE (22, 25);
INSERT INTO bookmarks(post_id, user_id) VALUE (83, 7);
INSERT INTO bookmarks(post_id, user_id) VALUE (4, 17);
INSERT INTO bookmarks(post_id, user_id) VALUE (100, 17);
INSERT INTO bookmarks(post_id, user_id) VALUE (64, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (49, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (66, 44);
INSERT INTO bookmarks(post_id, user_id) VALUE (94, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (77, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (83, 4);
INSERT INTO bookmarks(post_id, user_id) VALUE (35, 47);
INSERT INTO bookmarks(post_id, user_id) VALUE (89, 45);
INSERT INTO bookmarks(post_id, user_id) VALUE (51, 13);
INSERT INTO bookmarks(post_id, user_id) VALUE (6, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (84, 20);
INSERT INTO bookmarks(post_id, user_id) VALUE (12, 19);
INSERT INTO bookmarks(post_id, user_id) VALUE (41, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (95, 38);
INSERT INTO bookmarks(post_id, user_id) VALUE (16, 47);
INSERT INTO bookmarks(post_id, user_id) VALUE (94, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (24, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (38, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (77, 10);
INSERT INTO bookmarks(post_id, user_id) VALUE (76, 49);
INSERT INTO bookmarks(post_id, user_id) VALUE (88, 46);
INSERT INTO bookmarks(post_id, user_id) VALUE (69, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (26, 42);
INSERT INTO bookmarks(post_id, user_id) VALUE (77, 49);
INSERT INTO bookmarks(post_id, user_id) VALUE (19, 34);
INSERT INTO bookmarks(post_id, user_id) VALUE (98, 20);
INSERT INTO bookmarks(post_id, user_id) VALUE (25, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (9, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (3, 50);
INSERT INTO bookmarks(post_id, user_id) VALUE (3, 43);
INSERT INTO bookmarks(post_id, user_id) VALUE (99, 10);
INSERT INTO bookmarks(post_id, user_id) VALUE (51, 34);
INSERT INTO bookmarks(post_id, user_id) VALUE (71, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (9, 23);
INSERT INTO bookmarks(post_id, user_id) VALUE (16, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (86, 19);
INSERT INTO bookmarks(post_id, user_id) VALUE (26, 3);
INSERT INTO bookmarks(post_id, user_id) VALUE (79, 21);
INSERT INTO bookmarks(post_id, user_id) VALUE (3, 21);
INSERT INTO bookmarks(post_id, user_id) VALUE (99, 45);
INSERT INTO bookmarks(post_id, user_id) VALUE (78, 30);
INSERT INTO bookmarks(post_id, user_id) VALUE (30, 38);
INSERT INTO bookmarks(post_id, user_id) VALUE (17, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (16, 8);
INSERT INTO bookmarks(post_id, user_id) VALUE (32, 35);
INSERT INTO bookmarks(post_id, user_id) VALUE (62, 33);
INSERT INTO bookmarks(post_id, user_id) VALUE (47, 1);
INSERT INTO bookmarks(post_id, user_id) VALUE (45, 1);
INSERT INTO bookmarks(post_id, user_id) VALUE (57, 39);
INSERT INTO bookmarks(post_id, user_id) VALUE (74, 37);
INSERT INTO bookmarks(post_id, user_id) VALUE (89, 22);
INSERT INTO bookmarks(post_id, user_id) VALUE (66, 40);
INSERT INTO bookmarks(post_id, user_id) VALUE (73, 2);
INSERT INTO bookmarks(post_id, user_id) VALUE (29, 6);
INSERT INTO bookmarks(post_id, user_id) VALUE (31, 38);
INSERT INTO bookmarks(post_id, user_id) VALUE (86, 27);
INSERT INTO bookmarks(post_id, user_id) VALUE (37, 12);
INSERT INTO bookmarks(post_id, user_id) VALUE (47, 2);



-- comment Database


INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('great man',26,6);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('looking greate bhai',12,17);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('nice place keep enjoying',29,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('great bhai meetu soon ',49,21);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('aag lga di bhai',37,34);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('briallant keep working',3,34);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('soon will join you all',86,21);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('nice man !! loved it',81,28);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('bawnadar aayega abb ',83,48);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('boht tezz ho rhe ho ',38,23);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('bade acche ho beta',92,27);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('rakh neeche rakh teri toh',83,7);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('kaise ho bro',5,50);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('aag lga di h bss fire extinguisher bulana pdega',42,4);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('ek kahani h jo sabko sunnani h jakne wako ki toh rooh bhi jaalani h',59,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('mast h bhai , mill tabb btata hu kon mast h ',62,31);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('sahi lgg rha h bss ',27,8);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I think this is the best I’ve seen till now.',83,36);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' Not enough for me, you are everything.',34,13);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' Just when I couldn’t love you more. You posted this pic and my jaw dropped to the floor.',81,46);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are a symbol of beauty.',77,38);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' Surely you are the most beautiful woman alive, the most that I’ve seen.',96,19);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You mean the world to me.',58,10);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('The word pretty is worthless without you.',64,44);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the definition of Beauty',81,4);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Flawless outstanding eccentric lovely beauty.',36,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('The stars, the moon, and the sun are minor to me since you sparkle brighter than all of them.',45,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are graceful.',21,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' Surely you would have been arrested if looking immensely beautiful was a crime.',3,46);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You’re an incredibly stunning, a really pretty, beautiful woman.',51,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' I guess this is your best look, you look beautiful in this outfit.',37,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You look mesmerizing.',68,22);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I wonder how cute you would be looking when you sleep.',6,35);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are so much lovely.',29,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I love your curly hair.',2,14);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your dressing sense is appreciable.',39,41);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' You are the sweetest girl I have ever seen.',40,33);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('. I love that straight hair of yours.',79,29);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are pleasing.',45,35);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Just ‘WOW’ for your natural beauty.',41,33);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are cute.',18,49);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I love how comfortable you are in your world.',45,14);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are very much adorable.',39,5);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You look even more pretty without makeup.',47,45);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I feel so happy to be with you.',85,13);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are my safest place.',51,35);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You look beautiful in that dress.',99,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('. I wish I had your makeup.',5,23);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are stunning.',78,14);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('. That natural beauty tho.',25,14);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You have the most beautiful, sparkling eyes.',86,46);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You have the most beautiful smile.',70,10);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('. Your sense of fashion is great.',70,22);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' I like your hair.',25,32);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('. You look more beautiful than in the photo.',24,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' You look stunning.',94,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You’re classy.',89,34);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES (' You’re very trendy',100,1);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Landscape/Scenery:',75,40);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Great shot!',82,29);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Nice shot!!',93,6);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Love the view.',74,31);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Did you have fun up there?',46,11);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Selfie/picture of themselves:',13,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Looking good!',31,7);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Pretty/beautiful!',57,44);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Handsome!',58,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('OH MAH GOSH!!',35,7);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('?????? (three heart-eyed emojis)',20,43);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Sexy pose of themselves:',98,31);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('MESSY!',84,36);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('OMG!',29,42);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('OMG! Be my wife or dad already!!',100,35);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Hot',3,7);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('?????? (three heart-eyed emojis)',44,7);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Wtf, how are you so pretty/handsome?',42,19);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Wow!! In love!!',32,19);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Classic',59,6);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Picture of their outfit or OOTD (outfit of the day):',99,9);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Ou la la',25,32);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Gorgeous!!',12,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Love your outfit!!',71,1);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Looking good, man.',2,33);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('A picture of their pet/pets:',26,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Soooooo cute!!',48,44);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('cute!',18,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('lovely pet you got there!',22,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('An inspirational quote:',36,48);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Inspired! Thanks for the share.',66,12);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Needed that, thanks!',11,35);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I agree/disagree.',13,21);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Inspirational',94,13);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('A picture of their family or children:',28,26);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Lovely children.',29,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Adorable kids, you got there!',76,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('They will grow up so fast!',6,23);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I remember when they were X small!! Time flies by to fast!',80,24);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('A picture of their meal:',27,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Looks delish! Did you cook that?!?',5,30);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Yummy in my tummy. Yum!',87,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Enjoy!!',18,16);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('??????(the drooling mouth emoji)',73,5);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Death of a loved one:',30,31);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Sorry for your loss. My condolences go to you and your family.',26,37);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Rip (person’s name).',80,49);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Sorry for your loss, friend. If you need to talk, I’m always there for you.',48,43);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('My condolences.',56,5);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Anniversary:',66,50);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Congrats!',92,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Congratulations on your X years of marriage/engagement!!',86,49);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Woo!! Congrats newlywed!',26,44);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I’m so happy for you.',16,24);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Great shot!!',60,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Clean shot!!',53,26);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Crisp shot man.',88,11);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I love the aesthetics of this picture.',39,13);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('The bookeh is dope',52,26);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Great tones man',72,41);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This one is classic',83,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This one is fire',39,3);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('great concepts.',58,40);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Beautiful picture, love the colors.',30,13);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Woow!! Hands down!!',45,27);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This is purely magic.',18,36);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your content is amazing.',19,6);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Nice shot… etc etc :)',21,29);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your beauty is irresistible!!',49,25);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You look energetic.',13,14);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Impressive picture.',100,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You look strong and confident.',95,49);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This picture is lit!!',20,9);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Adorable picture.',59,45);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your smile makes me Happy.',5,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Looking Gorgeous .',83,43);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This picture made my day.',59,45);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your beauty has no boundaries.',3,12);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('My word can’t describe your beauty!!',67,22);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ("Your eyes sparkle like something I've never seen before.",27,8);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Handsome hunk',35,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('That beard tho (if you go in for details)',86,50);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ("That's dope",69,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Nailed it',62,48);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('My squad',69,19);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('High af',67,11);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Awesome',4,40);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Bromantic',42,11);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Hero',33,15);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This boy is mine',94,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('My man',93,36);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I own this male',49,8);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('He + me = forever',7,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You mean the world to me',85,42);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Cant get my eyes off',16,26);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('In nature, light creates the color. In the picture, color creates the light.',44,41);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('NICE GREAT',60,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('The beauty has no boundaries in this picture.',43,9);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('SUPER ',23,31);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Your beauty is irresistible.',71,43);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('ADORABLE CHILL LIFE',83,30);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Such a charming picture.',11,40);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('CHAL BE HERO',96,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Elegant picture.',30,42);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('NICE PLACE AND WATVH',41,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('My words are less to describe this picture.',49,32);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('FDSAFDS',22,1);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Beauty lies within for those who choose to see.',33,48);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('BASDHIYAYY',3,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('The power of beauty lies within the soul.',29,6);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('KICKASS LOKK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',15,23);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This picture is worth a thousand words.',41,47);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('GREAT TO SEE U ALIVE ',8,33);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Beauty is power; a smile is its sword.',1,24);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('MSRJAA AJJJRJKLFDSA',68,41);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('This place looks exotic.',2,46);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('DUBAI IS SLIVWE',61,36);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('I love how vibrant colors are in the picture.',10,18);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('GOOOD DATYYYYYYYYYYYYYYYYYYYYYYYYYYYYY',38,20);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Such a scenic view ,looks great.',64,49);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('WONDERFUL IMORESSIVE',69,16);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Impressive picture.',4,28);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('AAGT LGADI BHAI MAJA AA GYA ',78,39);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Adorable picture and Your smile makes me Happy.',42,30);
INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('such a nice cute humbke kind gentke face',1,1);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Looking Gorgeous and This picture made my day. ', 61,1);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ("Never seen a selfie of yours that I don't like. ", 29,48);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the coolest. ', 97,27);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the coolest. ', 69,19);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the coolest. ', 25,15);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the coolest. ', 66,23);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Friends forever. ', 6,5);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('They say love is beautiful, but I say friendship is better. ', 13,9);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('AAGT LGADI BHAI MAJA AA GYA  ', 26,32);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('Impressive picture. ', 72,39);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('MSRJAA AJJJRJKLFDSA ', 23,31);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('COOL PIC ', 58,4);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('You are the coolest. ', 68,34);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('xing of public record ', 93,48);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('GREAT JOB ', 10,6);
 INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES ('GOOOD DAY !!!!!!!!!!!!!!!!!!!! ', 98,46);


INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 2);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 1);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 7);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(8 , 3);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 1);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 2);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 9);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(2 , 8);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 3);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(7 , 5);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(31 , 91);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 57);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 191);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 196);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 162);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 118);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 152);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 159);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(40 , 98);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 113);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 110);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 78);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 53);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(15 , 82);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 12);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(42 , 14);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(31 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 132);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(18 , 195);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 199);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 198);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 137);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 187);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 101);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 95);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(2 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 192);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 24);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 147);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(28 , 80);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 184);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 26);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 132);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 85);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(2 , 157);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 47);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 59);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 65);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 14);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(24 , 52);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(15 , 81);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 148);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 122);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 177);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 133);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 31);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 17);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 14);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 171);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 143);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 5);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 32);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 156);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 86);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 99);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 143);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 15);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 114);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 96);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 198);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 111);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 149);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 88);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(24 , 25);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 107);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(15 , 22);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 177);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 168);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 96);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 149);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(7 , 153);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 82);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 58);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 136);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 144);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 173);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 71);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 69);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(10 , 89);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 33);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 188);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 102);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 87);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 37);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 194);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 36);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 158);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(35 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 51);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 74);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(8 , 115);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 86);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(18 , 180);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 59);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 37);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 131);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 142);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 163);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 171);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 62);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 151);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(18 , 6);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 25);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 48);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 178);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 54);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 130);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 195);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 58);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 27);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(35 , 85);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 196);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 36);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 104);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 141);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 65);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(28 , 179);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(31 , 189);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 138);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 18);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(40 , 167);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 140);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(15 , 124);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(7 , 3);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 77);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 42);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 41);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 58);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 190);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 105);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 28);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 91);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 51);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 17);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 193);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 34);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 82);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 135);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 134);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 6);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 64);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 130);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(41 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 54);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 139);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 139);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 182);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 68);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 170);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 25);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 82);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 42);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 76);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 84);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 14);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 106);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 155);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 19);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(35 , 47);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 36);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 104);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 94);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 99);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 66);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 171);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(8 , 106);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 45);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(15 , 190);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 38);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 196);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 119);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(2 , 57);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 130);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 198);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(10 , 150);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 196);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 180);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 78);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 17);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 164);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(41 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 5);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 144);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 116);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 55);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(41 , 87);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(41 , 138);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 11);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 84);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 115);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 175);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 53);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 79);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 102);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 133);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 168);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 56);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 181);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 53);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 28);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 120);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(24 , 191);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 166);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 29);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 160);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 42);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 45);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 41);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 94);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 69);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(42 , 114);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(40 , 140);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 124);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(18 , 181);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 195);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 178);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 111);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 100);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 61);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 121);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 78);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 42);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(3 , 114);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 197);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 26);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(28 , 198);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 99);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 175);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 25);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 99);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 31);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(4 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 174);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 5);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 57);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 29);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 33);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 48);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 106);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 112);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 150);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 66);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(10 , 138);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 136);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 133);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 100);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 123);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 90);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 45);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 198);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 168);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 41);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 71);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 191);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 176);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 69);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 124);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 8);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 189);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 106);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 40);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(31 , 169);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(43 , 168);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 62);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 53);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 150);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 148);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(46 , 102);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 46);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(41 , 130);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 172);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 186);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 114);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 71);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(1 , 133);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 24);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 92);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 134);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(24 , 111);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 93);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(35 , 13);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 141);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 121);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 110);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 55);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(42 , 146);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 142);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 74);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 155);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 171);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(17 , 176);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(40 , 111);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 14);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 130);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 191);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(47 , 77);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 20);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 128);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(39 , 134);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(44 , 159);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 151);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(24 , 149);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(20 , 76);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(38 , 48);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(6 , 115);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(16 , 22);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 25);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 73);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(35 , 164);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 140);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(34 , 133);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 183);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(19 , 87);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 70);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(48 , 97);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(5 , 147);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 186);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(10 , 110);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 187);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 137);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 195);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(12 , 137);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(23 , 99);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(29 , 30);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 162);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 42);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(11 , 9);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(13 , 138);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(32 , 49);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(37 , 131);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 129);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 32);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 73);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(9 , 153);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 178);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(31 , 81);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(18 , 102);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(26 , 55);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(45 , 4);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 74);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 93);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 90);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(25 , 12);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 72);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(49 , 81);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(36 , 178);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(21 , 101);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 45);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(22 , 148);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(33 , 120);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(28 , 2);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(50 , 106);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(27 , 177);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(30 , 162);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(10 , 191);
INSERT INTO COMMENT_LIKES(user_id,comment_id) VALUES(14 , 115);



-- hashtag_follow




insert into hashtag_follow (user_id,hashtag_id) values
(4,28),
(27,13),
(42,10),
(10,1),
(15,22),
(7,26),
(5,4),
(50,12),
(45,13),
(41,12),
(21,18),
(8,15),
(25,2),
(45,5),
(21,25),
(1,15),
(34,14),
(47,17),
(18,13),
(13,17),
(16,22),
(8,18),
(19,5),
(33,24),
(16,13),
(18,5),
(20,25),
(4,7),
(9,21),
(46,26);





-- LOGIN TABLE DATABASE

INSERT INTO LOGIN(user_id , ip) VALUES (19,'186.83.147.14');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'95.43.246.66');
INSERT INTO LOGIN(user_id , ip) VALUES (34,'105.238.37.204');
INSERT INTO LOGIN(user_id , ip) VALUES (36,'13.120.97.136');
INSERT INTO LOGIN(user_id , ip) VALUES (36,'0.83.214.172');
INSERT INTO LOGIN(user_id , ip) VALUES (34,'20.182.93.222');
INSERT INTO LOGIN(user_id , ip) VALUES (11,'200.237.53.32');
INSERT INTO LOGIN(user_id , ip) VALUES (28,'41.81.231.81');
INSERT INTO LOGIN(user_id , ip) VALUES (25,'24.223.2.33');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'8.168.37.68');
INSERT INTO LOGIN(user_id , ip) VALUES (24,'129.91.145.75');
INSERT INTO LOGIN(user_id , ip) VALUES (42,'8.65.175.204');
INSERT INTO LOGIN(user_id , ip) VALUES (15,'242.220.82.190');
INSERT INTO LOGIN(user_id , ip) VALUES (6,'107.137.170.154');
INSERT INTO LOGIN(user_id , ip) VALUES (10,'206.40.219.225');
INSERT INTO LOGIN(user_id , ip) VALUES (2,'136.186.80.29');
INSERT INTO LOGIN(user_id , ip) VALUES (13,'234.153.100.73');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'137.168.133.16');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'248.119.108.48');
INSERT INTO LOGIN(user_id , ip) VALUES (46,'92.178.211.66');
INSERT INTO LOGIN(user_id , ip) VALUES (17,'25.177.94.84');
INSERT INTO LOGIN(user_id , ip) VALUES (22,'40.165.240.121');
INSERT INTO LOGIN(user_id , ip) VALUES (38,'14.217.104.111');
INSERT INTO LOGIN(user_id , ip) VALUES (26,'17.82.20.179');
INSERT INTO LOGIN(user_id , ip) VALUES (31,'183.67.159.170');
INSERT INTO LOGIN(user_id , ip) VALUES (36,'211.7.231.108');
INSERT INTO LOGIN(user_id , ip) VALUES (41,'20.81.221.177');
INSERT INTO LOGIN(user_id , ip) VALUES (2,'235.195.9.138');
INSERT INTO LOGIN(user_id , ip) VALUES (15,'206.230.99.108');
INSERT INTO LOGIN(user_id , ip) VALUES (38,'196.138.60.144');
INSERT INTO LOGIN(user_id , ip) VALUES (6,'103.52.7.34');
INSERT INTO LOGIN(user_id , ip) VALUES (34,'232.209.180.248');
INSERT INTO LOGIN(user_id , ip) VALUES (15,'109.26.198.247');
INSERT INTO LOGIN(user_id , ip) VALUES (45,'76.38.160.92');
INSERT INTO LOGIN(user_id , ip) VALUES (47,'239.166.182.14');
INSERT INTO LOGIN(user_id , ip) VALUES (40,'225.130.239.107');
INSERT INTO LOGIN(user_id , ip) VALUES (46,'250.158.54.36');
INSERT INTO LOGIN(user_id , ip) VALUES (10,'173.160.71.20');
INSERT INTO LOGIN(user_id , ip) VALUES (38,'200.10.166.141');
INSERT INTO LOGIN(user_id , ip) VALUES (15,'195.136.72.29');
INSERT INTO LOGIN(user_id , ip) VALUES (42,'58.64.148.8');
INSERT INTO LOGIN(user_id , ip) VALUES (38,'245.136.26.79');
INSERT INTO LOGIN(user_id , ip) VALUES (5,'16.152.146.172');
INSERT INTO LOGIN(user_id , ip) VALUES (36,'56.127.227.250');
INSERT INTO LOGIN(user_id , ip) VALUES (25,'136.191.250.64');
INSERT INTO LOGIN(user_id , ip) VALUES (19,'28.190.80.226');
INSERT INTO LOGIN(user_id , ip) VALUES (33,'247.63.28.170');
INSERT INTO LOGIN(user_id , ip) VALUES (47,'77.112.183.186');
INSERT INTO LOGIN(user_id , ip) VALUES (26,'147.228.253.137');
INSERT INTO LOGIN(user_id , ip) VALUES (33,'3.70.234.168');
INSERT INTO LOGIN(user_id , ip) VALUES (24,'213.98.160.235');
INSERT INTO LOGIN(user_id , ip) VALUES (45,'224.112.90.6');
INSERT INTO LOGIN(user_id , ip) VALUES (39,'163.233.26.24');
INSERT INTO LOGIN(user_id , ip) VALUES (9,'128.79.68.115');
INSERT INTO LOGIN(user_id , ip) VALUES (20,'0.36.210.165');
INSERT INTO LOGIN(user_id , ip) VALUES (13,'138.32.95.212');
INSERT INTO LOGIN(user_id , ip) VALUES (22,'233.203.24.116');
INSERT INTO LOGIN(user_id , ip) VALUES (22,'45.87.104.147');
INSERT INTO LOGIN(user_id , ip) VALUES (2,'178.217.157.41');
INSERT INTO LOGIN(user_id , ip) VALUES (42,'6.29.50.100');
INSERT INTO LOGIN(user_id , ip) VALUES (11,'99.177.102.209');
INSERT INTO LOGIN(user_id , ip) VALUES (25,'242.87.45.152');
INSERT INTO LOGIN(user_id , ip) VALUES (12,'187.170.52.130');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'112.10.139.193');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'73.147.94.38');
INSERT INTO LOGIN(user_id , ip) VALUES (50,'157.45.4.120');
INSERT INTO LOGIN(user_id , ip) VALUES (33,'176.2.26.232');
INSERT INTO LOGIN(user_id , ip) VALUES (14,'103.225.38.110');
INSERT INTO LOGIN(user_id , ip) VALUES (38,'81.42.205.37');
INSERT INTO LOGIN(user_id , ip) VALUES (26,'200.166.27.162');
INSERT INTO LOGIN(user_id , ip) VALUES (8,'131.236.23.35');
INSERT INTO LOGIN(user_id , ip) VALUES (43,'107.163.201.212');
INSERT INTO LOGIN(user_id , ip) VALUES (46,'211.68.48.44');
INSERT INTO LOGIN(user_id , ip) VALUES (34,'159.155.216.188');
INSERT INTO LOGIN(user_id , ip) VALUES (2,'236.127.210.188');
INSERT INTO LOGIN(user_id , ip) VALUES (22,'238.190.151.98');
INSERT INTO LOGIN(user_id , ip) VALUES (46,'145.80.84.206');
INSERT INTO LOGIN(user_id , ip) VALUES (45,'203.188.132.95');
INSERT INTO LOGIN(user_id , ip) VALUES (28,'184.58.66.29');
INSERT INTO LOGIN(user_id , ip) VALUES (12,'86.104.134.78');
INSERT INTO LOGIN(user_id , ip) VALUES (47,'94.45.198.183');
INSERT INTO LOGIN(user_id , ip) VALUES (48,'50.222.193.184');
INSERT INTO LOGIN(user_id , ip) VALUES (49,'43.49.49.88');
INSERT INTO LOGIN(user_id , ip) VALUES (24,'219.166.183.216');
INSERT INTO LOGIN(user_id , ip) VALUES (33,'15.21.216.21');
INSERT INTO LOGIN(user_id , ip) VALUES (20,'177.150.57.124');
INSERT INTO LOGIN(user_id , ip) VALUES (34,'150.19.152.19');
INSERT INTO LOGIN(user_id , ip) VALUES (49,'112.226.244.101');
INSERT INTO LOGIN(user_id , ip) VALUES (9,'108.216.168.190');
INSERT INTO LOGIN(user_id , ip) VALUES (48,'66.76.200.102');
INSERT INTO LOGIN(user_id , ip) VALUES (30,'23.225.200.35');
INSERT INTO LOGIN(user_id , ip) VALUES (50,'24.57.93.90');
INSERT INTO LOGIN(user_id , ip) VALUES (13,'65.104.238.185');
INSERT INTO LOGIN(user_id , ip) VALUES (18,'208.4.103.252');
INSERT INTO LOGIN(user_id , ip) VALUES (26,'185.28.144.176');
INSERT INTO LOGIN(user_id , ip) VALUES (7,'116.215.67.178');
INSERT INTO LOGIN(user_id , ip) VALUES (41,'142.210.152.194');
INSERT INTO LOGIN(user_id , ip) VALUES (49,'194.198.76.27');
INSERT INTO LOGIN(user_id , ip) VALUES (48,'155.148.13.228');
INSERT INTO LOGIN(user_id , ip) VALUES (35,'101.225.93.143');










