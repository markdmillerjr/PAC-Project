function aircraftWeightPerformanceData
% Written by Mark D. Miller Jr.
% 12/4/19

global aircraftType tab dataCollection

if aircraftType == 1
    % Fighter (Air-Air)
        fighterAirAir;
elseif aircraftType == 2
    % Fighter (Multipurpose)
    if tab == 1
        fighterMultiB_S;
    elseif tab == 2
        fighterMultiS_Y;
    end
    if dataCollection == 1
        combineFighterMultiData;
    end
elseif aircraftType == 3
    % Fighter Air-Ground
    if tab == 1
        fighterAirGroundC_N;
    elseif tab == 2
        fighterAirGroundN_T;
    end
    if dataCollection == 1
        combineFighterAirGroundData;
    end
elseif aircraftType == 4
    % Military Trainer
        militaryTrainer;
elseif aircraftType == 5
    % Military Bomber & Transport
    if tab == 1
        milBombTransportB_T;
    elseif tab == 2
        milBombTransportT_Y;
    end
    if dataCollection == 1
        combineMilBombTransportData;
    end
elseif aircraftType == 6
    % Military Patrol
        milPatrolRecon;
elseif aircraftType == 7
    % Passenger Jet
    if tab == 1
        passengerJetA_H;
    elseif tab == 2
        passengerJetH_Y;
    end
    if dataCollection == 1
        combinePassengerJetData;
    end
elseif aircraftType == 8
    % Business Jet
        businessJet;
end

% Going to organize data by aircraft type and parameter, not aircraft name
% due to needing to build master arrays of all of the data for each
% aircraft type

%% Aircraft Weights and Performance Database

% Fighters and Trainers
function fighterAirAir
% Fighter (Air-Air) (T/W)TO > 0.9 or (W/S)TO < 70
% Reference Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling aircraftName...
    numberOfAircraft arrayThrust arrayWingSpan arrayLength arrayROC...
    arrayCombatRadius

% Convair F-102A Delta Dagger
    arrayRange(1)          = 1170; %[NM]
    arrayCombatRadius(1)   = 0; %[NM]
    arrayMaxSpeed(1)       = 716; %[knots]
    arrayServiceCeiling(1) = 54000; %[ft]
    arrayROC(1)            = 13000; %[ft/min]
    arrayThrust(1)         = 17200; %[lbs]
    arrayWingSpan(1)       = 38.125; %[ft]
    arrayLength(1)         = 68.375; %[ft]
    arrayWTO(1)            = 32000; %[lb]
    
% Convair F-106A Delta Dart
    arrayRange(2)          = 2346; %[NM]
    arrayCombatRadius(2)   = 500; %[ft/min]
    arrayMaxSpeed(2)       = 1324; %[knots]
    arrayServiceCeiling(2) = 57000; %[ft]
    arrayROC(2)            = 29000; %[ft/min]
    arrayThrust(2)         = 24500; %[lbs]
    arrayWingSpan(2)       = 38.2917; %[ft]
    arrayLength(2)         = 70.7292; %[ft]
    arrayWTO(2)            = 35000; %[lbs]
    
% % Mcdonnell Douglas F-15A Eagle
%     arrayRange(2)          = 2346; %[NM]
%     arrayCombatRadius(2)   = 500; %[ft/min]
%     arrayMaxSpeed(2)       = 1324; %[knots]
%     arrayServiceCeiling(2) = 57000; %[ft]
%     arrayROC(2)            = 29000; %[ft/min]
%     arrayThrust(2)         = 24500; %[lbs]
%     arrayWingSpan(2)       = 38.2917; %[ft]
%     arrayLength(2)         = 70.7292; %[ft]
%     arrayWTO(2)            = 35000; %[lbs]
    
% Yakovlev Yak-25
    arrayRange(3)          = 1457; %[NM]
    arrayCombatRadius(3)   = 0; %[ft/min]
    arrayMaxSpeed(3)       = 588; %[knots]
    arrayServiceCeiling(3) = 39370; %[ft]
    arrayROC(3)            = 8660; %[ft/min]
    arrayThrust(3)         = 4410; %[lbs]
    arrayWingSpan(3)       = 35.9714; %[ft]
    arrayLength(3)         = 51.4058; %[ft]
    arrayWTO(3)            = 20326; %[lbs]
    
% Number of Aircraft
numberOfAircraft = 3; 

aircraftName = {'012345678987654';'2';'3';};  

function fighterMultiB_S
% Fighter (Multi) (T/W)TO < 0.9 or (W/S)TO > 70
% Reference Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling aircraftName...
    numberOfAircraft arrayThrust arrayWingSpan arrayLength arrayROC...
    arrayCombatRadius

% BAC 167 Strikemaster
    arrayRange(1)          = 1200; %[NM]
    arrayCombatRadius(1)   = 126; %[NM]
    arrayMaxSpeed(1)       = 410; %[knots]
    arrayServiceCeiling(1) = 40000; %[ft]
    arrayROC(1)            = 5250; %[ft/min]
    arrayThrust(1)         = 3410;
    arrayWingSpan(1)       = 36.9167; %[ft]
    arrayLength(1)         = 33.7083; %[ft]
    arrayWTO(1)            = 11500; %[lb]

% Canadair CL-41 G
    arrayRange(2)          = 844; %[NM]
    arrayCombatRadius(2)   = 0; %[NM]
    arrayMaxSpeed(2)       = 417; %[knots]
    arrayServiceCeiling(2) = 42200; %[ft]
    arrayROC(2)            = 4220; %[ft/min]
    arrayThrust(2)         = 2950; %[lbs]
    arrayWingSpan(2)       = 36.4917; %[ft]
    arrayLength(2)         = 32.0; %[ft]
    arrayWTO(2)            = 11288; %[lbs]    
    
% Dassault Etendard IV-M
    arrayRange(3)          = 1800; %[NM]
    arrayCombatRadius(3)   = 868; %[NM]
    arrayMaxSpeed(3)       = 585; %[knots]
    arrayServiceCeiling(3) = 49200; %[ft]
    arrayROC(3)            = 19700; %[ft/min]
    arrayThrust(3)         = 9700; %[lbs]
    arrayWingSpan(3)       = 31.5; %[ft]
    arrayLength(3)         = 47.25; %[ft]
    arrayWTO(3)            = 22650; %[lbs]    
    
% Dassault Mirage F1-C
    arrayRange(4)          = 1800; %[NM]
    arrayCombatRadius(4)   = 229; %[NM]
    arrayMaxSpeed(4)       = 1259; %[knots]
    arrayServiceCeiling(4) = 65600; %[ft]
    arrayROC(4)            = 47835; %[ft/min]
    arrayThrust(4)         = 15798; %[lbs]
    arrayWingSpan(4)       = 27.5625; %[ft]
    arrayLength(4)         = 49.2083; %[ft]
    arrayWTO(4)            = 32850; %[lbs]    

% Dassault Super Mystere B-2
    arrayRange(5)          = 634; %[NM]
    arrayCombatRadius(5)   = 470; %[NM]
    arrayMaxSpeed(5)       = 645; %[knots]
    arrayServiceCeiling(5) = 55775; %[ft]
    arrayROC(5)            = 17500; %[ft/min]
    arrayThrust(5)         = 9700; %[lbs]
    arrayWingSpan(5)       = 34.4792; %[ft]
    arrayLength(5)         = 46.0833; %[ft]
    arrayWTO(5)            = 22046; %[lbs]
    
% Fairchild Republic F-105 Thunderchief
    arrayRange(6)          = 1917; %[NM]
    arrayCombatRadius(6)   = 676; %[NM]
    arrayMaxSpeed(6)       = 1192; %[knots]
    arrayServiceCeiling(6) = 48500; %[ft]
    arrayROC(6)            = 38500; %[ft/min]
    arrayThrust(6)         = 24500; %[lbs]
    arrayWingSpan(6)       = 34.9375; %[ft]
    arrayLength(6)         = 64.3958; %[ft]
    arrayWTO(6)            = 52838; %[lbs]
    
% General Dynamics F-111A
    arrayRange(7)          = 3300; %[NM]
    arrayCombatRadius(7)   = 0; %[NM]
    arrayMaxSpeed(7)       = 1433; %[knots]
    arrayServiceCeiling(7) = 60000; %[ft]
    arrayROC(7)            = 25890; %[ft/min]
    arrayThrust(7)         = 42000; %[lbs]
    arrayWingSpan(7)       = 31.95; %[ft] % Swept
    arrayLength(7)         = 73.5; %[ft]
    arrayWTO(7)            = 91500; %[lbs]
    
% Grumman F-14D
    arrayRange(8)          = 1600; %[NM]
    arrayCombatRadius(8)   = 500; %[NM]
    arrayMaxSpeed(8)       = 1342; %[knots]
    arrayServiceCeiling(8) = 50000; %[ft]
    arrayROC(8)            = 45000; %[ft/min]
    arrayThrust(8)         = 56400; %[lbs]
    arrayWingSpan(8)       = 64.0; %[ft] % Swept
    arrayLength(8)         = 62.75; %[ft]
    arrayWTO(8)            = 74350; %[lbs]
    
% Hawker Siddeley Gnat Mk 1
    arrayRange(9)          = 0; %[NM]
    arrayCombatRadius(9)   = 434; %[NM]
    arrayMaxSpeed(9)       = 603; %[knots]
    arrayServiceCeiling(9) = 50000; %[ft]
    arrayROC(9)            = 20000; %[ft/min]
    arrayThrust(9)         = 4520; %[lbs]
    arrayWingSpan(9)       = 22.1667; %[ft] % Swept
    arrayLength(9)         = 29.75; %[ft]
    arrayWTO(9)            = 8885; %[lbs]
    
% Lockheed F-104S
    arrayRange(10)          = 1576; %[NM]
    arrayCombatRadius(10)   = 360; %[NM]
    arrayMaxSpeed(10)       = 1259; %[knots]
    arrayServiceCeiling(10) = 58000; %[ft]
    arrayROC(10)            = 48000; %[ft/min]
    arrayThrust(10)         = 17900; %[lb]
    arrayWingSpan(10)       = 21.9167; %[ft]
    arrayLength(10)         = 54.75; %[ft]
    arrayWTO(10)            = 31000; %[lb]
    
% McDonnell F-101B
    arrayRange(11)          = 1345; %[NM]
    arrayCombatRadius(11)   = 0; %[NM]
    arrayMaxSpeed(11)       = 1059; %[knots]
    arrayServiceCeiling(11) = 52000; %[ft]
    arrayROC(11)            = 14000; %[ft/min]
    arrayThrust(11)         = 29760; %[lb]
    arrayWingSpan(11)       = 39.6667; %[ft]
    arrayLength(11)         = 67.4167; %[ft]
    arrayWTO(11)            = 46500; %[lb]
    
% McDonnell Douglas F-4EJ Phantom II
    arrayRange(12)          = 1600; %[NM]
    arrayCombatRadius(12)   = 370; %[NM]
    arrayMaxSpeed(12)       = 1262; %[knots]
    arrayServiceCeiling(12) = 58050; %[ft]
    arrayROC(12)            = 49500; %[ft/min]
    arrayThrust(12)         = 35800; %[lb]
    arrayWingSpan(12)       = 38.4167; %[ft]
    arrayLength(12)         = 62.9792; %[ft]
    arrayWTO(12)            = 57400; %[lb]
    
% Mikoyan MiG-21MF
    arrayRange(13)          = 593; %[NM]
    arrayCombatRadius(13)   = 0; %[NM]
    arrayMaxSpeed(13)       = 1203; %[knots]
    arrayServiceCeiling(13) = 59050; %[ft]
    arrayROC(13)            = 0; %[ft/min]
    arrayThrust(13)         = 14550; %[lb]
    arrayWingSpan(13)       = 23.4583; %[ft]
    arrayLength(13)         = 51.7083; %[ft]
    arrayWTO(13)            = 18078; %[lb]
    
% Mikoyan MiG-23 MLD
    arrayRange(14)          = 1520; %[NM]
    arrayCombatRadius(14)   = 1380; %[NM]
    arrayMaxSpeed(14)       = 1349; %[knots]
    arrayServiceCeiling(14) = 60000; %[ft]
    arrayROC(14)            = 45000; %[ft/min]
    arrayThrust(14)         = 28660; %[lb]
    arrayWingSpan(14)       = 45.8333; %[ft]
    arrayLength(14)         = 54.75; %[ft]
    arrayWTO(14)            = 39242; %[lb]
    
% Mikoyan MiG-25P
    arrayRange(15)          = 1390; %[NM]
    arrayCombatRadius(15)   = 0; %[NM]
    arrayMaxSpeed(15)       = 1600; %[knots]
    arrayServiceCeiling(15) = 67900; %[ft]
    arrayROC(15)            = 40900; %[ft/min]
    arrayThrust(15)         = 45000; %[lb]
    arrayWingSpan(15)       = 46.0; %[ft]
    arrayLength(15)         = 78.1667; %[ft]
    arrayWTO(15)            = 80954; %[lb]
    
% North American A-5A
    arrayRange(16)          = 1571; %[NM]
    arrayCombatRadius(16)   = 974; %[NM]
    arrayMaxSpeed(16)       = 1149; %[knots]
    arrayServiceCeiling(16) = 52100; %[ft]
    arrayROC(16)            = 8000; %[ft/min]
    arrayThrust(16)         = 34000; %[lb]
    arrayWingSpan(16)       = 53.0; %[ft]
    arrayLength(16)         = 76.5; %[ft]
    arrayWTO(16)            = 63085; %[lb]
    
% Northrop F-5E Tiger II
    arrayRange(17)          = 1715; %[NM]
    arrayCombatRadius(17)   = 760; %[NM]
    arrayMaxSpeed(17)       = 917; %[knots]
    arrayServiceCeiling(17) = 54000; %[ft]
    arrayROC(17)            = 31600; %[ft/min]
    arrayThrust(17)         = 10000; %[lb]
    arrayWingSpan(17)       = 26.6667; %[ft]
    arrayLength(17)         = 48.3125; %[ft]
    arrayWTO(17)            = 21820; %[lb]
    
% Panavia Tornado GR4
    arrayRange(18)          = 750; %[NM]
    arrayCombatRadius(18)   = 0; %[NM]
    arrayMaxSpeed(18)       = 1300; %[knots]
    arrayServiceCeiling(18) = 50000; %[ft]
    arrayROC(18)            = 0; %[ft/min]
    arrayThrust(18)         = 34600; %[lb]
    arrayWingSpan(18)       = 45.6667; %[ft]
    arrayLength(18)         = 54.8333; %[ft]
    arrayWTO(18)            = 44622; %[lb]
    
% SAAB 32A Lansen
    arrayRange(19)          = 1735; %[NM]
    arrayCombatRadius(19)   = 0; %[NM]
    arrayMaxSpeed(19)       = 608; %[knots]
    arrayServiceCeiling(19) = 49200; %[ft]
    arrayROC(19)            = 11800; %[ft/min]
    arrayThrust(19)         = 9920; %[lb]
    arrayWingSpan(19)       = 42.6458; %[ft]
    arrayLength(19)         = 48.0625; %[ft]
    arrayWTO(19)            = 28660; %[lb]

% Number of Aircraft
numberOfAircraft = 19; 

aircraftName = {'012345678987654';'2';'3';'4';'5';'6';'7';'8';'9';'10';...
    '11';'12';'13';'14';'15';'16';'17';'18';'19';};     
function fighterMultiS_Y
% Fighter (Multi) (T/W)TO < 0.9 or (W/S)TO > 70
% Reference Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling aircraftName...
    numberOfAircraft arrayThrust arrayWingSpan arrayLength arrayROC...
    arrayCombatRadius

% SAAB J 35S Draken
    arrayRange(1)          = 1754; %[NM]
    arrayCombatRadius(1)   = 541; %[NM]
    arrayMaxSpeed(1)       = 1146; %[knots]
    arrayServiceCeiling(1) = 66000; %[ft]
    arrayROC(1)            = 34450; %[ft/min]
    arrayThrust(1)         = 17650;
    arrayWingSpan(1)       = 30.8333; %[ft]
    arrayLength(1)         = 50.3333; %[ft]
    arrayWTO(1)            = 35275; %[lb]

% SAAB 37 Viggen
    arrayRange(2)          = 1100; %[NM]
    arrayCombatRadius(2)   = 0; %[NM]
    arrayMaxSpeed(2)       = 1205; %[knots]
    arrayServiceCeiling(2) = 59000; %[ft]
    arrayROC(2)            = 40000; %[ft/min]
    arrayThrust(2)         = 28000;
    arrayWingSpan(2)       = 34.75; %[ft]
    arrayLength(2)         = 53.8333; %[ft]
    arrayWTO(2)            = 44092; %[lb]
    
% SAAB 105XT
    arrayRange(3)          = 1580; %[NM]
    arrayCombatRadius(3)   = 420; %[NM]
    arrayMaxSpeed(3)       = 524; %[knots]
    arrayServiceCeiling(3) = 44900; %[ft]
    arrayROC(3)            = 14000; %[ft/min]
    arrayThrust(3)         = 5700;
    arrayWingSpan(3)       = 31.1667; %[ft]
    arrayLength(3)         = 35.4375; %[ft]
    arrayWTO(3)            = 14330; %[lb]
    
% SEPECAT Jaguar
    arrayRange(4)          = 1027; %[NM]
    arrayCombatRadius(4)   = 710; %[NM]
    arrayMaxSpeed(4)       = 860; %[knots]
    arrayServiceCeiling(4) = 46000; %[ft]
    arrayROC(4)            = 0; %[ft/min]
    arrayThrust(4)         = 13900;
    arrayWingSpan(4)       = 27.8542; %[ft]
    arrayLength(4)         = 50.9167; %[ft]
    arrayWTO(4)            = 32600; %[lb]
    
% Sukhoi Su-11
    arrayRange(5)          = 607; %[NM]
    arrayCombatRadius(5)   = 270; %[NM]
    arrayMaxSpeed(5)       = 1260; %[knots]
    arrayServiceCeiling(5) = 59000; %[ft]
    arrayROC(5)            = 26910; %[ft/min]
    arrayThrust(5)         = 22260;
    arrayWingSpan(5)       = 28.0; %[ft]
    arrayLength(5)         = 59.8333; %[ft]
    arrayWTO(5)            = 30834; %[lb]
    
% Tupolev Tu-128    
    arrayRange(6)          = 840; %[NM]
    arrayCombatRadius(6)   = 0; %[NM]
    arrayMaxSpeed(6)       = 899; %[knots]
    arrayServiceCeiling(6) = 51200; %[ft]
    arrayROC(6)            = 0; %[ft/min]
    arrayThrust(6)         = 44600;
    arrayWingSpan(6)       = 57.5; %[ft]
    arrayLength(6)         = 98.5833; %[ft]
    arrayWTO(6)            = 30834; %[lb]
    
% Vought A-7 Corsair II
    arrayRange(7)          = 1342; %[NM]
    arrayCombatRadius(7)   = 0; %[NM]
    arrayMaxSpeed(7)       = 562; %[knots]
    arrayServiceCeiling(7) = 42000; %[ft]
    arrayROC(7)            = 15000; %[ft/min]
    arrayThrust(7)         = 15000;
    arrayWingSpan(7)       = 38.75; %[ft]
    arrayLength(7)         = 46.1667; %[ft]
    arrayWTO(7)            = 41998; %[lb]
    
% Vought F-8E Crusader
    arrayRange(8)          = 1507; %[NM]
    arrayCombatRadius(8)   = 391; %[NM]
    arrayMaxSpeed(8)       = 1148; %[knots]
    arrayServiceCeiling(8) = 58000; %[ft]
    arrayROC(8)            = 19000; %[ft/min]
    arrayThrust(8)         = 18000;
    arrayWingSpan(8)       = 35.6667; %[ft]
    arrayLength(8)         = 54.5; %[ft]
    arrayWTO(8)            = 34000; %[lb]

% Number of Aircraft
numberOfAircraft = 8; 

aircraftName = {'012345678987654';'2';'3';'4';'5';'6';'7';'8';};   

function combineFighterMultiData
global arrayCombatRadius arrayWTO arrayMaxSpeed arrayRange arrayROC...
        arrayServiceCeiling arrayThrust numberOfAircraft
    
  fighterMultiB_S;
  masterArrayCombatRadius   = zeros(1,27); % 27 is the total number of FighterMulti aircraft
  masterArrayMaxSpeed       = zeros(1,27);
  masterArrayROC            = zeros(1,27);
  masterArrayServiceCeiling = zeros(1,27);
  masterArrayRange          = zeros(1,27);
  masterArrayThrust         = zeros(1,27);
  masterArrayWTO            = zeros(1,27);
  
  for i = 1:numberOfAircraft
      masterArrayCombatRadius(i) = arrayCombatRadius(i);
  end
      for i = 1:numberOfAircraft
          masterArrayMaxSpeed(i) = arrayMaxSpeed(i);
      end
          for i = 1:numberOfAircraft
              masterArrayServiceCeiling(i) = arrayServiceCeiling(i);
          end
              for i = 1:numberOfAircraft
                 masterArrayRange(i) = arrayRange(i);
              end
                  for i = 1:numberOfAircraft
                      masterArrayROC(i) = arrayROC(i);
                  end
                      for i = 1:numberOfAircraft
                         masterArrayThrust(i) = arrayThrust(i);
                      end
                         for i = 1:numberOfAircraft
                          masterArrayWTO(i) = arrayWTO(i);
                         end
  fighterMultiS_Y;
  j = 19 + 1; % 19 is the number of aircraft in the first tab
  for i = 1:numberOfAircraft
      masterArrayCombatRadius(j) = arrayCombatRadius(i);
      j = j + 1;
  end
        j = 19 + 1;
        for i = 1:numberOfAircraft
            masterArrayMaxSpeed(j) = arrayMaxSpeed(i);
            j = j + 1;
        end
            j = 19 + 1;
            for i = 1:numberOfAircraft
                masterArrayServiceCeiling(j) = arrayServiceCeiling(i);
                j = j + 1;
            end
                j = 19 + 1;
                for i = 1:numberOfAircraft
                     masterArrayRange(j) = arrayRange(i);
                     j = j + 1;
                end
                    j = 19 + 1;
                    for i = 1:numberOfAircraft
                        masterArrayROC(j) = arrayROC(i);
                        j = j + 1;
                    end
                        j = 19 + 1;
                        for i = 1:numberOfAircraft
                            masterArrayThrust(j) = arrayThrust(i);
                            j = j + 1;
                        end
                            j = 19 + 1;
                            for i = 1:numberOfAircraft
                            masterArrayWTO(j) = arrayWTO(i);
                            j = j + 1;
                            end
                        
    arrayCombatRadius   = masterArrayCombatRadius;
    arrayMaxSpeed       = masterArrayMaxSpeed;
    arrayServiceCeiling = masterArrayServiceCeiling;
    arrayRange          = masterArrayRange;
    arrayROC            = masterArrayROC;
    arrayThrust         = masterArrayThrust;
    arrayWTO            = masterArrayWTO;

function fighterAirGroundC_N
% Fighter Air-Ground
% Reference Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling aircraftName...
    numberOfAircraft arrayThrust arrayWingSpan arrayLength arrayROC...
    arrayCombatRadius

% Cessna A-37B
    arrayRange(1)          = 800; %[NM]
    arrayCombatRadius(1)   = 400; %[NM]
    arrayMaxSpeed(1)       = 440; %[knots]
    arrayServiceCeiling(1) = 41765; %[ft]
    arrayROC(1)            = 6990; %[ft/min]
    arrayThrust(1)         = 5700; %[lbs]
    arrayWingSpan(1)       = 35.875; %[ft]
    arrayLength(1)         = 29.2917; %[ft]
    arrayWTO(1)            = 14000; %[lbs]
    
% Dassault Mirage III-E
    arrayRange(2)          = 1801; %[NM]
    arrayCombatRadius(2)   = 647; %[NM]
    arrayMaxSpeed(2)       = 1268; %[knots]
    arrayServiceCeiling(2) = 55775; %[ft]
    arrayROC(2)            = 16400; %[ft/min]
    arrayThrust(2)         = 13670; %[lbs]
    arrayWingSpan(2)       = 27.0; %[ft]
    arrayLength(2)         = 49.2917; %[ft]
    arrayWTO(2)            = 29760; %[lbs]    

% Dassault Mirage 5-P
    arrayRange(3)          = 2158; %[NM]
    arrayCombatRadius(3)   = 699; %[NM]
    arrayMaxSpeed(3)       = 1268; %[knots]
    arrayServiceCeiling(3) = 55775; %[ft]
    arrayROC(3)            = 36600; %[ft/min]
    arrayThrust(3)         = 13670; %[lbs]
    arrayWingSpan(3)       = 27.0; %[ft]
    arrayLength(3)         = 51.0208; %[ft]
    arrayWTO(3)            = 29760; %[lbs]    
    
% Dassault Mystere IV-A
    arrayRange(4)          = 1230; %[NM]
    arrayCombatRadius(4)   = 0; %[NM]
    arrayMaxSpeed(4)       = 603; %[knots]
    arrayServiceCeiling(4) = 49000; %[ft]
    arrayROC(4)            = 8850; %[ft/min]
    arrayThrust(4)         = 7716; %[lbs]
    arrayWingSpan(4)       = 36.4583; %[ft]
    arrayLength(4)         = 42.125; %[ft]
    arrayWTO(4)            = 18700; %[lbs]
    
% De Havilland Vampire FB Mk 6
    arrayRange(5)          = 1060; %[NM]
    arrayCombatRadius(5)   = 0; %[NM]
    arrayMaxSpeed(5)       = 476; %[knots]
    arrayServiceCeiling(5) = 42800; %[ft]
    arrayROC(5)            = 4800; %[ft/min]
    arrayThrust(5)         = 3350; %[lbs]
    arrayWingSpan(5)       = 38.0; %[ft]
    arrayLength(5)         = 30.75; %[ft]
    arrayWTO(5)            = 12390; %[lbs]
    
% De Havilland Venom FB Mk 50
    arrayRange(6)          = 868; %[NM]
    arrayCombatRadius(6)   = 0; %[NM]
    arrayMaxSpeed(6)       = 556; %[knots]
    arrayServiceCeiling(6) = 49200; %[ft]
    arrayROC(6)            = 9000; %[ft/min]
    arrayThrust(6)         = 4850; %[lbs]
    arrayWingSpan(6)       = 41.6667; %[ft]
    arrayLength(6)         = 31.8333; %[ft]
    arrayWTO(6)            = 15400; %[lbs]
    
% Fairchild Republic A-10A
    arrayRange(7)          = 2240; %[NM]
    arrayCombatRadius(7)   = 250; %[NM]
    arrayMaxSpeed(7)       = 381; %[knots]
    arrayServiceCeiling(7) = 45000; %[ft]
    arrayROC(7)            = 6000; %[ft/min]
    arrayThrust(7)         = 18130; %[lbs]
    arrayWingSpan(7)       = 57.5; %[ft]
    arrayLength(7)         = 53.3333; %[ft]
    arrayWTO(7)            = 50000; %[lbs]
    
% General Dynamics F-16C
    arrayRange(8)          = 2277; %[NM]
    arrayCombatRadius(8)   = 295; %[NM]
    arrayMaxSpeed(8)       = 1147; %[knots]
    arrayServiceCeiling(8) = 59055; %[ft]
    arrayROC(8)            = 72000; %[ft/min]
    arrayThrust(8)         = 29588; %[lbs]
    arrayWingSpan(8)       = 32.6667; %[ft] % Swept
    arrayLength(8)         = 49.4167; %[ft]
    arrayWTO(8)            = 42300; %[lbs]
    
% Grumman A-6A Intruder
    arrayRange(9)          = 2800; %[NM]
    arrayCombatRadius(9)   = 878; %[NM]
    arrayMaxSpeed(9)       = 595; %[knots]
    arrayServiceCeiling(9) = 42400; %[ft]
    arrayROC(9)            = 7620; %[ft/min]
    arrayThrust(9)         = 18600; %[lbs]
    arrayWingSpan(9)       = 53.0; %[ft] % Swept
    arrayLength(9)         = 54.5833; %[ft]
    arrayWTO(9)            = 60626; %[lbs]
    
% % Grumman EA-6B Prowler
%     arrayRange(10)          = 2022; %[NM]
%     arrayCombatRadius(10)   = 0; %[NM]
%     arrayMaxSpeed(10)       = 566; %[knots]
%     arrayServiceCeiling(10) = 37600; %[ft]
%     arrayROC(10)            = 12900; %[ft/min]
%     arrayThrust(10)         = 20800; %[lbs]
%     arrayWingSpan(10)       = 53.0; %[ft] % Swept
%     arrayLength(10)         = 59.8333; %[ft]
%     arrayWTO(10)            = 58500; %[lbs]
    
% Hawker Hunter F(GA) Mk 9
    arrayRange(10)          = 1595; %[NM]
    arrayCombatRadius(10)   = 385; %[NM]
    arrayMaxSpeed(10)       = 616; %[knots]
    arrayServiceCeiling(10) = 50000; %[ft]
    arrayROC(10)            = 8000; %[ft/min]
    arrayThrust(10)         = 10000; %[lbs]
    arrayWingSpan(10)       = 33.6667; %[ft] % Swept
    arrayLength(10)         = 45.8750; %[ft]
    arrayWTO(10)            = 24000; %[lbs]
    
% Hawker Siddeley Buccaneer S.2A
    arrayRange(11)          = 1595; %[NM]
    arrayCombatRadius(11)   = 0; %[NM]
    arrayMaxSpeed(11)       = 560; %[knots]
    arrayServiceCeiling(11) = 40000; %[ft]
    arrayROC(11)            = 0; %[ft/min]
    arrayThrust(11)         = 22200; %[lbs]
    arrayWingSpan(11)       = 44.0; %[ft] % Swept
    arrayLength(11)         = 63.4167; %[ft]
    arrayWTO(11)            = 62000; %[lbs]
    
% Hawker Siddeley Harrier GR.3
    arrayRange(12)          = 1850; %[NM]
    arrayCombatRadius(12)   = 360; %[NM]
    arrayMaxSpeed(12)       = 635; %[knots]
    arrayServiceCeiling(12) = 51200; %[ft]
    arrayROC(12)            = 0; %[ft/min]
    arrayThrust(12)         = 21500; %[lbs]
    arrayWingSpan(12)       = 25.4167; %[ft] % Swept
    arrayLength(12)         = 46.8333; %[ft]
    arrayWTO(12)            = 55556; %[lbs]
    
% Hindustan HF-24 Marut Mk 1
    arrayRange(13)          = 432; %[NM]
    arrayCombatRadius(13)   = 214; %[NM]
    arrayMaxSpeed(13)       = 620; %[knots]
    arrayServiceCeiling(13) = 40000; %[ft]
    arrayROC(13)            = 0; %[ft/min]
    arrayThrust(13)         = 9700; %[lb]
    arrayWingSpan(13)       = 29.5208; %[ft]
    arrayLength(13)         = 52.0625; %[ft]
    arrayWTO(13)            = 24085; %[lb]
    
% McDonnell Douglas A-4M Skyhawk
    arrayRange(14)          = 1785; %[NM]
    arrayCombatRadius(14)   = 0; %[NM]
    arrayMaxSpeed(14)       = 560; %[knots]
    arrayServiceCeiling(14) = 42250; %[ft]
    arrayROC(14)            = 8440; %[ft/min]
    arrayThrust(14)         = 11200; %[lb]
    arrayWingSpan(14)       = 27.5; %[ft]
    arrayLength(14)         = 40.2708; %[ft]
    arrayWTO(14)            = 24500; %[lb]
    
% McDonnell Douglas F-15C 
    arrayRange(15)          = 3000; %[NM]
    arrayCombatRadius(15)   = 1061; %[NM]
    arrayMaxSpeed(15)       = 1434; %[knots]
    arrayServiceCeiling(15) = 65000; %[ft]
    arrayROC(15)            = 50000; %[ft/min]
    arrayThrust(15)         = 47540; %[lb]
    arrayWingSpan(15)       = 42.8125; %[ft]
    arrayLength(15)         = 63.8125; %[ft]
    arrayWTO(15)            = 68000; %[lb]    
    
% Mikoyan/Gurevich MiG-17F
    arrayRange(16)          = 755; %[NM]
    arrayCombatRadius(16)   = 0; %[NM]
    arrayMaxSpeed(16)       = 617; %[knots]
    arrayServiceCeiling(16) = 54460; %[ft]
    arrayROC(16)            = 12795; %[ft/min]
    arrayThrust(16)         = 7450; %[lb]
    arrayWingSpan(16)       = 31.5; %[ft]
    arrayLength(16)         = 37.2708; %[ft]
    arrayWTO(16)            = 13379; %[lb]
    
% Mikoyan MiG-19S
    arrayRange(17)          = 1200; %[NM]
    arrayCombatRadius(17)   = 370; %[NM]
    arrayMaxSpeed(17)       = 783; %[knots]
    arrayServiceCeiling(17) = 58725; %[ft]
    arrayROC(17)            = 22638; %[ft/min]
    arrayThrust(17)         = 14330; %[lb]
    arrayWingSpan(17)       = 29.5208; %[ft]
    arrayLength(17)         = 41.1458; %[ft]
    arrayWTO(17)            = 19180; %[lb]
    
% North American F-86F
    arrayRange(18)          = 1325; %[NM]
    arrayCombatRadius(18)   = 360; %[NM]
    arrayMaxSpeed(18)       = 597; %[knots]
    arrayServiceCeiling(18) = 49600; %[ft]
    arrayROC(18)            = 9000; %[ft/min]
    arrayThrust(18)         = 5970; %[lb]
    arrayWingSpan(18)       = 39.0833; %[ft]
    arrayLength(18)         = 37.5417; %[ft]
    arrayWTO(18)            = 20610; %[lb]
    
% North American F-100
    arrayRange(19)          = 1300; %[NM]
    arrayCombatRadius(19)   = 0; %[NM]
    arrayMaxSpeed(19)       = 750; %[knots]
    arrayServiceCeiling(19) = 50000; %[ft]
    arrayROC(19)            = 22400; %[ft/min]
    arrayThrust(19)         = 17000; %[lb]
    arrayWingSpan(19)       = 38.75; %[ft]
    arrayLength(19)         = 54.25; %[ft]
    arrayWTO(19)            = 34832; %[lb]    
 
% Number of Aircraft
numberOfAircraft = 19; 

aircraftName = {'01234567898765432';'2';'3';'4';'5';'6';'7';'8';'9';'10';...
    '11';'12';'13';'14';'15';'16';'17';'18';'19';};    
function fighterAirGroundN_T
% Fighter Air-Ground
% Reference Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling aircraftName...
    numberOfAircraft arrayThrust arrayWingSpan arrayLength arrayROC...
    arrayCombatRadius

% Northrop F-5A
    arrayRange(1)          = 1205; %[NM]
    arrayCombatRadius(1)   = 170; %[NM]
    arrayMaxSpeed(1)       = 803; %[knots]
    arrayServiceCeiling(1) = 50500; %[ft]
    arrayROC(1)            = 28700; %[ft/min]
    arrayThrust(1)         = 8160; %[lb]
    arrayWingSpan(1)       = 25.25; %[ft]
    arrayLength(1)         = 47.1667; %[ft]
    arrayWTO(1)            = 20677; %[lb]
    
% Soko J-1 Jastreb
    arrayRange(2)          = 820; %[NM]
    arrayCombatRadius(2)   = 0; %[NM]
    arrayMaxSpeed(2)       = 442; %[knots]
    arrayServiceCeiling(2) = 39375; %[ft]
    arrayROC(2)            = 4135; %[ft/min]
    arrayThrust(2)         = 3000; %[lb]
    arrayWingSpan(2)       = 34.6667; %[ft]
    arrayLength(2)         = 35.125; %[ft]
    arrayWTO(2)            = 10287; %[lb]

% SUD-Aviation Vautour IIA
    arrayRange(3)          = 2900; %[NM]
    arrayCombatRadius(3)   = 0; %[NM]
    arrayMaxSpeed(3)       = 597; %[knots]
    arrayServiceCeiling(3) = 49900; %[ft]
    arrayROC(3)            = 12000; %[ft/min]
    arrayThrust(3)         = 15400; %[lb]
    arrayWingSpan(3)       = 49.5; %[ft]
    arrayLength(3)         = 51.0833; %[ft]
    arrayWTO(3)            = 45635; %[lb]
    
% Sukhoi Su-7B
    arrayRange(4)          = 780; %[NM]
    arrayCombatRadius(4)   = 260; %[NM]
    arrayMaxSpeed(4)       = 917; %[knots]
    arrayServiceCeiling(4) = 49700; %[ft]
    arrayROC(4)            = 29900; %[ft/min]
    arrayThrust(4)         = 22046; %[lb]
    arrayWingSpan(4)       = 29.2917; %[ft]
    arrayLength(4)         = 57.0; %[ft]
    arrayWTO(4)            = 29750; %[lb]
    
% Sukhoi Su-17M4
    arrayRange(5)          = 1200; %[NM]
    arrayCombatRadius(5)   = 620; %[NM]
    arrayMaxSpeed(5)       = 1000; %[knots]
    arrayServiceCeiling(5) = 46600; %[ft]
    arrayROC(5)            = 45000; %[ft/min]
    arrayThrust(5)         = 24700; %[lb]
    arrayWingSpan(5)       = 44.9167; %[ft]
    arrayLength(5)         = 62.4167; %[ft]
    arrayWTO(5)            = 42836; %[lb]
    
% Number of Aircraft
numberOfAircraft = 5; 

aircraftName = {'01234567898765432';'2';'3';'4';'5';'6';'7';'8';'9';'10';...
    '11';'12';'13';'14';'15';'16';'17';'18';'19';};

function combineFighterAirGroundData
global arrayCombatRadius arrayWTO arrayMaxSpeed arrayRange arrayServiceCeiling...
    arrayThrust arrayROC numberOfAircraft
    
  fighterAirGroundC_N;
  masterArrayCombatRadius   = zeros(1,24); % 24 is the total number of FighterAirGround aircraft
  masterArrayMaxSpeed       = zeros(1,24);
  masterArrayROC            = zeros(1,24);
  masterArrayServiceCeiling = zeros(1,24);
  masterArrayRange          = zeros(1,24);
  masterArrayThrust         = zeros(1,24);
  masterArrayWTO            = zeros(1,24);
  
  for i = 1:numberOfAircraft
      masterArrayCombatRadius(i) = arrayCombatRadius(i);
  end
      for i = 1:numberOfAircraft
          masterArrayMaxSpeed(i) = arrayMaxSpeed(i);
      end
          for i = 1:numberOfAircraft
              masterArrayServiceCeiling(i) = arrayServiceCeiling(i);
          end
              for i = 1:numberOfAircraft
                 masterArrayRange(i) = arrayRange(i);
              end
                  for i = 1:numberOfAircraft
                      masterArrayThrust(i) = arrayThrust(i);
                  end
                      for i = 1:numberOfAircraft
                          masterArrayROC(i) = arrayROC(i);
                      end
                          for i = 1:numberOfAircraft
                              masterArrayWTO(i) = arrayWTO(i);
                          end                         
  fighterAirGroundN_T;
  j = 19 + 1; % 19 is the number of aircraft in the first tab
  for i = 1:numberOfAircraft
      masterArrayCombatRadius(j) = arrayCombatRadius(i);
      j = j + 1;
  end
        j = 19 + 1;
        for i = 1:numberOfAircraft
            masterArrayMaxSpeed(j) = arrayMaxSpeed(i);
            j = j + 1;
        end
            j = 19 + 1;
            for i = 1:numberOfAircraft
                masterArrayServiceCeiling(j) = arrayServiceCeiling(i);
                j = j + 1;
            end
                j = 19 + 1;
                for i = 1:numberOfAircraft
                     masterArrayRange(j) = arrayRange(i);
                     j = j + 1;
                end
                    j = 19 + 1;
                    for i = 1:numberOfAircraft
                        masterArrayROC(j) = arrayROC(i);
                        j = j + 1;
                    end
                        j = 19 + 1;
                        for i = 1:numberOfAircraft
                            masterArrayThrust(j) = arrayThrust(i);
                            j = j + 1;
                        end
                            j = 19 + 1;
                            for i = 1:numberOfAircraft
                                masterArrayWTO(j) = arrayWTO(i);
                                j = j + 1;
                            end
                        
    arrayCombatRadius   = masterArrayCombatRadius;
    arrayMaxSpeed       = masterArrayMaxSpeed;
    arrayServiceCeiling = masterArrayServiceCeiling;
    arrayRange          = masterArrayRange;
    arrayROC            = masterArrayROC;
    arrayThrust         = masterArrayThrust;
    arrayWTO            = masterArrayWTO;

function militaryTrainer
% Military Trainer
% Reference: Jane's Pocket Book of Military Transport and Training
% Aircraft, Wikipedia

global arrayWTO arrayMaxSpeed arrayRange numberOfAircraft...
    arrayServiceCeiling aircraftName arrayThrust arrayWingSpan arrayLength...
    arrayROC

% Aermacchi M B 326GB
    arrayRange(1)          = 1000; %[NM]
    arrayMaxSpeed(1)       = 468; %[knots]
    arrayServiceCeiling(1) = 39000; %[ft]
    arrayROC(1)            = 3550; %[ft/min]
    arrayThrust(1)         = 3410; %[lb]
    arrayWingSpan(1)       = 35.5833; %[ft]
    arrayLength(1)         = 34.9375; %[ft]
    arrayWTO(1)            = 11500; %[lb]
    
% Aero L-29 Delfin
    arrayRange(2)          = 480; %[NM]
    arrayMaxSpeed(2)       = 353; %[knots]
    arrayServiceCeiling(2) = 36000; %[ft]
    arrayROC(2)            = 2755; %[ft/min]
    arrayThrust(2)         = 1960; %[lb]
    arrayWingSpan(2)       = 33.75; %[ft]
    arrayLength(2)         = 35.4583; %[ft]
    arrayWTO(2)            = 7231; %[lb]
    
% Aero L-39
    arrayRange(3)          = 805; %[NM]
    arrayMaxSpeed(3)       = 394; %[knots]
    arrayServiceCeiling(3) = 37225; %[ft]
    arrayROC(3)            = 3740; %[ft/min]
    arrayThrust(3)         = 3306; %[lb]
    arrayWingSpan(3)       = 29.8958; %[ft]
    arrayLength(3)         = 39.7292; %[ft]
    arrayWTO(3)            = 8377; %[lb]

% Aerospatiale C M 170
    arrayRange(4)          = 755; %[NM]
    arrayMaxSpeed(4)       = 392; %[knots]
    arrayServiceCeiling(4) = 39375; %[ft]
    arrayROC(4)            = 3740; %[ft/min]
    arrayThrust(4)         = 2116; %[lb]
    arrayWingSpan(4)       = 39.8333; %[ft]
    arrayLength(4)         = 33.0; %[ft]
    arrayWTO(4)            = 7187; %[lb]
    
% Dassault/Dornier Alpha Jet
    arrayRange(5)          = 1590; %[NM]
    arrayMaxSpeed(5)       = 568; %[knots]
    arrayServiceCeiling(5) = 49200; %[ft]
    arrayROC(5)            = 11200; %[ft/min]
    arrayThrust(5)         = 5952; %[lb]
    arrayWingSpan(5)       = 29.9167; %[ft]
    arrayLength(5)         = 40.3125; %[ft]
    arrayWTO(5)            = 13227; %[lb]
    
% Fuji T1
    arrayRange(6)          = 1050; %[NM]
    arrayMaxSpeed(6)       = 500; %[knots]
    arrayServiceCeiling(6) = 47200; %[ft]
    arrayROC(6)            = 6500; %[ft/min]
    arrayThrust(6)         = 4000; %[lb]
    arrayWingSpan(6)       = 34.4167; %[ft]
    arrayLength(6)         = 39.75; %[ft]
    arrayWTO(6)            = 9150; %[lb]
    
% Grumman TF-9J Cougar
    arrayRange(7)          = 868; %[NM]
    arrayMaxSpeed(7)       = 612; %[knots]
    arrayServiceCeiling(7) = 50000; %[ft]
    arrayROC(7)            = 6750; %[ft/min]
    arrayThrust(7)         = 8500; %[lb]
    arrayWingSpan(7)       = 78.3333; %[ft]
    arrayLength(7)         = 48.5; %[ft]
    arrayWTO(7)            = 20600; %[lb]
    
% Hawker Siddeley Hawk 128
    arrayRange(8)          = 1360; %[NM]
    arrayMaxSpeed(8)       = 554; %[knots]
    arrayServiceCeiling(8) = 44500; %[ft]
    arrayROC(8)            = 9300; %[ft/min]
    arrayThrust(8)         = 6500; %[lb]
    arrayWingSpan(8)       = 32.5833; %[ft]
    arrayLength(8)         = 40.75; %[ft]
    arrayWTO(8)            = 20000; %[lb]
    
% Hindustan HJT-16 Mk 1
    arrayRange(9)          = 332; %[NM]
    arrayMaxSpeed(9)       = 375; %[knots]
    arrayServiceCeiling(9) = 30000; %[ft]
    arrayROC(9)            = 0; %[ft/min]
    arrayThrust(9)         = 2500; %[lb]
    arrayWingSpan(9)       = 35.1042; %[ft]
    arrayLength(9)         = 34.75; %[ft]
    arrayWTO(9)            = 7936; %[lb]
    
% Hispano HA-2200 Super SAETA
    arrayRange(10)          = 917; %[NM]
    arrayMaxSpeed(10)       = 377; %[knots]
    arrayServiceCeiling(10) = 42650; %[ft]
    arrayROC(10)            = 3346; %[ft/min]
    arrayThrust(10)         = 2116; %[lb]
    arrayWingSpan(10)       = 35.8333; %[ft]
    arrayLength(10)         = 29.4167; %[ft]
    arrayWTO(10)            = 8157; %[lb]
    
% Lockheed T-33A
    arrayRange(11)          = 1168; %[NM]
    arrayMaxSpeed(11)       = 521; %[knots]
    arrayServiceCeiling(11) = 47500; %[ft]
    arrayROC(11)            = 4870; %[ft/min]
    arrayThrust(11)         = 5200; %[lb]
    arrayWingSpan(11)       = 38.875; %[ft]
    arrayLength(11)         = 37.75; %[ft]
    arrayWTO(11)            = 11965; %[lb]
    
% Mikoyan/Gurevich MiG-15bis
    arrayRange(12)          = 1080; %[NM]
    arrayMaxSpeed(12)       = 580; %[knots]
    arrayServiceCeiling(12) = 50850; %[ft]
    arrayROC(12)            = 10400; %[ft/min]
    arrayThrust(12)         = 5950; %[lb]
    arrayWingSpan(12)       = 33.0625; %[ft]
    arrayLength(12)         = 33.1458; %[ft]
    arrayWTO(12)            = 12756; %[lb]
    
% Mitsubishi T-2
    arrayRange(13)          = 1550; %[NM]
    arrayMaxSpeed(13)       = 920; %[knots]
    arrayServiceCeiling(13) = 50025; %[ft]
    arrayROC(13)            = 35006; %[ft/min]
    arrayThrust(13)         = 14280; %[lb]
    arrayWingSpan(13)       = 25.8333; %[ft]
    arrayLength(13)         = 58.5833; %[ft]
    arrayWTO(13)            = 21274; %[lb]
    
% Morane-Saulnier 760 Paris I
    arrayRange(14)          = 807; %[NM]
    arrayMaxSpeed(14)       = 352; %[knots]
    arrayServiceCeiling(14) = 33000; %[ft]
    arrayROC(14)            = 2264; %[ft/min]
    arrayThrust(14)         = 1760; %[lb]
    arrayWingSpan(14)       = 33.25; %[ft]
    arrayLength(14)         = 33.5833; %[ft]
    arrayWTO(14)            = 7650; %[lb]
    
% Northrop T-38A Talon
    arrayRange(15)          = 1093; %[NM]
    arrayMaxSpeed(15)       = 820; %[knots]
    arrayServiceCeiling(15) = 53600; %[ft]
    arrayROC(15)            = 30000; %[ft/min]
    arrayThrust(15)         = 7700; %[lb]
    arrayWingSpan(15)       = 25.25; %[ft]
    arrayLength(15)         = 46.375; %[ft]
    arrayWTO(15)            = 12093; %[lb]
    
% Rockwell International T-2C
    arrayRange(16)          = 909; %[NM]
    arrayMaxSpeed(16)       = 453; %[knots]
    arrayServiceCeiling(16) = 40425; %[ft]
    arrayROC(16)            = 6200; %[ft/min]
    arrayThrust(16)         = 5900; %[lb]
    arrayWingSpan(16)       = 38.125; %[ft]
    arrayLength(16)         = 38.2917; %[ft]
    arrayWTO(16)            = 13179; %[lb]
    
% Rockwell International T-39D
    arrayRange(17)          = 2170; %[NM]
    arrayMaxSpeed(17)       = 478; %[knots]
    arrayServiceCeiling(17) = 40000; %[ft]
    arrayROC(17)            = 0; %[ft/min]
    arrayThrust(17)         = 6000; %[lb]
    arrayWingSpan(17)       = 44.5; %[ft]
    arrayLength(17)         = 44.0; %[ft]
    arrayWTO(17)            = 17760; %[lb]
    
% Soko G2-A Galeb
    arrayRange(18)          = 669; %[NM]
    arrayMaxSpeed(18)       = 438; %[knots]
    arrayServiceCeiling(18) = 39375; %[ft]
    arrayROC(18)            = 4500; %[ft/min]
    arrayThrust(18)         = 2500; %[lb]
    arrayWingSpan(18)       = 38.125; %[ft]
    arrayLength(18)         = 33.9167; %[ft]
    arrayWTO(18)            = 7438; %[lb]
    
% WSK-Mielec TS-11 ISKRA
    arrayRange(19)          = 787; %[NM]
    arrayMaxSpeed(19)       = 388; %[knots]
    arrayServiceCeiling(19) = 41000; %[ft]
    arrayROC(19)            = 3150; %[ft/min]
    arrayThrust(19)         = 2205; %[lb]
    arrayWingSpan(19)       = 33.0208; %[ft]
    arrayLength(19)         = 36.8958; %[ft]
    arrayWTO(19)            = 8377; %[lb]
    
% Number of Aircraft
numberOfAircraft = 19; 
aircraftName = {'012345678987654';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';};

% Military Patrol, Bomber, and Transports
function milBombTransportB_T
% Military Bomber, and Transport
% Reference: Jane's Pocket Book of Military Transport and Training
% Aircraft, Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayROC...
     arrayServiceCeiling numberOfAircraft aircraftName arrayThrust...
      arrayWingSpan arrayLength

% BAC VC10 Model 1106
    arrayPayload(1)        = 57400; %[lb]
    arrayRange(1)          = 3385; %[NM]
    arrayCruiseSpeed(1)    = 504; %[knots]
    arrayServiceCeiling(1) = 43000; %[ft]
    arrayROC(1)            = 3050; %[ft/min]
    arrayThrust(1)         = 87200; %[lb]
    arrayWingSpan(1)       = 146.1667; %[ft]
    arrayLength(1)         = 158.6667; %[ft]
    arrayWTO(1)            = 323000; %[lb]

% Boeing B-52H Stratofortress
    arrayPayload(2)        = 70000; %[lb]
    arrayRange(2)          = 10855; %[NM]
    arrayCruiseSpeed(2)    = 565; %[knots]
    arrayServiceCeiling(2) = 60000; %[ft]
    arrayROC(2)            = 6270; %[ft/min]
    arrayThrust(2)         = 136000; %[lb]
    arrayWingSpan(2)       = 185; %[ft]
    arrayLength(2)         = 157.5833; %[ft]
    arrayWTO(2)            = 488000; %[lb]
    
% Boeing C-17 Globmaster III
    arrayPayload(3)        = 170900; %[lb]
    arrayRange(3)          = 2420; %[NM]
    arrayCruiseSpeed(3)    = 450; %[knots]
    arrayServiceCeiling(3) = 45000; %[ft]
    arrayROC(3)            = 0; %[ft/min]
    arrayThrust(3)         = 161760; %[lb]
    arrayWingSpan(3)       = 169.8; %[ft]
    arrayLength(3)         = 174.0; %[ft]
    arrayWTO(3)            = 585000; %[lb]
    
% Boeing KC-135A Stratotanker
    arrayPayload(4)        = 150000; %[lb]
    arrayRange(4)          = 1303; %[NM]
    arrayCruiseSpeed(4)    = 462; %[knots]
    arrayServiceCeiling(4) = 50000; %[ft]
    arrayROC(4)            = 1290; %[ft/min]
    arrayThrust(4)         = 55000; %[lb]
    arrayWingSpan(4)       = 130.8333; %[lb]
    arrayLength(4)         = 136.25; %[ft]
    arrayWTO(4)            = 297000; %[lb]
    
% Boeing T-43A
    arrayPayload(5)        = 35700; %[lb]
    arrayRange(5)          = 2600; %[NM]
    arrayCruiseSpeed(5)    = 509; %[knots]
    arrayServiceCeiling(5) = 36745; %[ft]
    arrayROC(5)            = 3760; %[ft/min]
    arrayThrust(5)         = 29000; %[lb]
    arrayWingSpan(5)       = 93.0; %[ft]
    arrayLength(5)         = 100.0; %[ft]
    arrayWTO(5)            = 115500; %[lb]
    
% Boeing VC-137C
    arrayPayload(6)        = 53300; %[lb]
    arrayRange(6)          = 6080; %[NM]
    arrayCruiseSpeed(6)    = 478; %[knots]
    arrayServiceCeiling(6) = 38500; %[ft]
    arrayROC(6)            = 3550; %[ft/min]
    arrayThrust(6)         = 72000; %[lb]
    arrayWingSpan(6)       = 145.75; %[ft]
    arrayLength(6)         = 152.9167; %[ft]
    arrayWTO(6)            = 328000; %[lb]

% Dassault Mirage IV-A
    arrayPayload(7)        = 2000; %[lb]
    arrayRange(7)          = 2200; %[NM]
    arrayCruiseSpeed(7)    = 1262; %[knots]
    arrayServiceCeiling(7) = 66000; %[ft]
    arrayROC(7)            = 0; %[ft/min]
    arrayThrust(7)         = 30860; %[lb]
    arrayWingSpan(7)       = 38.875; %[ft]
    arrayLength(7)         = 77.1042; %[ft]
    arrayWTO(7)            = 73800; %[lb]

% Douglas EA-3B Skywarrior
    arrayPayload(8)        = 13100; %[lb] % From bombs and ammo
    arrayRange(8)          = 2520; %[NM]
    arrayCruiseSpeed(8)    = 520; %[knots]
    arrayServiceCeiling(8) = 41000; %[ft]
    arrayROC(8)            = 0; %[ft/min]
    arrayThrust(8)         = 21000; %[lb]
    arrayWingSpan(8)       = 72.5; %[ft]
    arrayLength(8)         = 76.3333; %[ft]
    arrayWTO(8)            = 73000; %[lb]
    
% Douglas EB-66C Destroyer
    arrayPayload(9)        = 15300; %[lb] % From bombs and ammo
    arrayRange(9)          = 1300; %[NM]
    arrayCruiseSpeed(9)    = 459; %[knots]
    arrayServiceCeiling(9) = 39400; %[ft]
    arrayROC(9)            = 5000; %[ft/min]
    arrayThrust(9)         = 20000; %[lb]
    arrayWingSpan(9)       = 72.5; %[ft]
    arrayLength(9)         = 75.1667; %[ft]
    arrayWTO(9)            = 83000; %[lb]
    
% English Electric Canberra B Mk 6
    arrayPayload(10)        = 8500; %[lb] % From bombs and ammo
    arrayRange(10)          = 3290; %[NM]
    arrayCruiseSpeed(10)    = 504; %[knots]
    arrayServiceCeiling(10) = 48000; %[ft]
    arrayROC(10)            = 3400; %[ft/min]
    arrayThrust(10)         = 14800; %[lb]
    arrayWingSpan(10)       = 63.9583; %[ft]
    arrayLength(10)         = 65.5; %[ft]
    arrayWTO(10)            = 55000; %[lb]
    
% Handley Page Victor K Mk 2
    arrayPayload(11)        = 35000; %[lb] % From bombs
    arrayRange(11)          = 3995; %[NM]
    arrayCruiseSpeed(11)    = 521; %[knots]
    arrayServiceCeiling(11) = 60000; %[ft]
    arrayROC(11)            = 0; %[ft/min]
    arrayThrust(11)         = 82400; %[lb]
    arrayWingSpan(11)       = 120.0; %[ft]
    arrayLength(11)         = 114.9167; %[ft]
    arrayWTO(11)            = 170000; %[lb]
   
% Hawker Siddeley Vulcan B.2
    arrayPayload(12)        = 21000; %[lb] % From bombs
    arrayRange(12)          = 2265; %[NM]
    arrayCruiseSpeed(12)    = 493; %[knots]
    arrayServiceCeiling(12) = 43999; %[ft]
    arrayROC(12)            = 0; %[ft/min]
    arrayThrust(12)         = 80000; %[lb]
    arrayWingSpan(12)       = 111.0; %[ft]
    arrayLength(12)         = 99.9167; %[ft]
    arrayWTO(12)            = 204000; %[lb]
    
% Ilyushin II-28
    arrayPayload(13)        = 5000; %[lb] % From bombs and ammo
    arrayRange(13)          = 1219; %[NM]
    arrayCruiseSpeed(13)    = 420; %[knots]
    arrayServiceCeiling(13) = 41000; %[ft]
    arrayROC(13)            = 3000; %[ft/min]
    arrayThrust(13)         = 11900; %[lb]
    arrayWingSpan(13)       = 70.375; %[ft]
    arrayLength(13)         = 57.9167; %[ft]
    arrayWTO(13)            = 46297; %[lb]
    
% Kawasaki C-1    
    arrayPayload(14)        = 17640; %[lb]
    arrayRange(14)          = 700; %[NM]
    arrayCruiseSpeed(14)    = 355; %[knots]
    arrayServiceCeiling(14) = 39375; %[ft]
    arrayROC(14)            = 3880; %[ft/min]
    arrayThrust(14)         = 29000; %[lb]
    arrayWingSpan(14)       = 100.3958; %[ft]
    arrayLength(14)         = 95.1458; %[ft]
    arrayWTO(14)            = 85320; %[lb]
    
% Lockheed C-5A Galaxy
    arrayPayload(15)        = 265000; %[lb]
    arrayRange(15)          = 5500; %[NM]
    arrayCruiseSpeed(15)    = 450; %[knots]
    arrayServiceCeiling(15) = 34000; %[ft]
    arrayROC(15)            = 2500; %[ft/min]
    arrayThrust(15)         = 164000; %[lb]
    arrayWingSpan(15)       = 222.7083; %[ft]
    arrayLength(15)         = 247.8333; %[ft]
    arrayWTO(15)            = 764500; %[lb]

% Martin B-57B
    arrayPayload(16)        = 5000; %[lb] % From bombs and ammo
    arrayRange(16)          = 2720; %[NM]
    arrayCruiseSpeed(16)    = 414; %[knots]
    arrayServiceCeiling(16) = 45100; %[ft]
    arrayROC(16)            = 6180; %[ft/min]
    arrayThrust(16)         = 14440; %[lb]
    arrayWingSpan(16)       = 64.0; %[ft]
    arrayLength(16)         = 65.5; %[ft]
    arrayWTO(16)            = 53720; %[lb]
    
% Myasishchev M-4
    arrayPayload(17)        = 119049; %[lb] % From bombs
    arrayRange(17)          = 4400; %[NM]
    arrayCruiseSpeed(17)    = 452; %[knots]
    arrayServiceCeiling(17) = 36000; %[ft]
    arrayROC(17)            = 0; %[ft/min]
    arrayThrust(17)         = 38560; %[lb]
    arrayWingSpan(17)       = 165.6667; %[ft]
    arrayLength(17)         = 154.8333; %[ft]
    arrayWTO(17)            = 400139; %[lb]
    
% Rockwell B-1B Lancer
    arrayPayload(18)        = 125000; %[lb] % From bombs
    arrayRange(18)          = 5100; %[NM]
    arrayCruiseSpeed(18)    = 608; %[knots]
    arrayServiceCeiling(18) = 60000; %[ft]
    arrayROC(18)            = 5678; %[ft/min]
    arrayThrust(18)         = 123120; %[lb]
    arrayWingSpan(18)       = 137.0; %[ft]
    arrayLength(18)         = 146.0; %[ft]
    arrayWTO(18)            = 477000; %[lb]
    
% Tupolev Tu-16
    arrayPayload(19)        = 19800; %[lb] % From bombs
    arrayRange(19)          = 2605; %[NM]
    arrayCruiseSpeed(19)    = 510; %[knots]
    arrayServiceCeiling(19) = 42650; %[ft]
    arrayROC(19)            = 0; %[ft/min]
    arrayThrust(19)         = 41900; %[lb]
    arrayWingSpan(19)       = 110.0; %[ft]
    arrayLength(19)         = 120.0; %[ft]
    arrayWTO(19)            = 150000; %[lb]

% Number of Aircraft
numberOfAircraft = 19;

aircraftName = {'01234567898765432';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';};
function milBombTransportT_Y
% Military Bomber, and Transport
% Reference: Jane's Pocket Book of Military Transport and Training
% Aircraft, Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange...
    arrayROC arrayServiceCeiling numberOfAircraft...
    aircraftName arrayThrust arrayWingSpan arrayLength

% Tupolev Tu-22
    arrayPayload(1)        = 27000; %[lb] % From bombs and ammo
    arrayRange(1)          = 1215; %[NM]
    arrayCruiseSpeed(1)    = 800; %[knots]
    arrayServiceCeiling(1) = 60000; %[ft]
    arrayROC(1)            = 2500; %[ft/min]
    arrayThrust(1)         = 52000; %[lb]
    arrayWingSpan(1)       = 90.875; %[ft]
    arrayLength(1)         = 132.9583; %[ft]
    arrayWTO(1)            = 184970; %[lb]
    
% Number of Aircraft
numberOfAircraft = 1;

aircraftName = {'01234567898765432';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';};

function combineMilBombTransportData
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayROC...
        arrayServiceCeiling arrayThrust numberOfAircraft
    
  milBombTransportB_T;
  masterArrayPayload        = zeros(1,20); % 20 is the total number of MilBombTransport aircraft
  masterArrayCruiseSpeed    = zeros(1,20);
  masterArrayServiceCeiling = zeros(1,20);
  masterArrayRange          = zeros(1,20);
  masterArrayROC            = zeros(1,20);
  masterArrayThrust         = zeros(1,20);
  masterArrayWTO            = zeros(1,20);
  
  for i = 1:numberOfAircraft
      masterArrayPayload(i) = arrayPayload(i);
  end
      for i = 1:numberOfAircraft
          masterArrayCruiseSpeed(i) = arrayCruiseSpeed(i);
      end
          for i = 1:numberOfAircraft
              masterArrayServiceCeiling(i) = arrayServiceCeiling(i);
          end
              for i = 1:numberOfAircraft
                  masterArrayRange(i) = arrayRange(i);
              end
                  for i = 1:numberOfAircraft
                      masterArrayROC(i) = arrayROC(i);
                  end
                      for i = 1:numberOfAircraft
                          masterArrayThrust(i) = arrayThrust(i);
                      end
                          for i = 1:numberOfAircraft
                              masterArrayWTO(i) = arrayWTO(i);
                          end
  milBombTransportT_Y;
  j = 19 + 1; % 19 is the number of aircraft in the first tab
  for i = 1:numberOfAircraft
      masterArrayPayload(j) = arrayPayload(i);
      j = j + 1;
  end
        j = 19 + 1;
        for i = 1:numberOfAircraft
            masterArrayCruiseSpeed(j) = arrayCruiseSpeed(i);
            j = j + 1;
        end
            j = 19 + 1;
            for i = 1:numberOfAircraft
                masterArrayServiceCeiling(j) = arrayServiceCeiling(i);
                j = j + 1;
            end
                j = 19 + 1;
                for i = 1:numberOfAircraft
                     masterArrayRange(j) = arrayRange(i);
                     j = j + 1;
                end
                    j = 19 + 1;
                    for i = 1:numberOfAircraft
                        masterArrayROC(j) = arrayROC(i);
                        j = j + 1;
                    end
                        j = 19 + 1;
                        for i = 1:numberOfAircraft
                            masterArrayThrust(j) = arrayThrust(i);
                            j = j + 1;
                        end
                            j = 19 + 1;
                            for i = 1:numberOfAircraft
                                masterArrayWTO(j) = arrayWTO(i);
                                j = j + 1;
                            end
                        
    arrayPayload        = masterArrayPayload;
    arrayCruiseSpeed    = masterArrayCruiseSpeed;
    arrayServiceCeiling = masterArrayServiceCeiling;
    arrayRange          = masterArrayRange;
    arrayROC            = masterArrayROC;
    arrayThrust         = masterArrayThrust;
    arrayWTO            = masterArrayWTO;

function milPatrolRecon
% Military Patrol
% Reference: Jane's Pocket Book of Military Transport and Training
% Aircraft, Jane's Pocket Book of Major Combat Aircraft, Wikipedia
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayROC...
       arrayServiceCeiling numberOfAircraft aircraftName arrayThrust...
      arrayWingSpan arrayLength

% Boeing E-3A
    arrayPayload(1)        = 4000; %[lb] % From crew and equipment
    arrayRange(1)          = 4000; %[NM]
    arrayCruiseSpeed(1)    = 461; %[knots]
    arrayServiceCeiling(1) = 35000; %[ft]
    arrayROC(1)            = 0; %[ft/min]
    arrayThrust(1)         = 86000; %[lb]
    arrayWingSpan(1)       = 145.75; %[ft]
    arrayLength(1)         = 152.9167; %[ft]
    arrayWTO(1)            = 347000; %[lb]

% Grumman EA-6B Prowler
    arrayPayload(2)         = 18000; %[lb]
    arrayRange(2)          = 2022; %[NM]
    arrayCruiseSpeed(2)    = 566; %[knots]
    arrayServiceCeiling(2) = 37600; %[ft]
    arrayROC(2)            = 12900; %[ft/min]
    arrayThrust(2)         = 20800; %[lbs]
    arrayWingSpan(2)       = 53.0; %[ft] % Swept
    arrayLength(2)         = 59.8333; %[ft]
    arrayWTO(2)            = 58500; %[lbs]    
    
% Hawker Siddeley Nimrod MR Mk 1
    arrayPayload(3)        = 20000; %[lb] % From bombs
    arrayRange(3)          = 5000; %[NM]
    arrayCruiseSpeed(3)    = 426; %[knots]
    arrayServiceCeiling(3) = 43999; %[ft]
    arrayROC(3)            = 0; %[ft/min]
    arrayThrust(3)         = 11500; %[lb]
    arrayWingSpan(3)       = 114.8333; %[ft]
    arrayLength(3)         = 126.75; %[ft]
    arrayWTO(3)            = 192000; %[lb]    
    
% Lockheed S-3A Viking
    arrayPayload(4)        = 4900; %[lb] % From armament
    arrayRange(4)          = 3386; %[NM]
    arrayCruiseSpeed(4)    = 350; %[knots]
    arrayServiceCeiling(4) = 40900; %[ft]
    arrayROC(4)            = 5120; %[ft/min]
    arrayThrust(4)         = 18550; %[lb]
    arrayWingSpan(4)       = 68.6667; %[ft]
    arrayLength(4)         = 53.3333; %[ft]
    arrayWTO(4)            = 52539; %[lb]
    
% Lockheed SR-71A Blackbird
    arrayPayload(5)        = 3900; %[lb] % From reconnisance equipment
    arrayRange(5)          = 2824; %[NM]
    arrayCruiseSpeed(5)    = 1720; %[knots]
    arrayServiceCeiling(5) = 85000; %[ft]
    arrayROC(5)            = 11820; %[ft/min]
    arrayThrust(5)         = 65000; %[lb]
    arrayWingSpan(5)       = 55.5833; %[ft]
    arrayLength(5)         = 107.4167; %[ft]
    arrayWTO(5)            = 172000; %[lb]
    
% Lockheed U-2S
    arrayPayload(6)        = 440; %[lb] % From reconnisance equipment
    arrayRange(6)          = 6090; %[NM]
    arrayCruiseSpeed(6)    = 470; %[knots]
    arrayServiceCeiling(6) = 80000; %[ft]
    arrayROC(6)            = 9000; %[ft/min]
    arrayThrust(6)         = 17000; %[lb]
    arrayWingSpan(6)       = 105.0; %[ft]
    arrayLength(6)         = 63.0; %[ft]
    arrayWTO(6)            = 40000; %[lb]

% Number of Aircraft
numberOfAircraft = 6;
aircraftName = {'01234567898765432';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';};

% Passenger and Business Jets
function passengerJetA_H
% Passenger Jet
% Reference Jane's Pocket Book of Commercial Transport Aircraft, Wikipedia,
% Flugzeug.net
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayPassengers...
    arrayCrew arrayROC arrayServiceCeiling numberOfAircraft aircraftName...
      arrayThrust arrayWingSpan arrayLength

% Aerospatiale SE 210 Caravelle 12
    arrayPayload(1)        = 29100; %[lb]
    arrayPassengers(1)     = 139;
    arrayCrew(1)           = 3;
    arrayRange(1)          = 1728; %[NM]
    arrayCruiseSpeed(1)    = 445; %[knots]
    arrayServiceCeiling(1) = 60000; %[ft]
    arrayROC(1)            = 0; %[ft/min]
    arrayThrust(1)         = 29000; %[lb]
    arrayWingSpan(1)       = 112.5; %[ft]
    arrayLength(1)         = 118.875; %[ft]
    arrayWTO(1)            = 127870; %[lb]
    
% Aerospatiale/BAC Concorde
    arrayPayload(2)        = 25000; %[lb]
    arrayPassengers(2)     = 144;
    arrayCrew(2)           = 4;
    arrayRange(2)          = 3450; %[NM]
    arrayCruiseSpeed(2)    = 2307; %[knots]
    arrayServiceCeiling(2) = 60000; %[ft]
    arrayROC(2)            = 5000; %[ft/min]
    arrayThrust(2)         = 152200; %[lb]
    arrayWingSpan(2)       = 83.833; %[ft]
    arrayLength(2)         = 202.3; %[ft]
    arrayWTO(2)            = 389000; %[lb]
    
% Airbus A-300B2
    arrayPayload(3)        = 70020; %[lb]
    arrayPassengers(3)     = 331;
    arrayCrew(3)           = 5;
    arrayRange(3)          = 1850; %[NM]
    arrayCruiseSpeed(3)    = 505; %[knots]
    arrayServiceCeiling(3) = 40000; %[ft]
    arrayROC(3)            = 0; %[ft/min]
    arrayThrust(3)         = 102000; %[lb]
    arrayWingSpan(3)       = 147.1042; %[ft]
    arrayLength(3)         = 175.75; %[ft]
    arrayWTO(3)            = 302000; %[lb]
    
% BAC One-Eleven Series 475
    arrayPayload(4)        = 21269; %[lb]
    arrayPassengers(4)     = 89;
    arrayCrew(4)           = 2;
    arrayRange(4)          = 1620; %[NM]
    arrayCruiseSpeed(4)    = 470; %[knots]
    arrayServiceCeiling(4) = 35000; %[ft]
    arrayROC(4)            = 2600; %[ft/min]
    arrayThrust(4)         = 25100; %[lb]
    arrayWingSpan(4)       = 93.5; %[ft]
    arrayLength(4)         = 93.5; %[ft]
    arrayWTO(4)            = 98500; %[lb]
    
% BAC One-Eleven Series 500
    arrayPayload(5)        = 26418; %[lb]
    arrayPassengers(5)     = 119;
    arrayCrew(5)           = 2;
    arrayRange(5)          = 1285; %[NM]
    arrayCruiseSpeed(5)    = 470; %[knots]
    arrayServiceCeiling(5) = 35000; %[ft]
    arrayROC(5)            = 2400; %[ft/min]
    arrayThrust(5)         = 25100; %[lb]
    arrayWingSpan(5)       = 93.5; %[ft]
    arrayLength(5)         = 107; %[ft]
    arrayWTO(5)            = 104500; %[lb]
    
% BAC 1151 Super VC10
    arrayPayload(6)        = 50406; %[lb]
    arrayPassengers(6)     = 174;
    arrayCrew(6)           = 5;
    arrayRange(6)          = 4100; %[NM]
    arrayCruiseSpeed(6)    = 505; %[knots]
    arrayServiceCeiling(6) = 43000; %[ft]
    arrayROC(6)            = 2300; %[ft/min]
    arrayThrust(6)         = 87200; %[lb]
    arrayWingSpan(6)       = 146.1667; %[ft]
    arrayLength(6)         = 171.6667; %[ft]
    arrayWTO(6)            = 33500; %[lb]
    
% Boeing 707-120B
    arrayPayload(7)        = 46849; %[lb]
    arrayPassengers(7)     = 181;
    arrayCrew(7)           = 4;
    arrayRange(7)          = 3675; %[NM]
    arrayCruiseSpeed(7)    = 537; %[knots]
    arrayServiceCeiling(7) = 42000; %[ft]
    arrayROC(7)            = 5050; %[ft/min]
    arrayThrust(7)         = 72000; %[lb]
    arrayWingSpan(7)       = 130.8333; %[ft]
    arrayLength(7)         = 145.0833; %[ft]
    arrayWTO(7)            = 257000; %[lb]
    
% Boeing 707-320B Intercontinental
    arrayPayload(8)        = 53900; %[lb]
    arrayPassengers(8)     = 195;
    arrayCrew(8)           = 5;
    arrayRange(8)          = 5420; %[NM]
    arrayCruiseSpeed(8)    = 525; %[knots]
    arrayServiceCeiling(8) = 39000; %[ft]
    arrayROC(8)            = 4000; %[ft/min]
    arrayThrust(8)         = 76000; %[lb]
    arrayWingSpan(8)       = 145.75; %[ft]
    arrayLength(8)         = 152.9167; %[ft]
    arrayWTO(8)            = 333600; %[lb]
    
% Boeing 727-100
    arrayPayload(9)        = 29000; %[lb]
    arrayPassengers(9)     = 131;
    arrayCrew(9)           = 3;
    arrayRange(9)          = 1760; %[NM]
    arrayCruiseSpeed(9)    = 527; %[knots]
    arrayServiceCeiling(9) = 36500; %[ft]
    arrayROC(9)            = 2900; %[ft/min]
    arrayThrust(9)         = 42000; %[lb]
    arrayWingSpan(9)       = 108; %[ft]
    arrayLength(9)         = 133.1667; %[ft]
    arrayWTO(9)            = 169000; %[lb]
    
% Boeing 727-200 Advanced
    arrayPayload(10)        = 41000; %[lb]
    arrayPassengers(10)     = 189;
    arrayCrew(10)           = 3;
    arrayRange(10)          = 2500; %[NM]
    arrayCruiseSpeed(10)    = 520; %[knots]
    arrayServiceCeiling(10) = 33500; %[ft]
    arrayROC(10)            = 2600; %[ft/min]
    arrayThrust(10)         = 45000; %[lb]
    arrayWingSpan(10)       = 108; %[ft]
    arrayLength(10)         = 153.1667; %[ft]
    arrayWTO(10)            = 190500; %[lb]
    
% Boeing 737-100
    arrayPassengers(11)     = 115;
    arrayCrew(11)           = 2;
    arrayRange(11)          = 2200; %[NM]
    arrayCruiseSpeed(11)    = 509; %[knots]
    arrayServiceCeiling(11) = 37000; %[ft]
    arrayROC(11)            = 3760; %[ft/min]
    arrayThrust(11)         = 42000; %[lb]
    arrayWingSpan(11)       = 93; %[ft]
    arrayLength(11)         = 94; %[ft]
    arrayWTO(11)            = 110000; %[lb]
    
% Boeing 737-200
    arrayPayload(12)        = 35700; %[lb]
    arrayPassengers(12)     = 130;
    arrayCrew(12)           = 2;
    arrayRange(12)          = 2060; %[NM]
    arrayCruiseSpeed(12)    = 500; %[knots]
    arrayServiceCeiling(12) = 37000; %[ft]
    arrayROC(12)            = 3760; %[ft/min]
    arrayThrust(12)         = 42000; %[lb]
    arrayWingSpan(12)       = 93; %[ft]
    arrayLength(12)         = 100; %[ft]
    arrayWTO(12)            = 115500; %[lb]
    
% Boeing 747-200B
    arrayPayload(13)        = 164745; %[lb]
    arrayPassengers(13)     = 500;
    arrayCrew(13)           = 3;
    arrayRange(13)          = 5748; %[NM]
    arrayCruiseSpeed(13)    = 528; %[knots]
    arrayServiceCeiling(13) = 45000; %[ft]
    arrayROC(13)            = 0; %[ft/min]
    arrayThrust(13)         = 180000; %[lb]
    arrayWingSpan(13)       = 195.6667; %[ft]
    arrayLength(13)         = 231.333; %[ft]
    arrayWTO(13)            = 77500; %[lb]
    
% Convair 880-M
    arrayPayload(14)        = 26780; %[lb]
    arrayPassengers(14)     = 110;
    arrayCrew(14)           = 5;
    arrayRange(14)          = 2500; %[NM]
    arrayCruiseSpeed(14)    = 482; %[knots]
    arrayServiceCeiling(14) = 41000; %[ft]
    arrayROC(14)            = 0; %[ft/min]
    arrayThrust(14)         = 46600; %[lb]
    arrayWingSpan(14)       = 120.0; %[ft]
    arrayLength(14)         = 129.333; %[ft]
    arrayWTO(14)            = 192700; %[lb]
    
% Convair 990A Coronado
    arrayPayload(15)        = 26440; %[lb]
    arrayPassengers(15)     = 106;
    arrayCrew(15)           = 5;
    arrayRange(15)          = 3300; %[NM]
    arrayCruiseSpeed(15)    = 543; %[knots]
    arrayServiceCeiling(15) = 41000; %[ft]
    arrayROC(15)            = 0; %[ft/min]
    arrayThrust(15)         = 46600; %[lb]
    arrayWingSpan(15)       = 120.0; %[ft]
    arrayLength(15)         = 139.2083; %[ft]
    arrayWTO(15)            = 253000; %[lb]
    
% Dassault Mercure 100
    arrayPayload(16)        = 32850; %[lb]
    arrayPassengers(16)     = 140;
    arrayCrew(16)           = 4;
    arrayRange(16)          = 950; %[NM]
    arrayCruiseSpeed(16)    = 503; %[knots]
    arrayServiceCeiling(16) = 39000; %[ft]
    arrayROC(16)            = 3300; %[ft/min]
    arrayThrust(16)         = 31000; %[lb]
    arrayWingSpan(16)       = 100.25; %[ft]
    arrayLength(16)         = 114.2917; %[ft]
    arrayWTO(16)            = 120150; %[lb]
    
% De Havilland Comet 4C
    arrayPayload(17)        = 22900; %[lb]
    arrayPassengers(17)     = 101;
    arrayCrew(17)           = 4;
    arrayRange(17)          = 2250; %[NM]
    arrayCruiseSpeed(17)    = 471; %[knots]
    arrayServiceCeiling(17) = 42000; %[ft]
    arrayROC(17)            = 0; %[ft/min]
    arrayThrust(17)         = 42000; %[lb]
    arrayWingSpan(17)       = 114.8333; %[ft]
    arrayLength(17)         = 118.0; %[ft]
    arrayWTO(17)            = 162000; %[lb]

% Fokker-VFW F28 Fellowship Mk 2000
    arrayPayload(18)        = 17962; %[lb]
    arrayPassengers(18)     = 79;
    arrayCrew(18)           = 3;
    arrayRange(18)          = 470; %[NM]
    arrayCruiseSpeed(18)    = 458; %[knots]
    arrayServiceCeiling(18) = 35000; %[ft]
    arrayROC(18)            = 0; %[ft/min]
    arrayThrust(18)         = 19700; %[lb]
    arrayWingSpan(18)       = 77.3542; %[ft]
    arrayLength(18)         = 97.1458; %[ft]
    arrayWTO(18)            = 65000; %[lb]

% Hawker Siddeley Trident 2E
    arrayPayload(19)        = 26800; %[lb]
    arrayPassengers(19)     = 149;
    arrayCrew(19)           = 3;
    arrayRange(19)          = 2300; %[NM]
    arrayCruiseSpeed(19)    = 525; %[knots]
    arrayServiceCeiling(19) = 35000; %[ft]
    arrayROC(19)            = 0; %[ft/min]
    arrayThrust(19)         = 35880; %[lb]
    arrayWingSpan(19)       = 98.0; %[ft]
    arrayLength(19)         = 114.75; %[ft]
    arrayWTO(19)            = 143500; %[lb]

% Number of Aircraft
numberOfAircraft = 19;
aircraftName = {'012345678987654321';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';};
function passengerJetH_Y
% Passenger Jet
% Reference Jane's Pocket Book of Commercial Transport Aircraft, Wikipedia,
% Flugzeug.net
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayPassengers...
    arrayCrew arrayROC arrayServiceCeiling numberOfAircraft aircraftName...
      arrayThrust arrayWingSpan arrayLength
  
% Hawker Siddeley Trident 3B
    arrayPayload(1)        = 32396; %[lb]
    arrayPassengers(1)     = 152;
    arrayCrew(1)           = 3;
    arrayRange(1)          = 1942; %[NM]
    arrayCruiseSpeed(1)    = 522; %[knots]
    arrayServiceCeiling(1) = 35000; %[ft]
    arrayROC(1)            = 0; %[ft/min]
    arrayThrust(1)         = 41130; %[lb]
    arrayWingSpan(1)       = 98.0; %[ft]
    arrayLength(1)         = 131.1667; %[ft]
    arrayWTO(1)            = 150000; %[lb]
    
% Ilyushin II-62M-200
    arrayPayload(2)        = 50700; %[lb]
    arrayPassengers(2)     = 198;
    arrayCrew(2)           = 5;
    arrayRange(2)          = 4315; %[NM]
    arrayCruiseSpeed(2)    = 458; %[knots]
    arrayServiceCeiling(2) = 33000; %[ft]
    arrayROC(2)            = 3500; %[ft/min]
    arrayThrust(2)         = 101400; %[lb]
    arrayWingSpan(2)       = 141.75; %[ft]
    arrayLength(2)         = 174.2917; %[ft]
    arrayWTO(2)            = 363760; %[lb]

% Lockheed L-1011-1 Tristar
    arrayPayload(3)        = 86183; %[lb]
    arrayPassengers(3)     = 400;
    arrayCrew(3)           = 5;
    arrayRange(3)          = 3880; %[NM]
    arrayCruiseSpeed(3)    = 823; %[knots]
    arrayServiceCeiling(3) = 42000; %[ft]
    arrayROC(3)            = 2800; %[ft/min]
    arrayThrust(3)         = 126000; %[lb]
    arrayWingSpan(3)       = 155.3333; %[ft]
    arrayLength(3)         = 178.6667; %[ft]
    arrayWTO(3)            = 430000; %[lb]
    
% McDonnell Douglas DC-8 Series 50
    arrayPayload(4)        = 34360; %[lb]
    arrayPassengers(4)     = 179;
    arrayCrew(4)           = 5;
    arrayRange(4)          = 6078; %[NM]
    arrayCruiseSpeed(4)    = 504; %[knots]
    arrayServiceCeiling(4) = 30000; %[ft]
    arrayROC(4)            = 0; %[ft/min]
    arrayThrust(4)         = 68000; %[lb]
    arrayWingSpan(4)       = 142.4167; %[ft]
    arrayLength(4)         = 150.5; %[ft]
    arrayWTO(4)            = 325000; %[lb]
    
% McDonnell Douglas DC-8 Super 63
    arrayPayload(5)        = 67735; %[lb]
    arrayPassengers(5)     = 259;
    arrayCrew(5)           = 5;
    arrayRange(5)          = 6686; %[NM]
    arrayCruiseSpeed(5)    = 521; %[knots]
    arrayServiceCeiling(5) = 30000; %[ft]
    arrayROC(5)            = 2165; %[ft/min]
    arrayThrust(5)         = 76000; %[lb]
    arrayWingSpan(5)       = 148.4167; %[ft]
    arrayLength(5)         = 187.4167; %[ft]
    arrayWTO(5)            = 350000; %[lb]
    
% McDonnell Douglas DC-9 Series 40
    arrayPayload(6)        = 34195; %[lb]
    arrayPassengers(6)     = 125;
    arrayCrew(6)           = 2;
    arrayRange(6)          = 1463; %[NM]
    arrayCruiseSpeed(6)    = 487; %[knots]
    arrayServiceCeiling(6) = 30000; %[ft]
    arrayROC(6)            = 0; %[ft/min]
    arrayThrust(6)         = 29000; %[lb]
    arrayWingSpan(6)       = 93.4167; %[ft]
    arrayLength(6)         = 125.6042; %[ft]
    arrayWTO(6)            = 114000; %[lb]
    
% McDonnell Douglas DC-10 Series 30
    arrayPayload(7)        = 104913; %[lb]
    arrayPassengers(7)     = 380;
    arrayCrew(7)           = 5;
    arrayRange(7)          = 3710; %[NM]
    arrayCruiseSpeed(7)    = 495; %[knots]
    arrayServiceCeiling(7) = 32700; %[ft]
    arrayROC(7)            = 2320; %[ft/min]
    arrayThrust(7)         = 147000; %[lb]
    arrayWingSpan(7)       = 161.3333; %[ft]
    arrayLength(7)         = 181.3958; %[ft]
    arrayWTO(7)            = 555000; %[lb]
    
% Tupolev Tu-104B
    arrayPayload(8)        = 26455; %[lb]
    arrayPassengers(8)     = 100;
    arrayCrew(8)           = 5;
    arrayRange(8)          = 1130; %[NM]
    arrayCruiseSpeed(8)    = 486; %[knots]
    arrayServiceCeiling(8) = 37750; %[ft]
    arrayROC(8)            = 0; %[ft/min]
    arrayThrust(8)         = 42770; %[lb]
    arrayWingSpan(8)       = 113.3333; %[ft]
    arrayLength(8)         = 131.4167; %[ft]
    arrayWTO(8)            = 167550; %[lb]
    
% Tupolev Tu-124V
    arrayPayload(9)        = 13228; %[lb]
    arrayPassengers(9)     = 56;
    arrayCrew(9)           = 4;
    arrayRange(9)          = 660; %[NM]
    arrayCruiseSpeed(9)    = 469; %[knots]
    arrayServiceCeiling(9) = 38400; %[ft]
    arrayROC(9)            = 2400; %[ft/min]
    arrayThrust(9)         = 23810; %[lb]
    arrayWingSpan(9)       = 83.7917; %[ft]
    arrayLength(9)         = 100.3333; %[ft]
    arrayWTO(9)            = 83775; %[lb]
    
% Tupolev Tu-134
    arrayPayload(10)        = 16975; %[lb]
    arrayPassengers(10)     = 72;
    arrayCrew(10)           = 3;
    arrayRange(10)          = 1293; %[NM]
    arrayCruiseSpeed(10)    = 469; %[knots]
    arrayServiceCeiling(10) = 39370; %[ft]
    arrayROC(10)            = 0; %[ft/min]
    arrayThrust(10)         = 29980; %[lb]
    arrayWingSpan(10)       = 95.1458; %[ft]
    arrayLength(10)         = 112.6875; %[ft]
    arrayWTO(10)            = 98105; %[lb]
    
% Tupolev Tu-144
    arrayPayload(11)        = 0; %[lb]
    arrayPassengers(11)     = 140;
    arrayCrew(11)           = 4;
    arrayRange(11)          = 3508; %[NM]
    arrayCruiseSpeed(11)    = 1350; %[knots]
    arrayServiceCeiling(11) = 52000; %[ft]
    arrayROC(11)            = 9840; %[ft/min]
    arrayThrust(11)         = 154320; %[lb]
    arrayWingSpan(11)       = 94.5; %[ft]
    arrayLength(11)         = 215.5417; %[ft]
    arrayWTO(11)            = 396830; %[lb]
    
% Tupolev Tu-154B-2
    arrayPayload(12)        = 44090; %[lb]
    arrayPassengers(12)     = 164;
    arrayCrew(12)           = 4;
    arrayRange(12)          = 2850; %[NM]
    arrayCruiseSpeed(12)    = 526; %[knots]
    arrayServiceCeiling(12) = 39700; %[ft]
    arrayROC(12)            = 0; %[ft/min]
    arrayThrust(12)         = 62850; %[lb]
    arrayWingSpan(12)       = 123.2083; %[ft]
    arrayLength(12)         = 157.1458; %[ft]
    arrayWTO(12)            = 198416; %[lb]
    
% VFW-Fokker VFW 614
    arrayPayload(13)        = 0; %[lb]
    arrayPassengers(13)     = 44;
    arrayCrew(13)           = 2;
    arrayRange(13)          = 359; %[NM]
    arrayCruiseSpeed(13)    = 390; %[knots]
    arrayServiceCeiling(13) = 24925; %[ft]
    arrayROC(13)            = 3360; %[ft/min]
    arrayThrust(13)         = 14960; %[lb]
    arrayWingSpan(13)       = 70.5417; %[ft]
    arrayLength(13)         = 67.5833; %[ft]
    arrayWTO(13)            = 41000; %[lb]
    
% Yakovlev Yak-40
    arrayPayload(14)        = 5070; %[lb]
    arrayPassengers(14)     = 27;
    arrayCrew(14)           = 3;
    arrayRange(14)          = 970; %[NM]
    arrayCruiseSpeed(14)    = 297; %[knots]
    arrayServiceCeiling(14) = 26000; %[ft]
    arrayROC(14)            = 1575; %[ft/min]
    arrayThrust(14)         = 9900; %[lb]
    arrayWingSpan(14)       = 82.0208; %[ft]
    arrayLength(14)         = 66.7917; %[ft]
    arrayWTO(14)            = 30200; %[lb]

% Number of Aircraft
numberOfAircraft = 14;
aircraftName = {'012345678987654321';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';};

function combinePassengerJetData
global arrayPayload arrayWTO arrayCruiseSpeed arrayRange arrayPassengers...
        arrayServiceCeiling arrayThrust arrayCrew arrayROC numberOfAircraft
    
  passengerJetA_H;
  masterArrayCrew           = zeros(1,33); % 33 is the total number of PassengerJet aircraft
  masterArrayROC            = zeros(1,33);
  masterArrayPayload        = zeros(1,33); 
  masterArrayCruiseSpeed    = zeros(1,33);
  masterArrayServiceCeiling = zeros(1,33);
  masterArrayRange          = zeros(1,33);
  masterArrayPassengers     = zeros(1,33);
  masterArrayThrust         = zeros(1,33);
  masterArrayWTO            = zeros(1,33);
  
  for i = 1:numberOfAircraft
      masterArrayPayload(i) = arrayPayload(i);
  end
      for i = 1:numberOfAircraft
          masterArrayCruiseSpeed(i) = arrayCruiseSpeed(i);
      end
          for i = 1:numberOfAircraft
              masterArrayServiceCeiling(i) = arrayServiceCeiling(i);
          end
              for i = 1:numberOfAircraft
                 masterArrayRange(i) = arrayRange(i);
              end
                  for i = 1:numberOfAircraft
                      masterArrayPassengers(i) = arrayPassengers(i);
                  end
                      for i = 1:numberOfAircraft
                          masterArrayThrust(i) = arrayThrust(i);
                      end
                          for i = 1:numberOfAircraft
                              masterArrayCrew(i) = arrayCrew(i);
                          end
                              for i = 1:numberOfAircraft
                                  masterArrayROC(i) = arrayROC(i);
                              end
                                  for i = 1:numberOfAircraft
                                      masterArrayWTO(i) = arrayWTO(i);
                                  end
  passengerJetH_Y;
  j = 19 + 1; % 19 is the number of aircraft in the first tab
  for i = 1:numberOfAircraft
      masterArrayPayload(j) = arrayPayload(i);
      j = j + 1;
  end
        j = 19 + 1;
        for i = 1:numberOfAircraft
            masterArrayCruiseSpeed(j) = arrayCruiseSpeed(i);
            j = j + 1;
        end
            j = 19 + 1;
            for i = 1:numberOfAircraft
                masterArrayServiceCeiling(j) = arrayServiceCeiling(i);
                j = j + 1;
            end
                j = 19 + 1;
                for i = 1:numberOfAircraft
                     masterArrayRange(j) = arrayRange(i);
                     j = j + 1;
                end
                    j = 19 + 1;
                    for i = 1:numberOfAircraft
                        masterArrayPassengers(j) = arrayPassengers(i);
                        j = j + 1;
                    end
                        j = 19 + 1;
                        for i = 1:numberOfAircraft
                            masterArrayThrust(j) = arrayThrust(i);
                            j = j + 1;
                        end
                            j = 19 + 1;
                            for i = 1:numberOfAircraft
                                masterArrayWTO(j) = arrayWTO(i);
                                j = j + 1;
                            end
                        
    arrayCrew           = masterArrayCrew;
    arrayROC            = masterArrayROC;
    arrayPayload        = masterArrayPayload;
    arrayCruiseSpeed    = masterArrayCruiseSpeed;
    arrayServiceCeiling = masterArrayServiceCeiling;
    arrayRange          = masterArrayRange;
    arrayPassengers     = masterArrayPassengers;
    arrayThrust         = masterArrayThrust;
    arrayWTO            = masterArrayWTO;
                        
function businessJet
% Business Jet
% Reference Jane's Pocket Book of Commercial Transport Aircraft
global arrayWTO arrayCruiseSpeed arrayRange arrayPassengers...
    arrayCrew arrayROC arrayServiceCeiling...
    numberOfAircraft aircraftName arrayThrust arrayWingSpan arrayLength

% Aerospatiale SN 601 Corvette
% if businessJet == 1
    arrayPassengers(1)     = 12;
    arrayCrew(1)           = 2;
    arrayRange(1)          = 887; %[NM]
    arrayCruiseSpeed(1)    = 445; %[knots]
    arrayServiceCeiling(1) = 41000; %[ft]
    arrayROC(1)            = 3000; %[ft/min]
    arrayThrust(1)         = 4600; %[lb]
    arrayWingSpan(1)       = 42; %[ft]
    arrayLength(1)         = 45.375; %[ft]
    arrayWTO(1)            = 13450; %[lb]
    
% Cessna Citation 500
% elseif businessJet == 2
    arrayPassengers(2)     = 5;
    arrayCrew(2)           = 2;
    arrayRange(2)          = 1340; %[NM]
    arrayCruiseSpeed(2)    = 348; %[knots]
    arrayServiceCeiling(2) = 35000; %[ft]
    arrayROC(2)            = 2719; %[ft/min]
    arrayThrust(2)         = 4400; %[lb]
    arrayWingSpan(2)       = 43.75; %[ft]
    arrayLength(2)         = 43.5; %[ft]
    arrayWTO(2)            = 10350; %[lb]
    
% Dassault Falcon 20
    arrayPassengers(3)     = 14;
    arrayCrew(3)           = 2;
    arrayRange(3)          = 1927; %[NM]
    arrayCruiseSpeed(3)    = 465; %[knots]
    arrayServiceCeiling(3) = 42000; %[ft]
    arrayROC(3)            = 0; %[ft/min]
    arrayThrust(3)         = 8630; %[lb]
    arrayWingSpan(3)       = 53.5; %[ft]
    arrayLength(3)         = 56.25; %[ft]
    arrayWTO(3)            = 28660; %[lb]

% Gates Learjet 25C
    arrayPassengers(4)     = 8;
    arrayCrew(4)           = 2;
    arrayRange(4)          = 2192; %[NM]
    arrayCruiseSpeed(4)    = 441; %[knots]
    arrayServiceCeiling(4) = 45000; %[ft]
    arrayROC(4)            = 6050; %[ft/min]
    arrayThrust(4)         = 5900; %[lb]
    arrayWingSpan(4)       = 35.5833; %[ft]
    arrayLength(4)         = 47.5833; %[ft]
    arrayWTO(4)            = 15000; %[lb]
    
% Grumman Gulfstream II
    arrayPassengers(5)     = 19;
    arrayCrew(5)           = 3;
    arrayRange(5)          = 3375; %[NM]
    arrayCruiseSpeed(5)    = 511; %[knots]
    arrayServiceCeiling(5) = 43000; %[ft]
    arrayROC(5)            = 4350; %[ft/min]
    arrayThrust(5)         = 22800; %[lb]
    arrayWingSpan(5)       = 68.8333; %[ft]
    arrayLength(5)         = 79.9167; %[ft]
    arrayWTO(5)            = 62000; %[lb]
    
% Hawker Siddeley 125 Series 600B
    arrayPassengers(6)     = 14;
    arrayCrew(6)           = 3;
    arrayRange(6)          = 1560; %[NM]
    arrayCruiseSpeed(6)    = 450; %[knots]
    arrayServiceCeiling(6) = 41000; %[ft]
    arrayROC(6)            = 4900; %[ft/min]
    arrayThrust(6)         = 7500; %[lb]
    arrayWingSpan(6)       = 47.0; %[ft]
    arrayLength(6)         = 50.4792; %[ft]
    arrayWTO(6)            = 25000; %[lb]
    
% IAI 1123 Westwind
    arrayPassengers(7)     = 10;
    arrayCrew(7)           = 2;
    arrayRange(7)          = 1390; %[NM]
    arrayCruiseSpeed(7)    = 365; %[knots]
    arrayServiceCeiling(7) = 45000; %[ft]
    arrayROC(7)            = 4040; %[ft/min]
    arrayThrust(7)         = 6200; %[lb]
    arrayWingSpan(7)       = 44.7917; %[ft]
    arrayLength(7)         = 52.25; %[ft]
    arrayWTO(7)            = 20500; %[lb]
    
% Lockheed Jetstar
    arrayPassengers(8)     = 10;
    arrayCrew(8)           = 2;
    arrayRange(8)          = 1840; %[NM]
    arrayCruiseSpeed(8)    = 495; %[knots]
    arrayServiceCeiling(8) = 37400; %[ft]
    arrayROC(8)            = 5200; %[ft/min]
    arrayThrust(8)         = 13200; %[lb]
    arrayWingSpan(8)       = 54.4167; %[ft]
    arrayLength(8)         = 60.4167; %[ft]
    arrayWTO(8)            = 42000; %[lb]
    
% MBB HFB 320 Hansa
    arrayPassengers(9)     = 12;
    arrayCrew(9)           = 2;
    arrayRange(9)          = 1278; %[NM]
    arrayCruiseSpeed(9)    = 446; %[knots]
    arrayServiceCeiling(9) = 40000; %[ft]
    arrayROC(9)            = 4250; %[ft/min]
    arrayThrust(9)         = 6200; %[lb]
    arrayWingSpan(9)       = 47.5; %[ft]
    arrayLength(9)         = 54.5; %[ft]
    arrayWTO(9)            = 20280; %[lb]
    
% Piaggio PD-808
    arrayPassengers(10)     = 6;
    arrayCrew(10)           = 2;
    arrayRange(10)          = 1148; %[NM]
    arrayCruiseSpeed(10)    = 390; %[knots]
    arrayServiceCeiling(10) = 45000; %[ft]
    arrayROC(10)            = 5400; %[ft/min]
    arrayThrust(10)         = 6720; %[lb]
    arrayWingSpan(10)       = 37.5; %[ft]
    arrayLength(10)         = 42.1667; %[ft]
    arrayWTO(10)            = 18000; %[lb]
    
% Rockwell Sabreliner Series 60
    arrayPassengers(11)     = 10;
    arrayCrew(11)           = 2;
    arrayRange(11)          = 1736; %[NM]
    arrayCruiseSpeed(11)    = 489; %[knots]
    arrayServiceCeiling(11) = 45000; %[ft]
    arrayROC(11)            = 0; %[ft/min]
    arrayThrust(11)         = 6600; %[lb]
    arrayWingSpan(11)       = 44.4375; %[ft]
    arrayLength(11)         = 48.3333; %[ft]
    arrayWTO(11)            = 20000; %[lb]
    
% Number of Aircraft
numberOfAircraft = 11;    
 aircraftName = {'0123456789876543';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';};



