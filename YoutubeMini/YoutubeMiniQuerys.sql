-- Consulta para ver que videos tiene una playlist

SELECT 
    v.Title AS Video_Title,
    v.Description AS Video_Description,
    v.Views AS Video_Views,
    v.Likes AS Video_Likes,
    v.Dislikes AS Video_Dislikes
FROM 
    Playlist p
JOIN 
    PlaylistVideo pv ON p.idPlaylist = pv.idPlaylist
JOIN 
    Video v ON pv.idVideo = v.idVideo
WHERE 
    p.idPlaylist = 1;
    
-- Consulta para ver que playlist tiene un usuario

SELECT 
    p.Name AS Playlist_Name,
    p.CreationDate AS Creation_Date,
    p.Visibility AS Playlist_Visibility
FROM 
    Playlist p
JOIN 
    User u ON p.idUser = u.idUser
WHERE 
    u.idUser = 2;
    
-- Consulta para ver los likes de un video
    
SELECT 
    v.Title AS Video_Title,
    v.Likes AS Total_Likes
FROM 
    Video v
WHERE 
    v.idVideo = 1;
    
-- Consulta para ver los canales de un usuario

SELECT 
    c.Name AS Channel_Name,
    c.Description AS Channel_Description,
    c.CreationDate AS Channel_Creation_Date
FROM 
    Channel c
JOIN 
    User u ON c.idUser = u.idUser
WHERE 
    u.idUser = 1;