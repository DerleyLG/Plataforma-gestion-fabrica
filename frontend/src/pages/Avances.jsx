import React, { useEffect, useState } from 'react';
import { FiCreditCard, FiArrowLeft } from 'react-icons/fi';
import { useNavigate } from 'react-router-dom';
import api from '../services/api';
import { confirmAlert } from 'react-confirm-alert';
import 'react-confirm-alert/src/react-confirm-alert.css';
import '../styles/confirmAlert.css';

const ListaAvances = () => {
  const [avances, setAvances] = useState([]);
  const [mostrarPagados, setMostrarPagados] = useState(false);
  const [trabajadores, setTrabajadores] = useState([]);
  const [idTrabajadorSeleccionado, setIdTrabajadorSeleccionado] = useState('');
  const [seleccionados, setSeleccionados] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchTrabajadores = async () => {
      try {
        const res = await api.get('/trabajadores');
        setTrabajadores(res.data);
      } catch (error) {
        console.error('Error al cargar trabajadores:', error);
      }
    };
    fetchTrabajadores();
  }, []);

  useEffect(() => {
    const fetchAvances = async () => {
      try {
        const endpoint = mostrarPagados
          ? idTrabajadorSeleccionado
            ? `/avances-etapa/pagados?id_trabajador=${idTrabajadorSeleccionado}`
            : `/avances-etapa/pagados`
          : idTrabajadorSeleccionado
            ? `/avances-etapa?id_trabajador=${idTrabajadorSeleccionado}`
            : `/avances-etapa`;

        const res = await api.get(endpoint);
        setAvances(res.data);
        setSeleccionados([]); // limpia selección al cambiar filtro
      } catch (error) {
        console.error('Error al obtener avances:', error);
        setAvances([]);
      }
    };
    fetchAvances();
  }, [idTrabajadorSeleccionado, mostrarPagados]);

  const confirmarPago = (avance) => {
    confirmAlert({
      title: '¿Registrar pago?',
      message: `¿Deseas registrar un pago para el avance de '${avance.nombre_etapa}' del artículo '${avance.descripcion}' realizado por el trabajador '${avance.nombre_trabajador}'?`,
      buttons: [
        {
          label: 'Sí, registrar',
          onClick: () =>
            navigate('/pagos/nuevo', {
              state: { avances: [avance] }
            })
        },
        { label: 'Cancelar' }
      ]
    });
  };

  return (
    <div className="p-6">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-4xl font-bold text-gray-800">Avances de Producción</h2>

        <div className="flex items-center gap-4">
          <button
            onClick={() => setMostrarPagados(!mostrarPagados)}
            className={`px-4 py-2 rounded-md font-semibold transition ${
              mostrarPagados
                ? 'bg-blue-600 hover:bg-blue-500 text-white cursor-pointer'
                : 'bg-gray-300 hover:bg-gray-400 text-gray-800 cursor-pointer'
            }`}
          >
            {mostrarPagados ? 'Ver no pagados' : 'Ver pagados'}
          </button>

          <button
            onClick={() => navigate(-1)}
            className="flex items-center gap-2 px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 rounded-md font-semibold cursor-pointer"
          >
            <FiArrowLeft />
            Volver
          </button>
        </div>
      </div>

      <div className="mb-4">
        <label htmlFor="trabajador" className="block text-sm font-medium text-gray-700 mb-1">
          Selecciona un trabajador:
        </label>
        <select
          id="trabajador"
          value={idTrabajadorSeleccionado}
          onChange={(e) => setIdTrabajadorSeleccionado(e.target.value)}
          className="px-3 py-2 border border-gray-300 rounded-md w-full max-w-xs"
        >
          <option value="">-- Selecciona --</option>
          {trabajadores.map((t) => (
            <option key={t.id_trabajador} value={t.id_trabajador}>
              {t.nombre}
            </option>
          ))}
        </select>
      </div>

      {!idTrabajadorSeleccionado ? (
        <p className="text-gray-500 mt-6">Selecciona un trabajador para ver los avances.</p>
      ) : (
        <div className="overflow-x-auto shadow rounded-lg mt-4">
          <table className="min-w-full table-auto border border-slate-300 bg-white">
            <thead className="bg-slate-200 text-slate-700">
              <tr>
                {!mostrarPagados && <th className="px-4 py-2 text-left">Seleccionar</th>}
                <th className="px-4 py-2 text-left">Orden</th>
                <th className="px-4 py-2 text-left">Artículo</th>
                <th className="px-4 py-2 text-left">Etapa</th>
                <th className="px-4 py-2 text-left">Trabajador</th>
                <th className="px-4 py-2 text-left">Cantidad</th>
                <th className="px-4 py-2 text-left">Costo unitario</th>
                <th className="px-4 py-2 text-left">Fecha</th>
                <th className="px-4 py-2 text-left">Estado</th>
                <th className="px-4 py-2 text-left">Estado de pago</th>
              </tr>
            </thead>
            <tbody>
              {avances.map((avance) => (
                <tr key={avance.id_avance_etapa} className="border-t border-slate-300 hover:bg-slate-50">
                  {!mostrarPagados && (
                    <td className="px-4 py-2">
                      <input
                        type="checkbox"
                        checked={seleccionados.includes(avance.id_avance_etapa)}
                        onChange={(e) => {
                          const updated = e.target.checked
                            ? [...seleccionados, avance.id_avance_etapa]
                            : seleccionados.filter((id) => id !== avance.id_avance_etapa);
                          setSeleccionados(updated);
                        }}
                      />
                    </td>
                  )}
                  <td className="px-4 py-2">
                    #{avance.id_orden_fabricacion} - {avance.nombre_cliente}
                  </td>
                  <td className="px-4 py-2">{avance.descripcion || avance.id_articulo}</td>
                  <td className="px-4 py-2">{avance.nombre_etapa || avance.id_etapa_produccion}</td>
                  <td className="px-4 py-2">{avance.nombre_trabajador || avance.id_trabajador}</td>
                  <td className="px-4 py-2">{avance.cantidad}</td>
                  <td className="px-4 py-2">${avance.costo_fabricacion?.toLocaleString() || 0}</td>
                  <td className="px-4 py-2">
                    {new Date(avance.fecha_registro).toLocaleDateString()}
                  </td>
                  <td className="px-4 py-2 capitalize">{avance.estado}</td>
                  <td className="px-4 py-2">
                    {mostrarPagados ? (
                      <span className="text-green-700 font-semibold">Pagado</span>
                    ) : (
                     <span className="text-green-700 font-semibold">Pendiente</span>
                    )}
                  </td>
                </tr>
              ))}
              {avances.length === 0 && (
                <tr>
                  <td colSpan="10" className="px-4 py-4 text-center text-slate-500">
                    No hay avances registrados.
                  </td>
                </tr>
              )}
            </tbody>
          </table>

          {!mostrarPagados && seleccionados.length > 0 && (
            <div className="mt-4 flex justify-end px-4">
              <button
                onClick={() => {
                  const avancesSeleccionados = avances.filter(av =>
                    seleccionados.includes(av.id_avance_etapa)
                  );
                  navigate('/pagos/nuevo', {
                    state: { avances: avancesSeleccionados }
                  });
                }}
                className="bg-green-700 hover:bg-green-600 text-white px-6 py-2 rounded font-semibold mb-4 cursor-pointer"
              >
                Registrar Pago ({seleccionados.length})
              </button>
            </div>
          )}
        </div>
      )}
    </div>
  );
};

export default ListaAvances;
