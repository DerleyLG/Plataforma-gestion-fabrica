import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import api from "../services/api";
import { FiEye, FiArrowLeft, FiTrash2, FiPlus, FiArrowRight, FiEdit, FiCreditCard } from "react-icons/fi";
import React from "react";
import { confirmAlert } from "react-confirm-alert";
import "react-confirm-alert/src/react-confirm-alert.css";
import "../styles/confirmAlert.css";
import toast from "react-hot-toast";

const OrdenesVenta = () => {
  const [ordenes, setOrdenes] = useState([]);
  const [expandedId, setExpandedId] = useState(null);
  const [mostrarAnuladas, setMostrarAnuladas] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");
  const [estadoFiltro, setEstadoFiltro] = useState('todos');
  const navigate = useNavigate();


  useEffect(() => {
    const fetchOrdenes = async () => {
      try {
        const endpoint = mostrarAnuladas
          ? "/ordenes-venta?estado=anulada"
          : "/ordenes-venta";
        const res = await api.get(endpoint);
        setOrdenes(res.data);
      } catch (error) {
        console.error("Error al cargar las órdenes de venta:", error);
      }
    };

    fetchOrdenes();
  }, [mostrarAnuladas]);

  const handleCrear = () => {
    navigate("/ordenes_venta/nuevo");
  };
  
const handleEdit = (id) => {
    navigate(`/ordenes_venta/editar/${id}`);
  };

  const handleDelete = (id) => {
    confirmAlert({
      title: "Confirmar eliminación",
      message: "¿Seguro que quieres eliminar este registro?",
      buttons: [
        {
          label: "Sí",
          onClick: async () => {
            try {
              await api.delete(`/ordenes-venta/${id}`);
              toast.success("Registro eliminado");
              setOrdenes((prev) =>
                prev.filter((item) => item.id_orden_venta !== id)
              );
            } catch (error) {
              console.log(
                "Error al eliminar",
                error.response?.data || error.message
              );
              const mensajeBackend =
                error.response?.data?.error ||
                error.response?.data?.message ||
                error.message;

              toast.error(mensajeBackend);
            }
          },
        },
        {
          label: "No",
          onClick: () => {},
        },
      ],
    });
  };

  const toggleExpand = async (id) => {
    if (expandedId === id) {
      setExpandedId(null);
      return;
    }

    const orden = ordenes.find((o) => o.id_orden_venta === id);
    if (!orden.detalles) {
      try {
        const res = await api.get(`/detalle-orden-venta/${id}`);
        setOrdenes((prev) =>
          prev.map((o) =>
            o.id_orden_venta === id ? { ...o, detalles: res.data } : o
          )
        );
      } catch (error) {
        console.error("Error al cargar detalles:", error);
        return;
      }
    }
    setExpandedId(id);
  };

  const toggleMostrarAnuladas = () => {
    setMostrarAnuladas((prev) => !prev);
    setExpandedId(null);
  };

  
  const filteredOrdenes = ordenes.filter((orden) => {
    const term = searchTerm.toLowerCase();
    const cliente = orden.cliente_nombre?.toLowerCase() || "";

    // derivar estado del crédito (si aplica) a partir de monto_total y saldo_pendiente
    const montoTotal = Number(orden.monto_total || 0);
    const saldo = Number(orden.saldo_pendiente || 0);
    let estadoDerivado = null;
    if (orden.estado_credito !== null && orden.estado_credito !== undefined) {
      // si hay información de crédito, derivamos para mayor consistencia
      if (saldo === 0) estadoDerivado = 'pagado';
      else if (saldo < montoTotal) estadoDerivado = 'parcial';
      else estadoDerivado = 'pendiente';
    }

    // Si hay filtro por estado y el orden NO es crédito, lo excluimos
    if (estadoFiltro !== 'todos') {
      if (!estadoDerivado) return false;
      if (estadoDerivado !== estadoFiltro) return false;
    }

    if (!orden.fecha) return cliente.includes(term);

    const fecha = new Date(orden.fecha);

    const fechaStr = fecha.toLocaleDateString("es-CO", {
      day: "2-digit",
      month: "2-digit",
      year: "numeric",
    });

    const fechaStrShort = fecha.toLocaleDateString("es-CO", {
      day: "2-digit",
      month: "2-digit",
      year: "2-digit",
    });

    return (
      cliente.includes(term) ||
      fechaStr.includes(term) ||
      fechaStrShort.includes(term)
    );
  });
  return (
    <div className="w-full px-4 md:px-10 lg:px-20 py-10 select-none">
      <div className="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h2 className="text-3xl font-bold text-gray-800 w-full md:w-auto">
          Órdenes de Venta
        </h2>

        <div className="flex w-full md:w-280 items-center gap-4">
          <input
            type="text"
            placeholder="Buscar por cliente"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="flex-grow border border-gray-500 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-slate-600 h-[42px]"
          />
          <div>
            <select
              value={estadoFiltro}
              onChange={(e) => setEstadoFiltro(e.target.value)}
              className="h-[42px] border border-gray-500 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-slate-600"
              title="Filtrar por estado de crédito"
            >
              <option value="todos">Creditos</option>
              <option value="pendiente">Pendientes</option>
              <option value="parcial">Parciales</option>
              <option value="pagado">Pagados</option>
            </select>
          </div>

          <button
            onClick={handleCrear}
            className="h-[42px] flex items-center gap-2 bg-slate-800 hover:bg-slate-600 hover:text-slate-400 text-white px-4 py-2 rounded-md font-semibold transition cursor-pointer"
          >
            <FiPlus size={20} />
            Nueva venta
          </button>
    <button
            onClick={() => navigate("/tesoreria")}
            className="h-[42px] flex items-center gap-2 bg-slate-800 hover:bg-slate-600 hover:text-slate-400 text-white px-4 py-2 rounded-md font-semibold transition cursor-pointer"
          >
            <FiArrowRight size={20} />
            Ir a tesorería
          </button>
          <button
            onClick={toggleMostrarAnuladas}
            className={`h-[42px] flex items-center gap-2 px-4 py-2 rounded-md font-semibold transition cursor-pointer ${
              mostrarAnuladas
                ? "bg-red-600 hover:bg-red-500 text-white"
                : "bg-gray-300 hover:bg-gray-400 text-gray-800"
            }`}
          >
            {mostrarAnuladas ? "Ver activas" : "Ver anuladas"}
          </button>

          <button
            onClick={() => navigate(-1)}
            className="h-[42px] flex items-center bg-gray-300 hover:bg-gray-400 gap-2 text-bg-slate-800 px-4 py-2 rounded-md font-semibold transition cursor-pointer"
          >
            <FiArrowLeft />
            Volver
          </button>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-lg overflow-x-auto">
        <table className="min-w-full text-sm border-spacing-0 border border-gray-300 rounded-lg overflow-hidden text-left">
          <thead className="bg-slate-200 text-gray-700 uppercase font-semibold select-none">
            <tr>
              <th className="px-4 py-3">ID</th>
              <th className="px-4 py-3">Cliente</th>
              <th className="px-4 py-3">Fecha</th>
              <th className="px-4 py-3">Monto Total</th>
              <th className="px-4 py-3">Método de pago</th>
              <th className="px-4 py-3">Estado</th>
              <th className="px-4 py-3">Acciones</th>
            </tr>
          </thead>
          <tbody>
  {filteredOrdenes.length > 0 ? (
    filteredOrdenes.map((orden) => {
  
      // Determinar si la orden está asociada a una venta a crédito.
      const tieneVentaCredito = orden.estado_credito !== null && orden.estado_credito !== undefined;
      const isCreditoPendiente = tieneVentaCredito && orden.estado_credito === "pendiente";
      const isCredito = orden.metodo_pago === "credito" || tieneVentaCredito;

      return (
        <React.Fragment key={orden.id_orden_venta}>
          <tr
            onClick={() => toggleExpand(orden.id_orden_venta)}
            className={`cursor-pointer transition ${
              expandedId === orden.id_orden_venta
                ? "bg-gray-200"
                : "hover:bg-gray-200"
            }`}
          >
            {/* ID orden */}
            <td className="px-4 py-3 font-mono text-gray-700">
              #{orden.id_orden_venta}
            </td>

            {/* Cliente */}
            <td className="px-4 py-3">{orden.cliente_nombre}</td>

            {/* Fecha */}
            <td className="px-4 py-3">
              {orden.fecha
                ? orden.fecha.substring(0, 10).split("-").reverse().join("/")
                : ""}
            </td>

            {/* Monto total */}
            <td className="px-4 py-3">
              ${Number(orden.monto_total || 0).toLocaleString()}
            </td>

            {/* Método de pago */}
            <td className="px-4 py-3">
              {isCredito ? (
                (() => {
                  const montoTotal = Number(orden.monto_total || 0);
                  const saldo = Number(orden.saldo_pendiente || 0);
                  let estadoDerivado = 'pendiente';
                  if (saldo === 0) estadoDerivado = 'pagado';
                  else if (saldo < montoTotal) estadoDerivado = 'parcial';

                  const textClass = estadoDerivado === 'pendiente'
                    ? 'text-red-800'
                    : estadoDerivado === 'parcial'
                    ? 'text-slate-800'
                    : 'text-green-800';

                  return (
                    <span className={`px-2 py-1 rounded-md font-semibold bg-transparent ${textClass}`}>
                      Crédito {estadoDerivado === 'pendiente' ? "(Pendiente)" : estadoDerivado === 'parcial' ? "(Parcial)" : "(Pagado)"}
                    </span>
                  );
                })()
              ) : (
                <span className="px-2 py-1 rounded-md">
                  {orden.metodo_pago || '-'}
                </span>
              )}
            </td>

            {/* Estado general */}
            <td className="px-4 py-3">{orden.estado}</td>

            {/* Acciones */}
              <td className="pl-3 py-3 text-center flex gap-4">
              {!mostrarAnuladas && orden.estado == "pendiente" && (
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    handleEdit(orden.id_orden_venta);
                  }}
                  className="text-yellow-600 hover:text-yellow-400 cursor-pointer"
                  title="Editar"
                >
                  <FiEdit size={18} />
                </button>
              )}

              {!mostrarAnuladas && (
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    handleDelete(orden.id_orden_venta);
                  }}
                  className="text-red-600 hover:text-red-400 cursor-pointer"
                  title="Eliminar"
                >
                  <FiTrash2 size={18} />
                </button>
              )}
              {/* Botón rápido: ir a Ventas por Crédito y abrir drawer para este crédito */}
              {isCredito && orden.id_venta_credito && orden.saldo_pendiente > 0 && (
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    navigate('/ventas_credito', { state: { openCreditId: orden.id_venta_credito, openOrderId: orden.id_orden_venta } });
                  }}
                  className="text-indigo-600 hover:text-indigo-900 cursor-pointer"
                  title="Ir a crédito / Registrar abono"
                >
                  <FiCreditCard size={18} />
                </button>
              )}
            </td>
          </tr>

          {/* Expand detalles */}
          {expandedId === orden.id_orden_venta && (
            <tr>
              <td colSpan="7" className="bg-gray-100 px-6 py-4 border-b">
                <div className="mt-3">
                  <table className="w-full text-sm">
                    <thead className="bg-gray-200 text-gray-700">
                      <tr>
                        <th className="px-2 py-2 border-b border-gray-300">Artículo</th>
                        <th className="px-2 py-2 border-b border-gray-300">Cantidad</th>
                        <th className="px-2 py-2 border-b border-gray-300">Precio Unitario</th>
                        <th className="px-2 py-2 border-b border-gray-300">Subtotal</th>
                      </tr>
                    </thead>
                    <tbody>
                      {orden.detalles?.length > 0 ? (
                        orden.detalles.map((d, i) => (
                          <tr key={i}>
                            <td className="px-2 py-2 border-b border-gray-300">{d.descripcion}</td>
                            <td className="px-2 py-2 border-b border-gray-300">{d.cantidad}</td>
                            <td className="px-2 py-2 border-b border-gray-300">
                              ${Number(d.precio_unitario).toLocaleString()}
                            </td>
                            <td className="px-2 py-2 border-b">
                              ${Number(d.subtotal).toLocaleString()}
                            </td>
                          </tr>
                        ))
                      ) : (
                        <tr>
                          <td colSpan="4" className="text-center py-2 text-gray-500">
                            No hay detalles disponibles.
                          </td>
                        </tr>
                      )}
                    </tbody>
                  </table>
                </div>
              </td>
            </tr>
          )}
        </React.Fragment>
      );
    })
  ) : (
    <tr>
      <td colSpan="7" className="text-center py-6 text-gray-500">
        No se encontraron órdenes que coincidan con la búsqueda.
      </td>
    </tr>
  )}
</tbody>
        </table>
      </div>
    </div>
  );
};

export default OrdenesVenta;
