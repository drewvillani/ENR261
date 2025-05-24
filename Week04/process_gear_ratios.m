% Drew Villani

function processGearRatios(inputFile)
    % read the csv
    gearData = readtable(inputFile);
    gearRatios = zeros(height(gearData), 1);
    
    for i = 1:height(gearData)
        % use the driver/driven teeth from the relevant row
        driverTeeth = gearData.driverTeeth(i); 
        drivenTeeth = gearData.drivenTeeth(i);  
        
        % gear ratio calculation
        gearRatios(i) = gearRatioCalc(driverTeeth, drivenTeeth);
    end   
    % create new column, write table for output
    gearData.gearRatio = gearRatios;
    outputFile = 'gear_ratios.csv';
    writetable(gearData, outputFile);
    
    disp('Gear ratios have been calculated and saved to gear_ratios.csv');
end

inputFile = 'gear_data.csv';

%-----------------------------------
% run the function
processGearRatios(inputFile);