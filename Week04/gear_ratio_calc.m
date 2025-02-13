% Drew Villani

clear
clc

function gearRatio = gearRatioCalc(driverTeeth, drivenTeeth)
    % assert - inputs
    assert(driverTeeth > 0, 'Error: Driver gear teeth must be greater than zero.');
    assert(drivenTeeth > 0, 'Error: Driven gear teeth must be greater than zero.');
    
    % compute ratio
    gearRatio = drivenTeeth / driverTeeth;
end
