# Quiz - 30%
### Grade: 100

---
# Homework - 40%
### Grade: 38.15

---
### Week 1: Introduction to MATLAB
1. Exploring MATLAB Interface:
    * [x] Report (`report.txt`) explaining the MATLAB interface components.
2. Basic Commands and Calculations:
    * [x] Script file (`week1_commands.m`) with:
    * [x] Arithmetic operations.
    * [x] Explanations of `clc`, `clear`, and `whos`.
3. Simple Script Creation:
    * [x] Script file (`calculate_area.m`) that calculates and displays the area of a rectangle.
    * [x] Includes comments explaining each part of the code.
4. Using the Help System:
    * [x] Summary report (`functions_exploration.txt`) with function explanations (`fprintf`, `plot`, `disp`).
    * [x] Example script (`functions_exploration.m`) demonstrating the functions.
5. Bug Hunt Challenge:
    * [x] Fixed script file (`fixed_script.m`) with comments explaining fixes.
    * [x] Report (`debugging_report.txt`) summarizing errors and solutions.

### Week 2: MATLAB Fundamentals
1. Matrix Arithmetic:
    * [x] Script file (`matrixOperations.m`) performing matrix addition, subtraction, and element-wise operations.
2. Vector Arithmetic:
    * [x] Script file (`vectorOperations.m`) performing operations like summation and transposition.
3. Simple Data Visualization:
    * [x] Script file (`simplePlot.m`) creating a time vs. distance plot.
4. Material Properties Calculations:
    * [x] Script file (`materialProperties.m`) calculating stress and strain and plotting stress-strain curves.
5. Bug Hunt Challenge:
    * [x] Fixed script file (`fixedScript2.m`) with comments explaining fixes.
    * [x] Report (`debuggingReport2.txt`) summarizing errors and solutions.

### Week 3: Inputs, Formatted Outputs, and Control Flow
1. Beam Load Calculation:
    * [50] Script file (`beam_load.m`) using user input and `fprintf` for formatted output.
        * This should ask the user for input
2. Ingredient Cost Calculator:
    * [x] Script file (`ingredient_cost.m`) that calculates total ingredient costs with a while loop.
3. Ball Drop Simulation:
    * [x] Script file (`ball_drop.m`) simulating a free-fall motion using a while loop.
4. Bug Hunt Challenge:
    * [x] Fixed script file (`fixed_script3.m`) with comments explaining fixes.
    * [x] Report (`debuggingReport3.txt`) summarizing errors and solutions.

### Week 4: Program Design and File Import/Export
Grading Note:
* Your functions are all named incorrectly based on the functions you are calling
* Your functions are not technically functions because you're including code before the function declaration
* Your code includes assertions and I'm not exactly sure why, that is for testing and we haven't covered assertions
* Only the KitchenInventory file runs and it fails on every command except `exit` due to function name issues.

1. Optimizing Projectile Launch Angle:
    * [0] Functions (`calculateTrajectory.m`, `getOptimalTrajectoryAngle.m`) for trajectory and optimal angle calculations.
    * [0] Script file (`projectileComparison.m`) integrating the functions.
2. Gear Ratio Calculator:
    * [0] Function (`gearRatioCalc.m`) calculating gear ratios.
    * [0] Script file (`processGearRatios.m`) reading/writing CSV files.
3. Kitchen Inventory Manager:
    * Functions:
        * [0] `addItemToStock.m`
        * [0] `getStockQty.m`
        * [0] `getInventoryList.m`
    * [10] Script file (`kitchenInventory.m`) for user interaction and inventory management.

### Week 5: Vectors, Matrices, and Logical Operations
**These need to be fixed, remove testing, etc, before I can grade them**
1. Material Strength Filter Tool:
    * [ ] Function (`filterMaterials.m`) filtering materials based on logical conditions.
    * [ ] Script file (`materialSelector.m`) for user interaction.
2. Smart Inventory Alert System:
    * [ ] Function (`getLowStockItems.m`) identifying low-stock items.
    * [ ] Updated script (`kitchenInventory.m`) integrating low-stock alert functionality.
3. Projectile Trajectory Analysis:
    * [ ] Function (`analyzeTrajectories.m`) analyzing projectile data.
    * [ ] Script file (`trajectoryAnalysis.m`) integrating analysis and plotting.

### Week 6: Advanced Functions and Plotting
1. Stress-Strain Curve Fitting:
    * [x] Function (`fitStressStrainCurve.m`) fitting polynomial models.
    * [x] Script file (`stressStrainAnalyzer.m`) for user interaction and plotting.
        * NOTE: These are not presented as expected, they should be separate files, one function, one script
2. Inventory Forecasting Tool:
    * [x] Function (`inventoryForecast.m`) analyzing usage logs and predicting inventory levels.
    * [x] Script file (`runInventoryForecast.m`) integrating analysis and plotting.
3. Projectile Motion Analysis:
    * [0] Function (`projectileMotionWithKeyPoints.m`) simulating motion and marking key points.
        * Fails to run, should be a function but is a script file
    * [x] Script file (`runProjectileMotion.m`) for user interaction and plotting.

### Week 7: Advanced Data Types
1. Component Database Management:
    * Functions:
        * [x] `addComponent.m`
        * [x] `struct2Table.m`
    * [x] Script file (`componentDatabase.m`) managing component data.
2. Recipe Manager:
    * [0] Function (`updateInventory.m`) managing inventory.
    * [0] Script file (`recipeManager.m`) for recipe and inventory management.
3. Particle Simulation Analysis:
    * Functions:
        * [0] `simulateParticleMotion.m`
        * [0] `calculateAverageVelocity.m`
    * [0] Script file (`particleSimulation.m`) analyzing and plotting particle motion.

### Week 8: Bye Week
1. N/A

### Week 9: MATLAB App Designer and Symbolic Math
1. [x] Function Plotter with Symbolic Expressions
2. [x] Symbolic Differentiation and Integration App
3. [x] Unit Converter App

### Week 10: PID Control and Algorithm Analysis
1. Spring-Damping System:
    * [0] App (`SpringDampingPID.mlapp`) simulating a spring-damping system with PID control.
2. Line-Following Robot:
    * [0] App (`LineFollowingPID.mlapp`) simulating a robot with PID control for line-following.
3. Custom Algorithm Comparison:
    * [0] App (`CustomAlgorithmComparison.mlapp`) comparing algorithms or parameter effects.
    * [0] Write-up explaining observations and insights.

### Week 11: Multitasking in Single-Threaded Environments
1. Blinking LED with pause:
    * [0] App (`blinkWithDelay.mlapp`) using pause to control LED blinking.
2. Blinking LED without pause:
    * [0] App (`blinkNoDelay.mlapp`) using non-blocking timing for LED blinking.
3. Dynamic GUI Dashboard:
    * [0] App (`crazyDashboard.mlapp`) with multiple components updating independently.
4. PID Line-Following Simulator:
    * [0] App (`pidSimulator.mlapp`) simulating a line-following robot with PID control.

### Week 12: Simulink Tutorial
1. [x] Tutorial 1
2. [x] Tutorial 2
3. [0] Tutorial 3
4. [0] Tutorial 4
5. [0] Tutorial 5
6. [0] Tutorial 6
* [ ] Extra Credit 1 (worth 2 assignments)
* [ ] Extra Credit 2 (worth 4 assignments)
* [ ] Extra Credit 3 (worth 6 assignments)

### General Grading Points
1. Functionality:
    * All tasks are implemented and function as expected.
    * Applications/scripts respond correctly to user input.
2. Code Quality:
    * Code is well-structured and easy to read.
    * Variable and function names are meaningful and consistent.
    * Comments explain key sections and logic.
3. UI/UX (for apps):
    * User interface is intuitive and well-labeled.
    * Applications remain responsive during operation.
4. Testing:
    * Scripts and apps are thoroughly tested for different scenarios.
    * Error handling is implemented for invalid inputs.
5. Documentation:
    * Reports or write-ups explain key observations and findings.
    * Plots and outputs are labeled and visually clear.

---
# Final Project - 30%
### Grade: 0

---
# Final Grade
### 45.26