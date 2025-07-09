import { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import api from '../services/api';
import toast from 'react-hot-toast';

const EditarCategoria = () => {
  const [nombre, setNombre] = useState('');
  const navigate = useNavigate();
  const { id } = useParams();

  useEffect(() => {
    const fetchCategoria = async () => {
      try {
        const res = await api.get(`/categorias/${id}`);
        setNombre(res.data.nombre);
      } catch (error) {
        console.error('Error al obtener la categoría', error);
        alert('No se pudo cargar la categoría.');
        navigate('/categorias');
      }
    };

    fetchCategoria();
  }, [id, navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const formData = {
        nombre: nombre.trim(),
      };

      await api.put(`/categorias/${id}`, formData);

      toast.success('✅ Categoría actualizada correctamente', {
        duration: 4000,
        style: {
          borderRadius: '8px',
          background: '#1e293b',
          color: '#fff',
          fontWeight: 'bold',
          padding: '14px 20px',
          fontSize: '16px',
        },
        iconTheme: {
          primary: '#10b981',
          secondary: '#f0fdf4',
        },
      });

      setTimeout(() => {
        navigate('/categorias');
      }, 500);
    } catch (error) {
      console.error('Error actualizando categoría', error);
      alert(
        error.response?.data?.mensaje || 'Error interno al actualizar la categoría'
      );
    }
  };

  const handleCancelar = () => {
    navigate('/categorias');
  };

  return (
    <div className="w-full px-4 md:px-12 lg:px-20 py-10">
      <div className="bg-white p-8 rounded-xl shadow-lg">
        <h2 className="text-4xl font-bold mb-8 text-gray-800 border-b pb-4">
          Editar categoría
        </h2>

        <form onSubmit={handleSubmit} className="grid grid-cols-1 gap-6">
          <div>
            <label htmlFor="nombre" className="block text-2sm font-semibold text-gray-700 mb-2">
              Nombre de la categoría <span className="text-red-500">*</span>
            </label>
            <input
              id="nombre"
              type="text"
              value={nombre}
              onChange={(e) => setNombre(e.target.value)}
              required
              className="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-slate-600"
              placeholder="Ej: Muebles de sala"
            />
          </div>

          <div className="flex justify-end gap-4 pt-4 h-[60px]">
            <button
              type="submit"
              className="text-2xs flex items-center gap-2 bg-slate-800 hover:bg-slate-600 text-white px-4 py-2 rounded-md font-semibold transition cursor-pointer"
            >
              Guardar cambios
            </button>
            <button
              type="button"
              onClick={handleCancelar}
              className="text-2xs bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-2 rounded-md text-sm font-medium transition cursor-pointer"
            >
              Cancelar
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default EditarCategoria;
