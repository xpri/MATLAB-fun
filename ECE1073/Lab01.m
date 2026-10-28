clear
clc
startTime = datetime(2020,5,11,12,35,38);
stopTime = startTime + days(2);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);

tleFile = "eccentricOrbitSatellite.tle";
satTwoBodyKeplerian = satellite(sc,tleFile, "Name", "satTwoBodyKeplerian", "orbitPropagator", "two-body-keplerian");
satSGP4 = satellite(sc,tleFile, "Name", "satSGP4", "OrbitPropagator","sgp4");
v = satelliteScenarioViewer(sc);
satSGP4.MarkerColor = "green";
satSGP4.Orbit.LineColor = "green";
satSGP4.LabelFontColor = "green";
camtarget(v,satTwoBodyKeplerian);
play(sc);
[positionTwoBodyKeplerian,velocityTwoBodyKeplerian,time] = states(satTwoBodyKeplerian);
[positionSGP4,velocitySGP4] = states(satSGP4);
sgp4RelativePosition = vecnorm(positionSGP4 - positionTwoBodyKeplerian,2,1);
sgp4RelativePositionKm = sgp4RelativePosition/1000;

sgp4RelativeVelocity = vecnorm(velocitySGP4 - velocityTwoBodyKeplerian,2,1);



plot(time,sgp4RelativeVelocity)
xlabel("Time");
ylabel("Velocity Deviation (m/s)");
grid on;