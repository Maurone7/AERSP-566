import numpy as np; from scipy.integrate import solve_ivp; import matplotlib.pyplot as plt

k, g, G, M, R, delta_u_list, t_span, y0 = 1000, 50, 6.673e-11, 5.98e24, 6.37e6, [10, 100, 300], [0,5], [0,0]
u, u_int = lambda t: np.exp(-G*M/(k*(R**2))*t), lambda t, delta_u: (G*M)/(k*(R**2))*u(t)*10000+np.abs(np.cos(t))*delta_u
non_linear_system = lambda t, y, delta_u: [y[1], -((k * u(t) - g * y[1]) / u_int(t, delta_u) - G * M / (R + y[0]) ** 2)]
linear_system = lambda t, y, delta_u: [y[1], -2*G*M*y[0]/(R**3)-g*y[1]/(u_int(t, delta_u))+(k*10000*u(t)/u_int(t, delta_u))-k*10000*u(t)/u_int(t, delta_u)]
solution = lambda delta_u, function: solve_ivp(function, t_span, y0, args=(delta_u,), t_eval=np.linspace(0, 5, 1000))
 
delta_u = 10
print(solution(delta_u, linear_system))
[plt.plot(np.linspace(0, 5, len(solution(delta_u, linear_system).y[0])), solution(delta_u, linear_system).y[0], '--', color='white') for delta_u in delta_u_list]
[plt.plot(np.linspace(0, 5, len(solution(delta_u, non_linear_system).y[0])), solution(delta_u, non_linear_system).y[0], label=r'$\Delta u={}$'.format(delta_u)) for delta_u in delta_u_list]
plt.xlabel('Time'), plt.ylabel('Altitude'), plt.xlim(0, 5), plt.legend(), plt.savefig('Nonlinear System'), plt.show()