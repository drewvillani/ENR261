% Drew Villani

clear;
clc;

%%% add_component.m

function structArray = addComponent(structArray, componentStruct)
    % add a component to the array
    structArray(end + 1) = componentStruct;
end