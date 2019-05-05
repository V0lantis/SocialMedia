DROP VIEW IF EXISTS postTexte, postImage, postVideo, postAudio CASCADE;

--Projection(Post, id_texte) = Projection(texte, id)
CREATE VIEW postTexte AS
SELECT titre
FROM post, texte 
WHERE texte.id=id_texte;



--Projection(Post, id_image) = Projection(image, url_image)
CREATE VIEW postImage AS
SELECT titre
FROM post, image 
WHERE image.id=id_image;


--Projection(Post, id_video) = Projection(video, url_video)
CREATE VIEW postVideo AS
SELECT titre
FROM post, video 
WHERE video.id=id_video;



--Projection(Post, id_audio) = Projection(audio, url_Audio)
CREATE VIEW postAudio AS
SELECT titre
FROM post, audio 
WHERE audio.id=id_audio;


--