// Download scilab here: https://www.scilab.org

// In this activity, you will implement and compare two simulation approaches for population growth:
// 1. A discrete model
// 2. A continuous model

// --- Model Parameters ---
// DO NOT MODIFY THESE
P0 = 100; 
r = 0.1; 
T = 20;  
dt = 0.1;

// --- Part 1: Discrete-Time Simulation (Step-by-Step Growth) ---
time_discrete = 0:1:T;
population_discrete = zeros(1, length(time_discrete));
population_discrete(1) = P0;

for i = 2:length(time_discrete)
    // Population at current step = Population at previous step * (1 + growth rate)
    population_discrete(i) = population_discrete(i-1) * (1 + r);
end

// Plot the Discrete Results
scf(0); // Create a new graphics window
plot(time_discrete, population_discrete, 'b-o');
plot(time_continuous, population_continuous, 'r-');
plot(time_continuous, population_exact, 'g--');  
xlabel("Time (years)");
ylabel("Population");
title("Discrete-Time Population Growth");
grid();

// --- Part 2: Continuous-Time Simulation (Euler's Method) ---
time_continuous = 0:dt:T; 
population_continuous = zeros(1, length(time_continuous));
population_continuous(1) = P0;

for i = 2:length(time_continuous)
    // dP = growth rate * current population * dt
    dP = r * population_continuous(i-1) * dt;
    // Population at current step = Population at previous step + dP
    population_continuous(i) = population_continuous(i-1) + dP;
end

scf(1); // Create a new graphics window
plot(time_continuous, population_continuous, 'r-'); // red solid line
xlabel("Time (years)");
ylabel("Population");
title("Continuous-Time Population Growth (Euler’s Method)");
grid();
