# PAC Project
 Preliminary Aircraft Configurator (PAC)

PAC is a MATLAB program that performs the initial preliminary calculations for aircraft design. It follows heavily from <i>Fundamentals of Aircraft and Airship Design by Nicolai, Carichner.</i> PAC works by having a ready made database of airfoils, engines and aircraft that allows the program to automate much of the initial hand calcs. typically performed during an initial study. Along with the calculations, PAC displays a 3D model of the aircraft while it is being designed, allowing the user to readily see any changes as they happen.

<h3>Workflow</h3>
PAC is laid out in a logical manner to guide the user through the steps in aircraft design. Access to next tab is locked until user completes current tab, preventing the program from crashing due to missing variables.

To run PAC, open startScreen.m in your MATLAB environment and hit run. The user is then given a choice of 8 different aircraft: <i>Fighter (Air-Air), Fighter (Multipurpose), Fighter (Air-Ground), Military Trainer, Military Bomber and Transport, Military Patrol & Reconnaissance, Passenger Jet, and Business Jet</i>
Once the aircraft is selected, PAC is run and opens a new window where the mission requirements can be filled in. Once that is complete, a constraint analysis is constructed to allow the user to select the desird wing loading and thrust loading.

Next the wing tab is unlocked allowing the user to proceed to the next step. The same process is complete for the engine, fuselage, and empennage. Once the aircraft tab is open, the full aircraft is constructed and displayed to the user.

<h3>Known Issues</h3>
PAC is an ongoing project with multiple issues that are in various stages of being adressed. Below are the most significant:

1. Current analysis is limited to only the wing. Estimates CLa, but not CD or CM. Only works for subsonic cases, with errors for taper and sweep values that differ significantly from empirical methods.

2. Wing modeling has errors when altering wing planform, loses dihedral specification, saving is problematic, at wing root and tip issues still exist, finally option to add dihedral at any point along span is still ongoing.

3. Fuselage modeling is still rudimentary. Lacks a clear requirements based approach.

4. Empennage modeling is still rudimentary. Tail sizing is arbitrary, doesn't follow empirical models to size tail for static stability.

5. Aircraft modeling has errors when adjusting wing placement, adding more than 2 engines, and interface between engines and wing/fuselage is lacking.

6. Aircraft data analysis is severly lacking in functionality, currently inoperable. Stability & control analysis is lacking, weight & balance analysis is lacking, performance analysis is unfinished and an ability to compare and contrast designs or even save a design is lacking.

7. Implementation of entire program relies heavily on global variables, not an object-oriented approach. This approach works, but can significantly degrade performance due to excessive RAM usage. A class structure would be a much better approach or even the ability to rapidly clear the global variables and store all pertinent information in a master array or data structure.