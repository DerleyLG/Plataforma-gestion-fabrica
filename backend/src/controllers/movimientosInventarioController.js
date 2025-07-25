/** const db = require("../database/db");
const inventario = require("../models/movimientosInventarioModel");


const ORIGENES_VÁLIDOS = ['compra', 'produccion', 'ajuste manual'];

// Crear movimiento
const createMovimiento = async (req, res) => {
  try {
    const { id_articulo, cantidad, tipo_movimiento, descripcion, origen } = req.body;

// Validar origen
if (!ORIGENES_VÁLIDOS.includes(origen)) {
  return res.status(400).json({
    error: `Origen inválido. Debe ser uno de: ${ORIGENES_VÁLIDOS.join(', ')}`
  });
}
    // Validaciones
    if (!["entrada","salida","ajuste"].includes(tipo_movimiento)) {
  return res.status(400).json({ error: "Tipo de movimiento inválido. Debe ser 'entrada', 'salida' o 'ajuste'." });
}


    if (!id_articulo || typeof id_articulo !== "number" || cantidad <= 0) {
      return res.status(400).json({ error: "Datos inválidos" });
    }

   
    if (!ORIGENES_VÁLIDOS.includes(origen)) {
      return res.status(400).json({
        error: `Origen inválido. Debe ser uno de: ${ORIGENES_VÁLIDOS.join(", ")}`,
      });
    }
const [[articulo]] = await db.query(
      'SELECT 1 FROM articulos WHERE id_articulo = ?',
      [id_articulo]
    );
    if (!articulo) {
      return res.status(404).json({ error: "Artículo no encontrado." });
    }

    await inventario.create({ id_articulo, cantidad, tipo_movimiento, descripcion, origen });

    const stock_actual = await inventario.calcularStock(id_articulo);
    await db.query(`UPDATE articulos SET stock = ? WHERE id_articulo = ?`, [stock_actual, id_articulo]);

    res.status(201).json({  message: `Movimiento de tipo '${tipo_movimiento}' registrado correctamente`  });
  } catch (error) {
    console.error("Error al crear el movimiento:", error);
    res.status(500).json({ error: "Error al registrar el movimiento." });
  }
};

// Obtener todos los movimientos
const getMovimientos = async (_req, res) => {
  try {
    const movimientos = await inventario.getAll();
    if (!movimientos.length) {
      return res.status(404).json({ error: "No hay movimientos registrados" });
    }
    res.status(200).json(movimientos);
  } catch (error) {
    res.status(500).json({ error: "Error al obtener los movimientos." });
  }
};

// Obtener movimiento por ID
const getMovimientoById = async (req, res) => {
  try {
    const movimiento = await inventario.getById(req.params.id);
    if (!movimiento) {
      return res.status(404).json({ error: "Movimiento no encontrado" });
    }
    res.status(200).json(movimiento);
  } catch (error) {
    res.status(500).json({ error: "Error al obtener el movimiento." });
  }
};

// Actualizar movimiento
const updateMovimiento = (_req, res) => {
  return res.status(403).json({ error: "No se permite modificar movimientos de inventario. Use un movimiento correctivo." });
};

const deleteMovimiento = (_req, res) => {
  return res.status(403).json({ error: "No se permite eliminar movimientos de inventario. Use un movimiento correctivo." });
};


module.exports = {
  createMovimiento,
  getMovimientos,
  getMovimientoById,
  updateMovimiento,
  deleteMovimiento,
};
**/
const MovimientoInventarioModel = require("../models/movimientosInventarioModel"); // Asegúrate de que la ruta sea correcta

// La creación de movimientos que afectan el stock ahora se maneja centralmente
// por InventarioModel.processInventoryMovement, usualmente llamada desde InventarioController
// o desde controladores específicos (ej. LoteController, VentaController).
// Por lo tanto, esta función 'createMovimiento' aquí se vuelve redundante para
// la mayoría de los casos que afectan el stock y debería ser eliminada o repensada.
// Si necesitas un endpoint para crear movimientos *sin* afectar el stock (muy raro),
// su lógica sería diferente.
/*
const createMovimiento = async (req, res) => {
    // Esta función ya no debería existir o debería ser para casos muy específicos
    // que NO actualizan el stock en la tabla 'inventario'.
    // Si el objetivo es registrar un movimiento Y actualizar stock, se usa
    // InventarioModel.processInventoryMovement.
    // ... (lógica anterior, pero sin actualizar stock en 'articulos' ni 'inventario')
};
*/

module.exports = {
  /**
   * Obtiene todos los movimientos de inventario.
   * Ruta: GET /movimientos-inventario
   */
  getMovimientos: async (_req, res) => {
    try {
      const movimientos = await MovimientoInventarioModel.getAll();
      if (!movimientos.length) {
        return res.status(404).json({ error: "No hay movimientos registrados" });
      }
      res.status(200).json(movimientos);
    } catch (error) {
      console.error("Error al obtener los movimientos:", error);
      res.status(500).json({ error: "Error al obtener los movimientos." });
    }
  },

  /**
   * Obtiene un movimiento de inventario por su ID.
   * Ruta: GET /movimientos-inventario/:id
   */
  getMovimientoById: async (req, res) => {
    try {
      const movimiento = await MovimientoInventarioModel.getById(req.params.id);
      if (!movimiento) {
        return res.status(404).json({ error: "Movimiento no encontrado" });
      }
      res.status(200).json(movimiento);
    } catch (error) {
      console.error("Error al obtener el movimiento:", error);
      res.status(500).json({ error: "Error al obtener el movimiento." });
    }
  },

  /**
   * No se permite modificar movimientos de inventario.
   * Ruta: PUT /movimientos-inventario/:id
   */
  updateMovimiento: (_req, res) => {
    return res.status(403).json({ error: "No se permite modificar movimientos de inventario. Use un movimiento correctivo." });
  },

  /**
   * No se permite eliminar movimientos de inventario.
   * Ruta: DELETE /movimientos-inventario/:id
   */
  deleteMovimiento: (_req, res) => {
    return res.status(403).json({ error: "No se permite eliminar movimientos de inventario. Use un movimiento correctivo." });
  },
};
