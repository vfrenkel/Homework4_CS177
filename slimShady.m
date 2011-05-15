function[shade] = slimShady(l_o, h, n)

%assuming monotone shading for this simple example.
l_power = 100000;
coeff = 0.6;

lightDir = l_o - h;
lightDistance = norm(lightDir);
cosLightAngle = dot(n, lightDir) / lightDistance;

dE = ((l_power * cosLightAngle) / (4 * pi * lightDistance^2));
shade = dE * coeff;

end