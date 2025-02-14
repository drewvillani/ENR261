% Drew Villani
% add item to stock

clear
clc

function TestAddItemToStock()
    testFile = 'test_inventory.csv';

    addItemToStock(testFile, '100001', 'Salt', 10);
    addItemToStock(testFile, '100002', 'Pepper', 5);

    data = readtable(testFile);
    assert(height(data) == 2, 'Error: Items not added correctly.');
    
    disp('Test addItemToStock passed.');
end
