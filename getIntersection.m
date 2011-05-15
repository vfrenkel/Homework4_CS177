function[hit, normal] = getIntersection(o, d, s_o, s_r)
%getIntersection(o, d, s_o, s_r) - A ray casted from an arbitrary origin o and into an arbitrary direction d is checked to see if it intersects with a sphere defined by origin s_o and radius s_r. →Victor “The Hebrew Hammer” Frenkel
%MAKE SURE YOU HAVE RUN 'format long' before using any part of the raytracer.

tx = o(1) - s_o(1);
ty = o(2) - s_o(2);
tz = o(3) - s_o(3);

a = dot(d, d);
b = 2 * ((d(1) * tx) + (d(2) * ty) + (d(3) * tz));
c = (tx * tx) + (ty * ty) + (tz * tz) - (s_r * s_r);
discriminant = b*b - 4*a*c;

if discriminant < 0 %non-real solutions means no intersection
	hit = NaN;
	normal = NaN;
	return
else if discriminant > 0
	discroot = sqrt(discriminant);
	t1 = (-b + discroot) / (2*a);
	t2 = (-b - discroot) / (2*a);
	
	if t1 > t2 %stabilize
		t = t1;
		t1 = t2;
		t2 = t;
	end
	
	t = 0.0;
	if t1 > 1e-9
		t = t1;
	end
	if t2 > 0 && t <= 1e-9
		t = t2;
	end
	if t < 1e-3
		hit = NaN;
		normal = NaN;
		return
	end
else
	t = -b / (2*a);
	if t < 1e-3
		hit = NaN;
		normal = NaN;
		return
	end
end

hit = o + t*d;
normal = hit - s_o;
normal = normal / norm(normal); %so much normage....

end