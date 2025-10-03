function initSIMDas()
%EF#1
isVBFTKInit = evalin('base','isSIMDASInit');
if(isVBFTKInit==false)
    Resource = evalin('base','Resource');
    Receive = evalin('base','Receive');
    Trans = evalin('base','Trans');
    TX = evalin('base','TX');
    PData = evalin('base','PData');
    TW = evalin('base','TW');
    Recon = evalin('base','Recon');

    LutData = mex_Lut_data();
    nsamps = Receive(1).endSample;
    nxmits = numel(TX);
    nchans = Resource.Parameters.numRcvChannels;
    LutData.numSamples=uint16(nsamps);
    LutData.numChannels=uint16(nchans);
    LutData.numTX=uint16(nxmits);
    
    PGrid.zdim=uint16(PData.Size(1));
    PGrid.xdim=uint16(PData.Size(2));

    assignin('base','LutData',LutData);
    assignin('base','PGrid',PGrid);
    load('InterpData.mat');
    assignin('base','InterpData',InterpData);
    simdas(0);
    isSIMDASInit=true;
    assignin('base','isSIMDASInit',isSIMDASInit);
end
%EF#1
end