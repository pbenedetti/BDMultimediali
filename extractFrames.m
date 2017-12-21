%leggiamo da videoPath la location del video
function [frames] = extractFrames(videoPath)
    v = VideoReader(videoPath);
    vHeight = v.Height;
    vWidth = v.Width;
    frames = struct('cdata',zeros(vHeight,vWidth,3,'uint8'),'colormap',[]);
    
    k = 1;
    %estraiamo ogni frame e lo mettiamo all'interno della struct frames
    while hasFrame(v)
        frames(k).cdata = readFrame(v);
        k = k+1;
    end
 end
