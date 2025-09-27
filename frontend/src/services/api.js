import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_URL; 

const api = axios.create({
 baseURL: API_BASE_URL,
});


// Consolidar ambos interceptores en uno solo
api.interceptors.request.use((config) => {
 try {
  const token = localStorage.getItem('token');
  if (token) {
   config.headers = config.headers || {};
   config.headers.Authorization = `Bearer ${token}`;
  }
  // Agrega el registro de depuración aquí
  console.debug('[api] request:', (config.method || '').toUpperCase(), config.url, 'hasToken=', !!token);
 } catch (e) {}
 return config;
});


// Manejo global de respuestas: detectar 401 para depuración/limpieza de sesión
api.interceptors.response.use(
 (res) => res,
 (error) => {
  const status = error?.response?.status;
  if (status === 401) {
   console.warn('[api] 401 Unauthorized received from', error.config?.url);
   try {
    localStorage.removeItem('token');
   } catch (e) {}
  }
  return Promise.reject(error);
 }
);

export default api;
